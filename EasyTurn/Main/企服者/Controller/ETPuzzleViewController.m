//
//  ETPuzzleViewController.m
//  EasyTurn
//
//  Created by 王翔 on 2019/7/24.
//  Copyright © 2019年 EasyTurn. All rights reserved.
//

#import "ETPuzzleViewController.h"
#import "ETEnterpriseServiceTableViewCell.h"
@interface ETPuzzleViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tab;
@property(nonatomic, strong)UIView *searchView;
@property (nonatomic, strong) UITextField *searchTextField;

@end

@implementation ETPuzzleViewController

- (UITableView *)tab {
    if (!_tab) {
        _tab=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, Screen_Width, Screen_Height) style:UITableViewStylePlain];
        _tab.delegate=self;
        _tab.dataSource=self;
        _tab.rowHeight=123;
        [_tab registerClass:[ETEnterpriseServiceTableViewCell class] forCellReuseIdentifier:@"cell"];
    }
    return _tab;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tab];
    self.searchView = [[UIView alloc]initWithFrame:CGRectMake(20, 0, Screen_Width -20 - 50, 30)];
    self.searchView.backgroundColor = [UIColor xm_colorFromRGB:0xF8F8F8];
    self.searchView.clipsToBounds = YES;
    self.searchView.layer.cornerRadius = 15.0;
    self.navigationItem.titleView = self.searchView;
    
    self.searchTextField = [[UITextField alloc]initWithFrame:CGRectMake(30, 2, Screen_Width -20 - 80, 26)];
    self.searchTextField.placeholder = @"搜索个关键词试试";
    self.searchTextField.font = [UIFont systemFontOfSize:13.0];
    self.searchTextField.returnKeyType = UIReturnKeySearch;
    self.searchTextField.delegate = self;
    [self.searchView addSubview:self.searchTextField];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ETEnterpriseServiceTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [_tab deselectRowAtIndexPath:indexPath animated:YES];
    
    ETEnterpriseServiceTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    // 2
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    // 3点击没有颜色改变
    cell.selected = NO;
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
