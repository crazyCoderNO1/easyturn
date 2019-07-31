//
//  ETPayaymentViewController.m
//  EasyTurn
//
//  Created by 王翔 on 2019/7/31.
//  Copyright © 2019 EasyTurn. All rights reserved.
//

#import "ETPayaymentViewController.h"

@interface ETPayaymentViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView*tab;
@property (nonatomic,strong) UIButton *btn;
@property (nonatomic,strong) UIButton *payBtn;
@end

@implementation ETPayaymentViewController

- (UITableView *)tab {
    if (!_tab) {
        _tab=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, Screen_Width, Screen_Height) style:UITableViewStyleGrouped];
        _tab.delegate=self;
        _tab.dataSource=self;
    }
    return _tab;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title=@"支付方式";
    [self.view addSubview:self.tab];
    [self payBtn];
}

- (void)payBtnController {
    _payBtn =[[UIButton alloc]init];
    [_payBtn setTitle:@"去支付" forState:UIControlStateNormal];
    _payBtn.layer.cornerRadius = 6;
    _payBtn.backgroundColor=[UIColor colorWithRed:20/255.0 green:138/255.0 blue:236/255.0 alpha:1.0];
    [self.view addSubview:_payBtn];
    [_payBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo (514);
        make.left.mas_equalTo (51);
        make.right.mas_equalTo (-51);
        make.size.mas_equalTo (CGSizeMake(268,39));
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    if (indexPath.section==0) {
        if (indexPath.row==0) {
            UILabel *label = [[UILabel alloc] init];
            label.numberOfLines = 0;
            NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"最终价格："attributes: @{NSFontAttributeName: [UIFont fontWithName:@"PingFangSC-Regular" size: 13],NSForegroundColorAttributeName: [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0]}];
            
            label.attributedText = string;
            label.textAlignment = NSTextAlignmentLeft;
            label.alpha = 1.0;
            [cell addSubview:label];
            [cell mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(21);
                make.left.mas_equalTo(14);
                make.size.mas_equalTo(CGSizeMake(74, 21));
            }];
            
            UILabel *label1 = [[UILabel alloc] init];
            label1.numberOfLines = 0;
            NSMutableAttributedString *string1 = [[NSMutableAttributedString alloc] initWithString:@"¥ 30000元"attributes: @{NSFontAttributeName: [UIFont fontWithName:@"PingFangSC-Medium" size: 30],NSForegroundColorAttributeName: [UIColor colorWithRed:248/255.0 green:124/255.0 blue:43/255.0 alpha:1.0]}];
            label1.attributedText = string1;
            label1.textAlignment = NSTextAlignmentLeft;
            label1.alpha = 1.0;
            [cell addSubview:label1];
            [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(16);
                make.right.mas_equalTo(-15);
                make.size.mas_equalTo(CGSizeMake(73, 21));
            }];
        }else if (indexPath.row==1) {
            UILabel *label = [[UILabel alloc] init];
            label.numberOfLines = 0;
            NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"分期方式"attributes: @{NSFontAttributeName: [UIFont fontWithName:@"PingFangSC-Regular" size: 13],NSForegroundColorAttributeName: [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0]}];
            
            label.attributedText = string;
            label.textAlignment = NSTextAlignmentLeft;
            label.alpha = 1.0;
            [cell addSubview:label];
            [cell mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(11);
                make.left.mas_equalTo(15);
                make.size.mas_equalTo(CGSizeMake(74, 21));
            }];
        }
    }else if (indexPath.section==1) {
        if (indexPath.row==0) {
            UILabel *label = [[UILabel alloc] init];
            label.numberOfLines = 0;
            NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"付款账户"attributes: @{NSFontAttributeName: [UIFont fontWithName:@"PingFangSC-Regular" size: 13],NSForegroundColorAttributeName: [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0]}];
            
            label.attributedText = string;
            label.textAlignment = NSTextAlignmentLeft;
            label.alpha = 1.0;
            [cell addSubview:label];
            [cell mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(21);
                make.left.mas_equalTo(14);
                make.size.mas_equalTo(CGSizeMake(74, 21));
            }];
        }else if (indexPath.row==1) {
            UIImageView *remainderImg=[[UIImageView alloc]init];
            remainderImg.image=[UIImage imageNamed:@"支付_微信"];
            [cell addSubview:remainderImg];
            [remainderImg mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(14);
                make.left.mas_equalTo(15);
                make.size.mas_equalTo(CGSizeMake(30, 30));
            }];
            
            UILabel *label = [[UILabel alloc] init];
            label.numberOfLines = 0;
            NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"账户余额（剩余：¥6000）"attributes: @{NSFontAttributeName: [UIFont fontWithName:@"PingFangSC-Regular" size: 14],NSForegroundColorAttributeName: [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0]}];
            label.attributedText = string;
            label.textAlignment = NSTextAlignmentLeft;
            label.alpha = 1.0;
            [cell addSubview:label];
            [cell mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(19);
                make.left.mas_equalTo(57);
                make.size.mas_equalTo(CGSizeMake(180, 21));
            }];

            _btn=[[UIButton alloc]init];
            [_btn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
            [_btn setImage:[UIImage imageNamed:@"支付_分组 3"] forState:UIControlStateSelected];
            [_btn addTarget:self action:@selector(aaa) forControlEvents:UIControlEventTouchUpInside];
            [cell addSubview:self.btn];
            [self.btn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo (20);
                make.right.mas_equalTo(-13);
                make.size.mas_equalTo(CGSizeMake(19, 19));
            }];
        }else if (indexPath.row==2) {
            UIImageView *remainderImg=[[UIImageView alloc]init];
            remainderImg.image=[UIImage imageNamed:@"支付_支付宝"];
            [cell addSubview:remainderImg];
            [remainderImg mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(14);
                make.left.mas_equalTo(15);
                make.size.mas_equalTo(CGSizeMake(30, 30));
            }];
            
            UILabel *label = [[UILabel alloc] init];
            label.numberOfLines = 0;
            NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"支付宝账户  （张**）"attributes: @{NSFontAttributeName: [UIFont fontWithName:@"PingFangSC-Regular" size: 14],NSForegroundColorAttributeName: [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0]}];
            label.attributedText = string;
            label.textAlignment = NSTextAlignmentLeft;
            label.alpha = 1.0;
            [cell addSubview:label];
            [cell mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(19);
                make.left.mas_equalTo(57);
                make.size.mas_equalTo(CGSizeMake(180, 21));
            }];
            
            _btn=[[UIButton alloc]init];
            [_btn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
            [_btn setImage:[UIImage imageNamed:@"支付_分组 3"] forState:UIControlStateSelected];
            [_btn addTarget:self action:@selector(aaa) forControlEvents:UIControlEventTouchUpInside];
            [cell addSubview:self.btn];
            [self.btn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo (20);
                make.right.mas_equalTo(-13);
                make.size.mas_equalTo(CGSizeMake(19, 19));
            }];
        }else if (indexPath.row==3) {
            UIImageView *remainderImg=[[UIImageView alloc]init];
            remainderImg.image=[UIImage imageNamed:@"支付_微信"];
            [cell addSubview:remainderImg];
            [remainderImg mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(14);
                make.left.mas_equalTo(15);
                make.size.mas_equalTo(CGSizeMake(30, 30));
            }];
            
            UILabel *label = [[UILabel alloc] init];
            label.numberOfLines = 0;
            NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"微信账户（张**）"attributes: @{NSFontAttributeName: [UIFont fontWithName:@"PingFangSC-Regular" size: 14],NSForegroundColorAttributeName: [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0]}];
            label.attributedText = string;
            label.textAlignment = NSTextAlignmentLeft;
            label.alpha = 1.0;
            [cell addSubview:label];
            [cell mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(19);
                make.left.mas_equalTo(57);
                make.size.mas_equalTo(CGSizeMake(180, 21));
            }];
            
            _btn=[[UIButton alloc]init];
            [_btn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
            [_btn setImage:[UIImage imageNamed:@"支付_分组 3"] forState:UIControlStateSelected];
            [_btn addTarget:self action:@selector(aaa) forControlEvents:UIControlEventTouchUpInside];
            [cell addSubview:self.btn];
            [self.btn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo (20);
                make.right.mas_equalTo(-13);
                make.size.mas_equalTo(CGSizeMake(19, 19));
            }];
        }
    }
    
    return cell;
}

- (void)aaa {
    if (_btn.selected==YES) {
        _btn.selected=NO;
    }else {
        _btn.selected=YES;
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
