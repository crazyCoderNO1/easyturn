//
//  ETMineViewController.m
//  EasyTurn
//
//  Created by 程立 on 2019/7/18.
//  Copyright © 2019 EasyTurn. All rights reserved.
//

#import "ETMineViewController.h"
#import "Masonry.h"
#import "ETMineVIew.h"
#import "ETMETableViewCell.h"
#import "ETVIPViewController.h"
#import "ETAuthenticateViewController.h"
#import "ETPutViewController.h"
#import "ETAccountViewController.h"
#import "UserMegViewController.h"
#import "ETStoreUpViewController.h"
#import "ETProductModel.h"
@interface ETMineViewController ()<UITableViewDataSource,UITableViewDelegate,AccountBindingDelegate>

@property (nonatomic,strong)UITableView        *tableView;
@property (nonatomic,strong)NSMutableArray     *dataSource;
@property (nonatomic, strong) NSMutableArray *products;

@end

static NSString *const cellIdentifier =@"cellIdentifier";
@implementation ETMineViewController
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;
}
- (UITableView *) tableView {
    if (!_tableView) {
        _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, Screen_Width, Screen_Height-kStatusBarHeight) style:UITableViewStylePlain];
        _tableView.delegate=self;
        _tableView.dataSource=self;
        [_tableView registerClass:[ETMETableViewCell class] forCellReuseIdentifier:cellIdentifier];
        ETMineVIew *mineview = [[ETMineVIew alloc] init];
        mineview.frame = CGRectMake(0,0,Screen_Width,488);
        mineview.layer.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0].CGColor;
        _tableView.tableHeaderView = mineview;
        _tableView.rowHeight=158;
        mineview.delegate=self;
        
    }
    return _tableView;
}
-(NSMutableArray *)dataSource
{
    if (!_dataSource)
    {
        _dataSource=[NSMutableArray array];
        
    }
    return _dataSource;
}
-(void)viewDidLoad
{
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
    ETMineVIew*etmine=[[ETMineVIew alloc]init];
    etmine.delegate=self;
    [self PostUI];
}

#pragma mark - 出售全部订单
- (void)PostUI {
    NSMutableDictionary* dic=[NSMutableDictionary new];
    NSDictionary *params = @{
                             @"page" : @"1",
                             @"pageSize": @"10",
                             @"cityId": @(2)
                             };
    [HttpTool get:[NSString stringWithFormat:@"release/dynamic"] params:params success:^(id responseObj) {
        _products=[NSMutableArray new];
        NSDictionary* a=responseObj[@"data"];
        for (NSDictionary* prod in responseObj[@"data"]) {
            ETProductModel* p=[ETProductModel mj_objectWithKeyValues:prod];
            [_products addObject:p];
        }
        //        NSLog(@"");
        [_tableView reloadData];
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    return self.dataSource.count;
    return 3;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ETMETableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];

    return cell;
    
//    ETMETableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
//    cell=[[ETMETableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
//    return cell;
}

//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    [_tableView deselectRowAtIndexPath:indexPath animated:YES];
//}


- (void)putjumpWeb:(UIButton *)sender {
    ETPutViewController*putVC=[ETPutViewController new];
    UIBarButtonItem *backItem = [UIBarButtonItem new];
    backItem.title = @"返回";
    self.navigationItem.backBarButtonItem = backItem;
    [self.navigationController pushViewController:putVC animated:YES];
}


-(void)imgjumpWeb:(UIImageView *)sender
{
    UserMegViewController*user=[[UserMegViewController alloc]init];
    UIBarButtonItem *backItem = [UIBarButtonItem new];
    backItem.title = @"返回";
    self.navigationItem.backBarButtonItem = backItem;
    [self.navigationController pushViewController:user animated:YES];
}

- (void)jumpWebVC:(UIButton*)sender
{
    ETVIPViewController *webVC = [ETVIPViewController new];
    UIBarButtonItem *backItem = [UIBarButtonItem new];
    backItem.title = @"返回";
    self.navigationItem.backBarButtonItem = backItem;
    [self.navigationController pushViewController:webVC animated:YES];
}


- (void)jumpWebVC1:(UIButton*)sender
{
    ETAuthenticateViewController *webVC = [ETAuthenticateViewController new];
    UIBarButtonItem *backItem = [UIBarButtonItem new];
    backItem.title = @"返回";
    self.navigationItem.backBarButtonItem = backItem;
    [self.navigationController pushViewController:webVC animated:YES];
}

- (void)jumpWebVC2:(UIButton*)sender
{
    ETStoreUpViewController *webVC = [ETStoreUpViewController new];
    UIBarButtonItem *backItem = [UIBarButtonItem new];
    backItem.title = @"返回";
    self.navigationItem.backBarButtonItem = backItem;
    [self.navigationController pushViewController:webVC animated:YES];
}

- (void)jumpWebVC3:(UIButton*)sender
{
    ETAccountViewController *webVC = [ETAccountViewController new];
    UIBarButtonItem *backItem = [UIBarButtonItem new];
    backItem.title = @"返回";
    self.navigationItem.backBarButtonItem = backItem;
    [self.navigationController pushViewController:webVC animated:YES];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [_tableView deselectRowAtIndexPath:indexPath animated:YES];
    
   ETMETableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    // 2
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    // 3点击没有颜色改变
    cell.selected = NO;
}

@end
