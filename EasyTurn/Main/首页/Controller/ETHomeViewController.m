//
//  ETHomeViewController.m
//  EasyTurn
//
//  Created by 程立 on 2019/7/19.
//  Copyright © 2019 EasyTurn. All rights reserved.
//

#import "ETHomeViewController.h"
#import "ETHomeTopView.h"
#import "ETHomeHeaderView.h"
#import "ETHomeModel.h"
#import "MarqueeView.h"
@interface ETHomeViewController ()<UITableViewDelegate, UITableViewDataSource, ETHomeHeaderViewDelegate>
@property (nonatomic, strong) ETHomeTopView *vHomeTop;
@property (nonatomic, strong) ETHomeHeaderView *vHomeHeader;
@property (nonatomic, strong) UITableView *tbHome;
@property (nonatomic, strong) MarqueeView *marqueeView;
@end

@implementation ETHomeViewController

- (MarqueeView *)marqueeView{
    
    if (!_marqueeView) {
        MarqueeView *marqueeView =[[MarqueeView alloc]initWithFrame:CGRectMake(0, 290, 300, 30) withTitle:@[@"求购一家电子科技类公司",@"求购一家传媒公司",@"求购一家外联公司",@"求购一家家具公司",@"求购一家IT公司"]];
        marqueeView.titleColor = [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1.0];
        marqueeView.titleFont = [UIFont systemFontOfSize:12];
        __weak MarqueeView *marquee = marqueeView;
        marqueeView.handlerTitleClickCallBack = ^(NSInteger index){
            
            NSLog(@"%@----%zd",marquee.titleArr[index-1],index);
        };
        _marqueeView = marqueeView;
    }
    return _marqueeView;
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
    

}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;
}

- (UITableView *)tbHome {
    if (!_tbHome) {
        _tbHome = [[UITableView alloc]initWithFrame:CGRectMake(0, kStatusBarHeight + 65, Screen_Width, Screen_Height - kStatusBarHeight - 65) style:UITableViewStylePlain];
        _tbHome.showsVerticalScrollIndicator = NO;
        _tbHome.backgroundColor = kACColorWhite;
        _tbHome.delegate = self;
        _tbHome.dataSource = self;
        _vHomeHeader = [[ETHomeHeaderView alloc]initWithFrame:CGRectMake(0, 0, Screen_Width, 327)];
        _vHomeHeader.delegate = self;
        _tbHome.tableHeaderView = _vHomeHeader;
        _tbHome.tableFooterView = [[UIView alloc]init];
    }
    return _tbHome;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createSubViewsAndConstraints];
    [self requestDate];
    [self.vHomeHeader addSubview:self.marqueeView];
}

#pragma mark - createSubViewsAndConstraints
- (void)createSubViewsAndConstraints {
    
    _vHomeTop = [[ETHomeTopView alloc]init];
    [self.view addSubview:_vHomeTop];
    [_vHomeTop mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(kStatusBarHeight + 75);
    }];
    
    [self.view addSubview:self.tbHome];
 
}

#pragma mark - 请求网络
- (void)requestDate {
    WEAKSELF
    [[ACToastView toastView]showLoadingCircleViewWithStatus:@"正在加载中"];
    [ETHomeModel requestGetIndexBannerSuccess:^(id request, STResponseModel *response, id resultObject) {
        if (response.code == 0) {
            [[ACToastView toastView]hide];
            ETHomeModel *model = response.data;
            NSMutableArray *imageGroupArray = [NSMutableArray array];
            [model.adList enumerateObjectsUsingBlock:^(AdListModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                [imageGroupArray addObject:obj.image];
            }];
            weakSelf.vHomeHeader.imageGroupArray = imageGroupArray;
            [weakSelf.tbHome reloadData];
        }
    } failure:^(id request, NSError *error) {
        
    }];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyIdentifier"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"MyIdentifier"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 98;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
}

#pragma mark -ETHomeHeaderViewDelegate
- (void)homeHeaderViewPushSearch {
    AMLog(@"11");
}

- (void)slideshowHeadViewDidSelectItemAtIndex:(NSInteger)index {
    
}

@end
