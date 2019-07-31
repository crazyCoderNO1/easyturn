//
//  ETBuyPushViewController.m
//  EasyTurn
//
//  Created by 王翔 on 2019/7/31.
//  Copyright © 2019 EasyTurn. All rights reserved.
//

#import "ETBuyPushViewController.h"
#import "ETPayaymentViewController.h"
@interface ETBuyPushViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *tab;

@end

@implementation ETBuyPushViewController

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
    self.title=@"交易详情";
    [self.view addSubview:self.tab];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section==0) {
        return 6;
    }else if (section==1) {
        return 2;
    }
    return YES;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    if (indexPath.section==0) {
        if (indexPath.row==0) {
            UILabel *label = [[UILabel alloc] init];
            label.numberOfLines = 0;
            NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"转让北京市海淀区公司《个体工商户营业执照》有经济实力的老板们过来咨询"attributes: @{NSFontAttributeName: [UIFont fontWithName:@"PingFangSC-Regular" size: 13],NSForegroundColorAttributeName: [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0]}];
                                                 
                label.attributedText = string;
                label.textAlignment = NSTextAlignmentLeft;
                label.alpha = 1.0;
            [cell addSubview:label];
            [cell mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(15);
                make.left.mas_equalTo(15);
                make.right.mas_equalTo(-15);
                make.height.mas_equalTo(41);
            }];
        }else if (indexPath.row==1) {
            UILabel *label = [[UILabel alloc] init];
            label.numberOfLines = 0;
            NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"注册时间：2019-01-03"attributes: @{NSFontAttributeName: [UIFont fontWithName:@"PingFangSC-Regular" size: 13],NSForegroundColorAttributeName: [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0]}];
            
            label.attributedText = string;
            label.textAlignment = NSTextAlignmentLeft;
            label.alpha = 1.0;
            [cell addSubview:label];
            [cell mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(15);
                make.left.mas_equalTo(15);
                make.size.mas_equalTo(CGSizeMake(157, 21));
            }];
        }else if (indexPath.row==2) {
            UILabel *label = [[UILabel alloc] init];
            label.numberOfLines = 0;
            NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"注册地址：北京市朝阳区"attributes: @{NSFontAttributeName: [UIFont fontWithName:@"PingFangSC-Regular" size: 13],NSForegroundColorAttributeName: [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0]}];
            
            label.attributedText = string;
            label.textAlignment = NSTextAlignmentLeft;
            label.alpha = 1.0;
            [cell addSubview:label];
            [cell mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(15);
                make.left.mas_equalTo(15);
                make.size.mas_equalTo(CGSizeMake(165, 21));
            }];
        }else if (indexPath.row==3) {
            UILabel *label = [[UILabel alloc] init];
            label.numberOfLines = 0;
            NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"卖家电话：18666666666"attributes: @{NSFontAttributeName: [UIFont fontWithName:@"PingFangSC-Regular" size: 13],NSForegroundColorAttributeName: [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0]}];
            
            label.attributedText = string;
            label.textAlignment = NSTextAlignmentLeft;
            label.alpha = 1.0;
            [cell addSubview:label];
            [cell mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(15);
                make.left.mas_equalTo(15);
                make.size.mas_equalTo(CGSizeMake(170, 21));
            }];
        }else if (indexPath.row==4) {
            UILabel *label = [[UILabel alloc] init];
            label.numberOfLines = 0;
            NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"最终定价："attributes: @{NSFontAttributeName: [UIFont fontWithName:@"PingFangSC-Regular" size: 13],NSForegroundColorAttributeName: [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0]}];
            
            label.attributedText = string;
            label.textAlignment = NSTextAlignmentLeft;
            label.alpha = 1.0;
            [cell addSubview:label];
            [cell mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(21);
                make.left.mas_equalTo(14);
                make.size.mas_equalTo(CGSizeMake(74, 21));
            }];
            
            UIView *view = [[UIView alloc] init];
            view.layer.backgroundColor = [UIColor colorWithRed:237/255.0 green:237/255.0 blue:237/255.0 alpha:1.0].CGColor;
            view.layer.cornerRadius = 5;
            [cell addSubview:view];
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(15);
                make.left.mas_equalTo(14);
                make.size.mas_equalTo(CGSizeMake(91, 34));
            }];
            
            UILabel *label1 = [[UILabel alloc] init];
            label1.numberOfLines = 0;
            NSMutableAttributedString *string1 = [[NSMutableAttributedString alloc] initWithString:@"¥ 30000元"attributes: @{NSFontAttributeName: [UIFont fontWithName:@"PingFangSC-Medium" size: 14],NSForegroundColorAttributeName: [UIColor colorWithRed:248/255.0 green:124/255.0 blue:43/255.0 alpha:1.0]}];
            label1.attributedText = string1;
            label1.textAlignment = NSTextAlignmentLeft;
            label1.alpha = 1.0;
            [view addSubview:label1];
            [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(6);
                make.left.mas_equalTo(9);
                make.right.mas_equalTo(-9);
                make.height.mas_equalTo(21);
            }];
        }else if (indexPath.row==5) {
            UILabel *label = [[UILabel alloc] init];
            label.numberOfLines = 0;
            NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"订单编号：5035843878781629"attributes: @{NSFontAttributeName: [UIFont fontWithName:@"PingFangSC-Regular" size: 13],NSForegroundColorAttributeName: [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0]}];
            
            label.attributedText = string;
            label.textAlignment = NSTextAlignmentLeft;
            label.alpha = 1.0;
            [cell addSubview:label];
            [cell mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(15);
                make.left.mas_equalTo(15);
                make.size.mas_equalTo(CGSizeMake(215, 21));
            }];
        }
    }else if (indexPath.section==1) {
        if (indexPath.row==0) {
            UILabel *label = [[UILabel alloc] init];
            label.numberOfLines = 0;
            NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"支付方式"attributes: @{NSFontAttributeName: [UIFont fontWithName:@"PingFangSC-Regular" size: 13],NSForegroundColorAttributeName: [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0]}];
            label.attributedText = string;
            label.textAlignment = NSTextAlignmentLeft;
            label.alpha = 1.0;
            [cell addSubview:label];
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(16);
                make.left.mas_equalTo(15);
                make.size.mas_equalTo(CGSizeMake(60, 21));
            }];
            cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        }else if (indexPath.row==1) {
            UILabel *label = [[UILabel alloc] init];
            label.numberOfLines = 0;
            NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"支付状态"attributes: @{NSFontAttributeName: [UIFont fontWithName:@"PingFangSC-Regular" size: 13],NSForegroundColorAttributeName: [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0]}];
            label.attributedText = string;
            label.textAlignment = NSTextAlignmentLeft;
            label.alpha = 1.0;
            [cell addSubview:label];
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(16);
                make.left.mas_equalTo(15);
                make.size.mas_equalTo(CGSizeMake(60, 21));
            }];
            
            UILabel *label1 = [[UILabel alloc] init];
            label1.frame = CGRectMake(590,990,130,37);
            label1.numberOfLines = 0;
            NSMutableAttributedString *string1 = [[NSMutableAttributedString alloc] initWithString:@"卖家未确认"attributes: @{NSFontAttributeName: [UIFont fontWithName:@"PingFangSC-Regular" size: 13],NSForegroundColorAttributeName: [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0]}];
            label1.attributedText = string1;
            label1.textAlignment = NSTextAlignmentLeft;
            label1.alpha = 1.0;
            [cell addSubview:label1];
            [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(24);
                make.right.mas_equalTo(-15);
                make.size.mas_equalTo(CGSizeMake(65, 18));
            }];
        }
    }
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section==1) {
        if (indexPath.row==0) {
            ETPayaymentViewController *payVC=[[ETPayaymentViewController alloc]init];
            [self.navigationController pushViewController:payVC animated:YES];
        }
    }
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
