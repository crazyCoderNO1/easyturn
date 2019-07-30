//
//  AppDelegate.m
//  EasyTurn
//
//  Created by 程立 on 2019/7/18.
//  Copyright © 2019 EasyTurn. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "ETLoginViewController.h"
#import "WXApi.h"
#import <AlipaySDK/AlipaySDK.h>
@interface AppDelegate ()<WXApiDelegate>

@end

@implementation AppDelegate
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString*, id> *)options
{
    if ([url.host isEqualToString:@"safepay"]) {
        // 支付跳转支付宝钱包进行支付，处理支付结果
        [[AlipaySDK defaultService] processOrderWithPaymentResult:url standbyCallback:^(NSDictionary *resultDic) {
            NSLog(@"result = %@",resultDic);
        }];
        
        // 授权跳转支付宝钱包进行支付，处理支付结果
        [[AlipaySDK defaultService] processAuth_V2Result:url standbyCallback:^(NSDictionary *resultDic) {
            NSLog(@"result = %@",resultDic);
            // 解析 auth code
            NSString *result = resultDic[@"result"];
            NSString *authCode = nil;
            if (result.length>0) {
                NSArray *resultArr = [result componentsSeparatedByString:@"&"];
                for (NSString *subResult in resultArr) {
                    if (subResult.length > 10 && [subResult hasPrefix:@"auth_code="]) {
                        authCode = [subResult substringFromIndex:10];
                        break;
                    }
                }
            }
            NSLog(@"授权结果 authCode = %@", authCode?:@"");
        }];
    }
    //此处是微信支付
    if ([url.scheme isEqualToString:@"wx6aa68fa297ad59ee"])
    {
        return  [WXApi handleOpenURL:url delegate:(id<WXApiDelegate>)self];
    }
    return YES;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //[[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleLightContent];
    [WXApi registerApp:@"wx6aa68fa297ad59ee"];
    
    EMOptions *options = [EMOptions optionsWithAppkey:@"1196190727046562#yzvip"];
    options.apnsCertName = @"istore_dev";
    [[EMClient sharedClient] initializeSDKWithOptions:options];
    [self huanxin];

    //设置根控制器
    [self appConfigProvider];
    //统一设置导航栏
    [self setUpNavigationBar];
    if ([SSCacheManager isInstallorUpdate]) {
        //新安装用户
        [self loginViewController];
        
    }else{
        UserInfoModel *userInfoModel = [UserInfoModel loadUserInfoModel];
        if (userInfoModel.token) {
            //跳转首页
            [self mainViewController];
            
        }else{
            //跳转登录页面
            NSUserDefaults* user=[NSUserDefaults standardUserDefaults];
            NSString* token=[user objectForKey:@"token"];

            if (!token) {
                [self loginViewController];
            }else
            {
                 [self mainViewController];
            }
        }
    }
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loginSuccessNotification) name:LOGINSELECTCENTERINDEX object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loginOutNotification) name:LOGINOFFSELECTCENTERINDEX object:nil];
    return YES;
}
-(void)huanxin
{
    NSDictionary *params = @{
                             };
    [HttpTool get:[NSString stringWithFormat:@"user/getJimUser"] params:params success:^(id responseObj) {
        NSLog(@"");
        NSUserDefaults* user=[NSUserDefaults standardUserDefaults];
        NSDictionary* a=responseObj[@"data"];
        [user setObject:[a objectForKey:@"auroraName"] forKey:@"huanxin"];
        [user synchronize];
        [[EMClient sharedClient] loginWithUsername:[a objectForKey:@"auroraName"]
                                          password:[a objectForKey:@"password"]
                                        completion:^(NSString *aUsername, EMError *aError) {
                                            if (!aError) {
                                                NSLog(@"登录成功");
                                            } else {
                                                NSLog(@"登录失败");
                                            }
                                        }];
        
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];
}
//微信回调代理
- (void)onResp:(BaseResp *)resp{
    
    // =============== 获得的微信登录授权回调 ============
    if ([resp isMemberOfClass:[SendAuthResp class]])  {
        NSLog(@"******************获得的微信登录授权******************");
        
        SendAuthResp *aresp = (SendAuthResp *)resp;
        if (aresp.errCode != 0 ) {
            dispatch_async(dispatch_get_main_queue(), ^{
//                [self showError:@"微信授权失败"];
                NSLog(@"微信授权失败");
            });
            return;
        }
        //授权成功获取 OpenId
        //    授权成功获取 OpenId
        NSString *code = aresp.code;
        NSLog(@"%@",code);
//        [self getWeiXinOpenId:code];
        
        
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        NSString *accessUrlStr = [NSString stringWithFormat:@"https://api.weixin.qq.com/sns/oauth2/access_token?appid=wx6aa68fa297ad59ee&secret=a297f2affb4467edc1984eead3c04c48&code=%@&grant_type=authorization_code", code];
        NSLog(@"===%@",accessUrlStr);
        
        // 设置请求格式
        manager.requestSerializer = [AFJSONRequestSerializer serializer];
        // 设置返回格式
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        // 返回数据解析类型
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html",@"text/plain" ,nil];
        [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        manager.requestSerializer.timeoutInterval = 60;
        
        [manager GET:accessUrlStr parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            //数据解析
            NSMutableDictionary*resDict = (NSMutableDictionary *)[responseObject mj_JSONObject];
            NSLog(@"请求access的response = %@", resDict);
            NSDictionary *accessDict = [NSDictionary dictionaryWithDictionary:resDict];
            NSString *accessToken = [accessDict objectForKey:@"access_token"];
            NSString *openID = [accessDict objectForKey:@"openid"];
            NSString *refreshToken = [accessDict objectForKey:@"refresh_token"];
            // 本地持久化，以便access_token的使用、刷新或者持续
            if (accessToken && ![accessToken isEqualToString:@""] && openID && ![openID isEqualToString:@""]) {
                [[NSUserDefaults standardUserDefaults] setObject:accessToken forKey:@"access_token"];
                [[NSUserDefaults standardUserDefaults] setObject:openID forKey:@"openid"];
                [[NSUserDefaults standardUserDefaults] setObject:refreshToken forKey:@"refresh_token"];
                [[NSUserDefaults standardUserDefaults] synchronize]; // 命令直接同步到文件里，来避免数据的丢失
            }
            [self wechatLoginByRequestForUserInfo:code];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"获取access_token时出错 = %@", error);
        }];
        
        // =============== 获得的微信支付回调 ============
        if([resp isKindOfClass:[PayResp class]]){
            //支付返回结果，实际支付结果需要去微信服务器端查询
        }
    }

}
//// 获取用户个人信息（UnionID机制）
- (void)wechatLoginByRequestForUserInfo:(NSString*)code {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSString *accessToken = [[NSUserDefaults standardUserDefaults] objectForKey:@"access_token"];
    NSString *openID = [[NSUserDefaults standardUserDefaults] objectForKey:@"openid"];
    NSString *userUrlStr = [NSString stringWithFormat:@"%@/userinfo?access_token=%@&openid=%@", @"https://api.weixin.qq.com/sns", accessToken, openID];
    // 请求用户数据
    // 设置请求格式
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    // 设置返回格式
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    // 返回数据解析类型
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html",@"text/plain" ,nil];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    manager.requestSerializer.timeoutInterval = 60;
    [manager GET:userUrlStr parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //数据解析
        NSMutableDictionary*resDict = (NSMutableDictionary *)[responseObject mj_JSONObject];
        NSLog(@"请求用户信息的response = %@", resDict);
        
        [self mainViewController];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"获取用户信息时出错 = %@", error);
    }];
}
#pragma mark - 版本配置管理
- (void)appConfigProvider {
    //判断当前版本号与app存储的版本号相等
    NSString *strAppVersion = [[SSCacheManager sharedCacheManagerForApp] currentConfigVersion];
    //首次安装APP
    if (strAppVersion == nil && strAppVersion.length == 0) {
        //保存app版本号
        [[SSCacheManager sharedCacheManagerForApp] setConfigVersion:APP_VERSION];
        //保存首次安装状态
        [SSCacheManager setIsInstallorUpdate:YES];
    }else{
        //更新APP
        if (![APP_VERSION isEqualToString:strAppVersion]) {
            //保存app版本号
            [[SSCacheManager sharedCacheManagerForApp] setConfigVersion:APP_VERSION];
            //保存首次安装状态
            [SSCacheManager setIsInstallorUpdate:NO];
        }else{
            //保存:不是首次安装
            [SSCacheManager setIsInstallorUpdate:NO];
        }
    }
}

#pragma mark - 主页面
- (void)mainViewController {
    [self.window.rootViewController removeFromParentViewController];
    MainViewController * mainvc = [[MainViewController alloc]init];
    SSNavigationController * naviRoot = [[SSNavigationController alloc] initWithRootViewController:mainvc];
    naviRoot.navigationBarHidden = NO;
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen]bounds]];
    [self.window setRootViewController:naviRoot];
    [self.window setBackgroundColor:kACColorWhite];
    [self.window makeKeyAndVisible];
}




    


#pragma mark - 登录页面
- (void)loginViewController {
    [self.window.rootViewController removeFromParentViewController];
    ETLoginViewController * loginvc = [[ETLoginViewController alloc]init];
    SSNavigationController *naviRoot = [[SSNavigationController alloc] initWithRootViewController:loginvc];
    naviRoot.navigationBarHidden = YES;
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen]bounds]];
    [self.window setRootViewController:naviRoot];
    [self.window setBackgroundColor:kACColorWhite];
    [self.window makeKeyAndVisible];
    
}

- (void)setUpNavigationBar {
    // 设置是 广泛使用WRNavigationBar，还是局部使用WRNavigationBar，目前默认是广泛使用
    [WRNavigationBar wr_widely];
    [WRNavigationBar wr_setBlacklist:@[@"SpecialController",
                                       @"TZPhotoPickerController",
                                       @"TZGifPhotoPreviewController",
                                       @"TZAlbumPickerController",
                                       @"TZPhotoPreviewController",
                                       @"TZVideoPlayerController",
                                       @"TZImagePickerController"]];
    // 设置导航栏默认的背景颜色
    [WRNavigationBar wr_setDefaultNavBarBarTintColor:kACColorBlue_Theme];
    // 设置导航栏所有按钮的默认颜色
    [WRNavigationBar wr_setDefaultNavBarTintColor:kACColorBlackTypeface];
    // 设置导航栏标题默认颜色
    [WRNavigationBar wr_setDefaultNavBarTitleColor:kACColorBlackTypeface];
    // 统一设置状态栏样式
    [WRNavigationBar wr_setDefaultStatusBarStyle:UIStatusBarStyleLightContent];
    // 如果需要设置导航栏底部分割线隐藏，可以在这里统一设置
    [WRNavigationBar wr_setDefaultNavBarShadowImageHidden:YES];
}


#pragma mark - 登录成功通知
- (void)loginSuccessNotification {
    
    [self mainViewController];
    
}

#pragma mark - 退出登录通知
- (void)loginOutNotification {
    
    [self loginViewController];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
