//
//  ETPersuadersViewController.m
//  EasyTurn
//
//  Created by 王翔 on 2019/7/30.
//  Copyright © 2019 EasyTurn. All rights reserved.
//

#import "ETPersuadersViewController.h"

@interface ETPersuadersViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *tab;

@end

@implementation ETPersuadersViewController

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

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
    self.title=@"发布出售";
    self.navigationController.navigationBarHidden=NO;
    [self.view addSubview:self.tab];
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section==0) {
        return 2;
    }else if (section==1) {
        return 1;
    }else if (section==2) {
        return 3;
    }else if (section==3) {
        return 2;
    }else {
        return 3;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section==0) {
        if (indexPath.row==0) {
            return 60;
        }else if (indexPath.row==1) {
            return 110;
        }else if (indexPath.row==2) {
            return 50;
        }else if (indexPath.row==3) {
            return 80;
        }
    }else if (indexPath.section==1) {
        return 100;
    }else if (indexPath.section==2) {
        return 60;
    }else if (indexPath.section==3) {
        if (indexPath.row==0) {
            return 50;
        }else if (indexPath.row==1) {
            return 70;
        }
    }else if (indexPath.section==4) {
        if (indexPath.row==0) {
            return 50;
        }else if (indexPath.row==1) {
            return 50;
        }else if (indexPath.row==2) {
            return 100;
        }
    }
    return YES;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell* cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    if (indexPath.section==0) {
        if (indexPath.row==0) {
            UILabel *titlelab=[[UILabel alloc]init];
            NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"标题：请输入您要发布的标题(标题有利于推送搜索)"attributes: @{NSFontAttributeName: [UIFont fontWithName:@"PingFangSC-Medium" size: 15],NSForegroundColorAttributeName: [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0]}];
            
            [string addAttributes:@{NSForegroundColorAttributeName: [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.000000]} range:NSMakeRange(0, 3)];
            
            [string addAttributes:@{NSForegroundColorAttributeName: [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.000000]} range:NSMakeRange(0, 3)];
            
            [string addAttributes:@{NSForegroundColorAttributeName: [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.000000]} range:NSMakeRange(3, 13)];
            
            titlelab.attributedText = string;
            titlelab.textAlignment = NSTextAlignmentLeft;
            titlelab.alpha = 1.0;
            [cell addSubview:titlelab];
            
            [titlelab mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(20);
                make.left.mas_equalTo(15);
                make.size.mas_equalTo(CGSizeMake(340, 21));
            }];
        }else if (indexPath.row==1) {
            UILabel *titlelab=[[UILabel alloc]init];
            NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"详细内容："attributes: @{NSFontAttributeName: [UIFont fontWithName:@"PingFangSC-Regular" size: 15],NSForegroundColorAttributeName: [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0]}];
            
            
            titlelab.attributedText = string;
            titlelab.textAlignment = NSTextAlignmentLeft;
            titlelab.alpha = 1.0;
            [cell addSubview:titlelab];
            
            [titlelab mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(20);
                make.left.mas_equalTo(15);
                make.size.mas_equalTo(CGSizeMake(76, 22));
            }];
            
            UILabel *titlelab1=[[UILabel alloc]init];
            titlelab1.numberOfLines = 0;
            NSMutableAttributedString *string1 = [[NSMutableAttributedString alloc] initWithString:@"请输入服务内容"attributes: @{NSFontAttributeName: [UIFont fontWithName:@"PingFangSC-Regular" size: 15],NSForegroundColorAttributeName: [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0]}];
            
            
            titlelab1.attributedText = string1;
            titlelab1.textAlignment = NSTextAlignmentLeft;
            titlelab1.alpha = 1.0;
            [cell addSubview:titlelab1];
            
            [titlelab1 mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(20);
                make.left.mas_equalTo(90);
                make.size.mas_equalTo(CGSizeMake(245, 88));
            }];
        }
    }else if (indexPath.section==1) {
        UIImageView* comImg=[[UIImageView alloc]init];
        comImg.image=[UIImage imageNamed:@"出售_分组 2"];
        [cell addSubview:comImg];
        [comImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(15);
            make.left.mas_equalTo(15);
            make.size.mas_equalTo(CGSizeMake(79, 79));
        }];
    }else if (indexPath.section==2) {
        if (indexPath.row==0) {
            UILabel *titlelab=[[UILabel alloc]init];
            NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"分类选择"attributes: @{NSFontAttributeName: [UIFont fontWithName:@"PingFangSC-Regular" size: 15],NSForegroundColorAttributeName: [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0]}];
            
            
            titlelab.attributedText = string;
            titlelab.textAlignment = NSTextAlignmentLeft;
            titlelab.alpha = 1.0;
            [cell addSubview:titlelab];
            
            [titlelab mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(15);
                make.left.mas_equalTo(15);
                make.size.mas_equalTo(CGSizeMake(76, 22));
            }];
            
            UIButton *xzbtn=[[UIButton alloc]init];
            [xzbtn setImage:[UIImage imageNamed:@"出售_下拉 copy"] forState:UIControlStateNormal];
            [cell addSubview:xzbtn];
            [xzbtn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(17);
                make.left.mas_equalTo(130);
                make.size.mas_equalTo(CGSizeMake(15, 15));
            }];
        }else if (indexPath.row==1) {
            UILabel *titlelab=[[UILabel alloc]init];
            NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"地址定位"attributes: @{NSFontAttributeName: [UIFont fontWithName:@"PingFangSC-Regular" size: 15],NSForegroundColorAttributeName: [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0]}];
            titlelab.attributedText = string;
            titlelab.textAlignment = NSTextAlignmentLeft;
            titlelab.alpha = 1.0;
            [cell addSubview:titlelab];
            
            [titlelab mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(15);
                make.left.mas_equalTo(15);
                make.size.mas_equalTo(CGSizeMake(76, 22));
            }];
            
            UILabel *titlelab1=[[UILabel alloc]init];
            NSMutableAttributedString *string1 = [[NSMutableAttributedString alloc] initWithString:@"北京 — 密云"attributes: @{NSFontAttributeName: [UIFont fontWithName:@"PingFangSC-Regular" size: 15],NSForegroundColorAttributeName: [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0]}];
            
            
            titlelab1.attributedText = string1;
            titlelab1.textAlignment = NSTextAlignmentLeft;
            titlelab1.alpha = 1.0;
            [cell addSubview:titlelab1];
            
            [titlelab1 mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(15);
                make.left.mas_equalTo(89);
                make.size.mas_equalTo(CGSizeMake(86, 21));
            }];
            cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        }else if (indexPath.row==2) {
            UILabel *titlelab=[[UILabel alloc]init];
            NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"有效时间"attributes: @{NSFontAttributeName: [UIFont fontWithName:@"PingFangSC-Regular" size: 15],NSForegroundColorAttributeName: [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0]}];
            titlelab.attributedText = string;
            titlelab.textAlignment = NSTextAlignmentLeft;
            titlelab.alpha = 1.0;
            [cell addSubview:titlelab];
            
            [titlelab mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(15);
                make.left.mas_equalTo(15);
                make.size.mas_equalTo(CGSizeMake(76, 22));
            }];
            
            UILabel *titlelab1=[[UILabel alloc]init];
            NSMutableAttributedString *string1 = [[NSMutableAttributedString alloc] initWithString:@"2019-06-19"attributes: @{NSFontAttributeName: [UIFont fontWithName:@"PingFangSC-Regular" size: 15],NSForegroundColorAttributeName: [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0]}];
            
            
            titlelab1.attributedText = string1;
            titlelab1.textAlignment = NSTextAlignmentLeft;
            titlelab1.alpha = 1.0;
            [cell addSubview:titlelab1];
            
            [titlelab1 mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(15);
                make.left.mas_equalTo(89);
                make.size.mas_equalTo(CGSizeMake(86, 21));
            }];
            cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        }
    }else if (indexPath.section==3) {
        if (indexPath.row==0) {
            UILabel *titlelab=[[UILabel alloc]init];
            NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"价格"attributes: @{NSFontAttributeName: [UIFont fontWithName:@"PingFangSC-Regular" size: 15],NSForegroundColorAttributeName: [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0]}];
            titlelab.attributedText = string;
            titlelab.textAlignment = NSTextAlignmentLeft;
            titlelab.alpha = 1.0;
            [cell addSubview:titlelab];
            
            [titlelab mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(15);
                make.left.mas_equalTo(15);
                make.size.mas_equalTo(CGSizeMake(30, 21));
            }];
            
            UILabel *titlelab1=[[UILabel alloc]init];
            NSMutableAttributedString *string1 = [[NSMutableAttributedString alloc] initWithString:@"¥ 1500"attributes: @{NSFontAttributeName: [UIFont fontWithName:@"PingFangSC-Medium" size: 15],NSForegroundColorAttributeName: [UIColor colorWithRed:248/255.0 green:124/255.0 blue:43/255.0 alpha:1.0]}];
            titlelab1.attributedText = string1;
            titlelab1.textAlignment = NSTextAlignmentLeft;
            titlelab1.alpha = 1.0;
            [cell addSubview:titlelab1];
            
            [titlelab1 mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(15);
                make.left.mas_equalTo(89);
                make.size.mas_equalTo(CGSizeMake(50, 21));
            }];
            
        }else if (indexPath.row==1) {
            UILabel *titlelab=[[UILabel alloc]init];
            NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"价格范围"attributes: @{NSFontAttributeName: [UIFont fontWithName:@"PingFangSC-Regular" size: 15],NSForegroundColorAttributeName: [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0]}];
            titlelab.attributedText = string;
            titlelab.textAlignment = NSTextAlignmentLeft;
            titlelab.alpha = 1.0;
            [cell addSubview:titlelab];
            
            [titlelab mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(15);
                make.left.mas_equalTo(15);
                make.size.mas_equalTo(CGSizeMake(62, 21));
            }];
            
            UIView *view = [[UIView alloc] init];
            view.layer.backgroundColor = [UIColor colorWithRed:242/255.0 green:242/255.0 blue:242/255.0 alpha:1.0].CGColor;
            view.layer.cornerRadius = 5;
            [cell addSubview:view];
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(15);
                make.left.mas_equalTo(89);
                make.size.mas_equalTo(CGSizeMake(91, 34));
            }];
            
            UILabel *subtitle=[[UILabel alloc]init];
            NSMutableAttributedString *string1 = [[NSMutableAttributedString alloc] initWithString:@"¥ 1000"attributes: @{NSFontAttributeName: [UIFont fontWithName:@"PingFangSC-Medium" size: 15],NSForegroundColorAttributeName: [UIColor colorWithRed:248/255.0 green:124/255.0 blue:43/255.0 alpha:1.0]}];
            subtitle.attributedText = string1;
            subtitle.textAlignment = NSTextAlignmentLeft;
            subtitle.alpha = 1.0;
            [view addSubview:subtitle];
            [subtitle mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(4);
                make.left.mas_equalTo(22);
                make.size.mas_equalTo(CGSizeMake(50, 21));
            }];
            UILabel *subLab=[[UILabel alloc]init];
            NSMutableAttributedString *string2 = [[NSMutableAttributedString alloc] initWithString:@"～"attributes: @{NSFontAttributeName: [UIFont fontWithName:@"PingFangSC-Regular" size: 15],NSForegroundColorAttributeName: [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1.0]}];
            subLab.attributedText = string2;
            subLab.textAlignment = NSTextAlignmentLeft;
            subLab.alpha = 1.0;
            [cell addSubview:subLab];
            [subLab mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(21);
                make.left.mas_equalTo(189);
                make.size.mas_equalTo(CGSizeMake(15, 21));
            }];
            
            UIView *view1 = [[UIView alloc] init];
            view1.layer.backgroundColor = [UIColor colorWithRed:242/255.0 green:242/255.0 blue:242/255.0 alpha:1.0].CGColor;
            view1.layer.cornerRadius = 5;
            [cell addSubview:view1];
            [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(15);
                make.left.mas_equalTo(215);
                make.size.mas_equalTo(CGSizeMake(91, 34));
            }];
            
            UILabel *subtitle2=[[UILabel alloc]init];
            NSMutableAttributedString *string3 = [[NSMutableAttributedString alloc] initWithString:@"¥ 1500"attributes: @{NSFontAttributeName: [UIFont fontWithName:@"PingFangSC-Medium" size: 15],NSForegroundColorAttributeName: [UIColor colorWithRed:248/255.0 green:124/255.0 blue:43/255.0 alpha:1.0]}];
            subtitle2.attributedText = string3;
            subtitle2.textAlignment = NSTextAlignmentLeft;
            subtitle2.alpha = 1.0;
            [view1 addSubview:subtitle2];
            [subtitle2 mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(4);
                make.left.mas_equalTo(22);
                make.size.mas_equalTo(CGSizeMake(50, 21));
            }];
        }
    }else if (indexPath.section==4) {
        if (indexPath.row==0) {
            UILabel *titlelab=[[UILabel alloc]init];
            NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"联系人"attributes: @{NSFontAttributeName: [UIFont fontWithName:@"PingFangSC-Regular" size: 15],NSForegroundColorAttributeName: [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0]}];
            titlelab.attributedText = string;
            titlelab.textAlignment = NSTextAlignmentLeft;
            titlelab.alpha = 1.0;
            [cell addSubview:titlelab];
            
            [titlelab mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(18);
                make.left.mas_equalTo(15);
                make.size.mas_equalTo(CGSizeMake(46, 21));
            }];
            
            UILabel *titlelab1=[[UILabel alloc]init];
            NSMutableAttributedString *string1 = [[NSMutableAttributedString alloc] initWithString:@"赵先生"attributes: @{NSFontAttributeName: [UIFont fontWithName:@"PingFangSC-Regular" size: 13],NSForegroundColorAttributeName: [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0]}];
            titlelab1.attributedText = string1;
            titlelab1.textAlignment = NSTextAlignmentLeft;
            titlelab1.alpha = 1.0;
            [cell addSubview:titlelab1];
            
            [titlelab1 mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(19);
                make.right.mas_equalTo(-15);
                make.size.mas_equalTo(CGSizeMake(40, 18));
            }];
        }else if (indexPath.row==1) {
            UILabel *titlelab=[[UILabel alloc]init];
            NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"联系电话"attributes: @{NSFontAttributeName: [UIFont fontWithName:@"PingFangSC-Regular" size: 15],NSForegroundColorAttributeName: [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0]}];
            titlelab.attributedText = string;
            titlelab.textAlignment = NSTextAlignmentLeft;
            titlelab.alpha = 1.0;
            [cell addSubview:titlelab];
            
            [titlelab mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(18);
                make.left.mas_equalTo(15);
                make.size.mas_equalTo(CGSizeMake(62, 21));
            }];
            
            UILabel *titlelab1=[[UILabel alloc]init];
            NSMutableAttributedString *string1 = [[NSMutableAttributedString alloc] initWithString:@"18888888888"attributes: @{NSFontAttributeName: [UIFont fontWithName:@"PingFangSC-Medium" size: 13],NSForegroundColorAttributeName: [UIColor colorWithRed:248/255.0 green:124/255.0 blue:43/255.0 alpha:1.0]}];
            titlelab1.attributedText = string1;
            titlelab1.textAlignment = NSTextAlignmentLeft;
            titlelab1.alpha = 1.0;
            [cell addSubview:titlelab1];
            
            [titlelab1 mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(19);
                make.right.mas_equalTo(-15);
                make.size.mas_equalTo(CGSizeMake(84, 18));
            }];
        }else if (indexPath.row==2) {
            UIButton *btn=[[UIButton alloc]init];
            btn.layer.cornerRadius = 6;
            btn.backgroundColor=[UIColor colorWithRed:20/255.0 green:138/255.0 blue:236/255.0 alpha:1.0];
            [btn setTitle:@"确认发布" forState:UIControlStateNormal];
            [cell addSubview:btn];
            
            [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(19);
                make.left.mas_equalTo(51);
                make.right.mas_equalTo(-51);
                make.height.mas_equalTo(40);
            }];
        }
    }
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [_tab deselectRowAtIndexPath:indexPath animated:YES];
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
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
