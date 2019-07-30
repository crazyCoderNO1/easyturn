//
//  ETAPViewController.m
//  EasyTurn
//
//  Created by 王翔 on 2019/7/30.
//  Copyright © 2019 EasyTurn. All rights reserved.
//

#import "ETAPViewController.h"
#import <AlipaySDK/AlipaySDK.h>
@interface ETAPViewController ()

@end

@implementation ETAPViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString *appid = @"2019052665415366";
    NSString *privateKey = @"MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCi1f2zFmPgjfOnw+d7kVCwgkHtf+CumRxkKRsNSBWktPQB/A0qdHuHfF5RoSWOzrtBHSzCDZjatgyPgoo2uhxAVB4bxrTLOIGULlsbxCC0rUEigNwSPssyn7zJLsUlXUfmxMMW26OUQ7s5sk8HWT7pDZi2jL6nUnyTbzLJO7//UgFrOe1Ngl7Fm+pwc8O7wHLqm+QX+uKs4hZ9JALW6SXGcEGzfmSH7kscVnM9DYuhQakn3gVhrbUq4GQj2bMl6B6KPlZR4OIPFlAJ87O9R6nAhThR3fJ+D9a55GgPgxbk9/Tiz3fOfte6r0wTwF3Skhl5F1fvWPNWEiO8BLtaSmqRAgMBAAECggEBAJINWfZtmLvq1qadIl1E45jN3JBHaKFyF3MHI4pwI2mOHGZDSxPPUpUdSgPxhBxo9K/cmS6cv4M8UlvN/GZF290fFbpYKgU085STV4i6C5PC6m8mIT4EMIGBoPTaDF4NItarmUhBTKFJdv6zHgs7Ux/54AWsi7zMUYxz6ptwCi/YUBWHt/+cVSYTSeN+Uve936KpPEste+QnUTO3qmxkK+p1dVdH2R/HjmEB6nc4o5YBRboAs9xTkTpS/Buol+DrE4sWUn68MK0mXYSO/Khq+ZzBG0BOfLmLflHS8XkdZO6dTo0AeEEsJEURpt32Kb5G8FZKS8aLUlekSqqU1aYtLYECgYEA4MS+s0hhR434GDMMqgv4YNMCoxxZj76QoLkMTmTXQX1Kdk6hfX2KPGkFRuU+d4dyuRYhC5t5yqtte621pAxou6At0DDxS1XqAOid0Gko0oNowzNYdQzR3aJTP7NJw0H/Aip9VvBr9vUuADxv+dfYqerFmZ+nr40rZ5ojhsRak7kCgYEAuXY8mBECKpZBocO0H0c9GCBAs8oj27m0IaOMNhHdG12wWz9i/Bp1RtW9AdUgLxUBXKuruLI7oF3Bz7jL7EmJ44lQEzPMkVxaavANIHe85R+2FktcyHH/uOAGjl1Ti0bp8bVR8KQUcIb5qX6JI3GokftXbBEALv+HUpQ2F/E7qZkCgYAckaVTkF2dBLSGDucLLh5R4EAzj0Tq+mPTqfGgfTzG/C/cvb3U/4H0j7y1+Clqc/LnB6MHoKloU0XFNJ0jztf5ETEBh1cEJlVp7Ccy+ErSBxXnybzyk8CRFTLTo+w6P0c0dUYdKM3wQ9Wm/geVkBPf9RFMp3he3eiocHUXihmhMQKBgE0l8CLZwGrywi6GeGEigzmMAR5JEg2O/G2Z2PONDssZeAkdHxH795kVxGAExjSPqldgWjike8VD+yFrn/iUxrVOI285dvloz3v4i51b8cnmHRq9EsWXFmdTWabTD7O6NgsEACf4OUBuBWEKcAW8fADt6vnbQJZMWYByguYGxWjRAoGBANxwqks45sPGzH6pi56hHD8jsVpUetZRhhc3Awr8814EQ6ULd9y10+fBGEVo3b2u/6P3n65CGkIpKKzYijDPiLX/crVKj+1eF9RsqPbX+uR2iALeptREQl5/DBWh1S8i254cfskzzlUYzdicuvooZBl3Dfe4kN+riYl2cXSnIs1s";
    [[AlipaySDK defaultService] payOrder:@"此处是从后台拿到的订单签名信息"  fromScheme:@"这里边填写第三步配置的URL Scheme" callback:^(NSDictionary *resultDic) {
        NSLog(@"=====%@",resultDic);
        if ([resultDic[@"resultStatus"]intValue] == 9000) {
            NSLog(@"成功");
        } else {
            NSLog(@"失败");
        }
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
