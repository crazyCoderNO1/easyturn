//
//  ETRKongViewController.m
//  EasyTurn
//
//  Created by 王翔 on 2019/7/25.
//  Copyright © 2019年 EasyTurn. All rights reserved.
//

#import "ETRKongViewController.h"
#import "ETIssueViewController.h"
#import "ETPurchaseViewController.h"
@interface ETRKongViewController ()
@property (nonatomic,strong) UIImageView *publishImg;
@property (nonatomic,strong) UILabel *publishLab;
@property (nonatomic,strong) UIButton *publishBtn;

@property (nonatomic,strong) UIImageView *purchaseImg;
@property (nonatomic,strong) UILabel *purchaseLab;
@property (nonatomic,strong) UIButton *purchaseBtn;

@property (nonatomic,strong) UIImageView *businessImg;
@property (nonatomic,strong) UILabel *businessLab;
@property (nonatomic,strong) UIButton *businessBtn;

@property (nonatomic,strong) UIButton *fanhuiBtn;

@end

@implementation ETRKongViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.publishImg];
    [self.publishImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(459);
        make.left.mas_equalTo(57);
        make.size.mas_equalTo(CGSizeMake(44, 44));
    }];
    
    [self.view addSubview:self.publishLab];
    [self.publishLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(505);
        make.left.mas_equalTo(50);
        make.size.mas_equalTo(CGSizeMake(59, 21));
    }];
    
    [self.view addSubview:self.publishBtn];
    [self.publishBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(459);
        make.left.mas_equalTo(50);
        make.size.mas_equalTo(CGSizeMake(59, 65));
    }];
    
    [self.view addSubview:self.fanhuiBtn];
    [self.fanhuiBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(552);
        make.left.mas_equalTo(175);
        make.size.mas_equalTo(CGSizeMake(21, 21));
    }];
    
    [self.view addSubview:self.purchaseImg];
    [self.purchaseImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(417);
        make.left.mas_equalTo(164);
        make.size.mas_equalTo(CGSizeMake(42, 42));
    }];
    
    [self.view addSubview:self.purchaseLab];
    [self.purchaseLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(465);
        make.left.mas_equalTo(156);
        make.size.mas_equalTo(CGSizeMake(59, 21));
    }];
    
    [self.view addSubview:self.purchaseBtn];
    [self.view addSubview:self.purchaseBtn];
    [self.purchaseBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(417);
        make.left.mas_equalTo(156);
        make.size.mas_equalTo(CGSizeMake(59, 69));
    }];
    
    [self.view addSubview:self.businessImg];
    [self.businessImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(460);
        make.right.mas_equalTo(-48);
        make.size.mas_equalTo(CGSizeMake(42, 42));
    }];
    [self.view addSubview:self.businessLab];
    [self.businessLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(505);
        make.right.mas_equalTo(-47);
        make.size.mas_equalTo(CGSizeMake(44, 21));
    }];
    
    [self.view addSubview:self.businessBtn];
    [self.businessBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(505);
        make.right.mas_equalTo(-47);
        make.size.mas_equalTo(CGSizeMake(44, 64));
    }];
}


- (UIImageView *)publishImg {
    if (!_publishImg) {
        _publishImg= [[UIImageView alloc]init];
        _publishImg.image=[UIImage imageNamed:@"shangpin"];
    }
    return _publishImg;
}

- (UILabel *)publishLab {
    if (!_publishLab) {
        _publishLab= [[UILabel alloc]init];
        _publishLab.text=@"发布出售";
        _publishLab.textColor=[UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1.0];
        _publishLab.font=[UIFont systemFontOfSize:13];
    }
    return _publishLab;
}

- (UIButton *)publishBtn {
    if (!_publishBtn) {
        _publishBtn= [[UIButton alloc]init];
        [_publishBtn addTarget:self action:@selector(aaaaa) forControlEvents:UIControlEventTouchUpInside];
    }
    return _publishBtn;
}
- (void)aaaaa {
    ETIssueViewController *is=[[ETIssueViewController alloc]init];
    [self.navigationController pushViewController:is animated:YES];
}

- (UIImageView *)purchaseImg {
    if (!_purchaseImg) {
        _purchaseImg=[[UIImageView alloc]init];
        _purchaseImg.image=[UIImage imageNamed:@"biaoqian"];
    }
    return _purchaseImg;
}

- (UILabel *)purchaseLab {
    if (!_purchaseLab) {
        _purchaseLab=[[UILabel alloc]init];
        _purchaseLab.text=@"发布求购";
        _purchaseLab.textColor=[UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1.0];
        _purchaseLab.font=[UIFont systemFontOfSize:13];
    }
    return _purchaseLab;
}

- (UIButton *)purchaseBtn {
    if (!_purchaseBtn) {
        _purchaseBtn=[[UIButton alloc]init];
        [_purchaseBtn addTarget:self action:@selector(aaaaa) forControlEvents:UIControlEventTouchUpInside];
    }
    return _purchaseBtn;
}

- (UIImageView *)businessImg {
    if (!_businessImg) {
        _businessImg=[[UIImageView alloc]init];
        _businessImg.image=[UIImage imageNamed:@"huangguan"];
    }
    return _businessImg;
}

- (UILabel *)businessLab {
    if (!_businessLab) {
        _businessLab=[[UILabel alloc]init];
        _businessLab.text=@"企服者";
        _businessLab.textColor=[UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1.0];
        _businessLab.font=[UIFont systemFontOfSize:13];
    }
    return _businessLab;
}

- (UIButton *)businessBtn {
    if (!_businessBtn) {
        _businessBtn=[[UIButton alloc]init];
         [_businessBtn addTarget:self action:@selector(aaaaa) forControlEvents:UIControlEventTouchUpInside];
    }
    return _businessBtn;
}

- (UIButton *)fanhuiBtn {
    if (!_fanhuiBtn) {
        _fanhuiBtn=[[UIButton alloc]init];
        [_fanhuiBtn setImage:[UIImage imageNamed:@"关闭"] forState:UIControlStateNormal];
        [_fanhuiBtn addTarget:self action:@selector(putWebVCBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _fanhuiBtn;
}

- (void)putWebVCBtnClick {
    [self.navigationController popViewControllerAnimated:YES];
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
