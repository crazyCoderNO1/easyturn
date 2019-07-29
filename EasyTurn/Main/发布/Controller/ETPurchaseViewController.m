//
//  ETPurchaseViewController.m
//  EasyTurn
//
//  Created by 王翔 on 2019/7/27.
//  Copyright © 2019年 EasyTurn. All rights reserved.
//

#import "ETPurchaseViewController.h"

@interface ETPurchaseViewController () <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *tab;

@end

@implementation ETPurchaseViewController

- (UITableView *) tab {
    if (!_tab) {
        _tab=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, Screen_Width, Screen_Height) style:UITableViewStyleGrouped];
        _tab.delegate=self;
        _tab.dataSource=self;
        _tab.tableHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0,0,0,0.01)];
        _tab.sectionFooterHeight = 0;
        _tab.sectionHeaderHeight = 10;
    }
    return _tab;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title=@"发布求购";
    self.navigationController.navigationBarHidden=NO;
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
