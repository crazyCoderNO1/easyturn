//
//  ETProductDetailController.m
//  EasyTurn
//
//  Created by 程立 on 2019/7/29.
//  Copyright © 2019 EasyTurn. All rights reserved.
//

#import "ETProductDetailController.h"
#import "ProductInfoCell.h"
#import "SDCycleScrollView.h"

@interface ETProductDetailController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UIView *bigView;
@property (nonatomic, strong) UIWebView *webView;

//添加在头部视图的tempScrollView
@property (nonatomic, strong) UIScrollView *tempScrollView;
//记录底部空间所需的高度
@property (nonatomic, assign) CGFloat bottomHeight;
@property (nonatomic, strong) NSArray *detailTitles;
@property (nonatomic, strong) SDCycleScrollView *cycleScrollView;
///轮播图数组
@property (nonatomic, strong) NSArray *imageGroupArray;
@end

@implementation ETProductDetailController
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
    
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
//    [self enableLeftBackButton];
    [self setBgUI];
    [self setHeaderAndFooterView];
    [self setBottomView];
    [self setUpLeftTwoButton];
    // Do any additional setup after loading the view.
}

- (void)setBgUI
{
    _bottomHeight = 55;
    
    //存放tableView和webView，tableview在上面，webview在下面
    _bigView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, (Screen_Width - _bottomHeight) * 2)];
    _bigView.backgroundColor = kACColorWhite;
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, Screen_Height - _bottomHeight)];
    _tableView.backgroundColor = kACColorWhite;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerNib:[UINib nibWithNibName:@"ProductInfoCell" bundle:nil] forCellReuseIdentifier:@"productinfocell"];
    //去掉顶部偏移
    if (@available(iOS 11.0, *))
    {
        _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    
    [self.view addSubview:_bigView];
    [_bigView addSubview:_tableView];
    
    
}

- (void)setHeaderAndFooterView{
    
    //添加头部和尾部视图
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, 218)];
    headerView.backgroundColor = kACColorWhite;
    
    _tempScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, 218)];
    [headerView addSubview:_tempScrollView];
    
    _headerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, 218)];
    _headerImageView.contentMode = UIViewContentModeScaleAspectFit;
    _headerImageView.image = _image;
//    [_tempScrollView addSubview:_headerImageView];
    
    _cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, Screen_Width, 218) delegate:self placeholderImage:nil];
    _cycleScrollView.bannerImageViewContentMode = UIViewContentModeScaleAspectFill;
    _cycleScrollView.autoScrollTimeInterval = 5.0;
    [_tempScrollView addSubview:_cycleScrollView];
//    [_cycleScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(0);
//        make.left.right.mas_equalTo(0);
//        make.height.mas_equalTo(218);
//    }];
    
    _tableView.tableHeaderView = headerView;
    
    NSArray* imgs=@[@"https://yizhuanvip.oss-cn-beijing.aliyuncs.com/banner/a6c0631bb287b8a59a3264ec9e13258.jpg",@"https://yizhuanvip.oss-cn-beijing.aliyuncs.com/banner/b98137ff7fb5f6a2a23de55d9607d59.jpg"];
    self.imageGroupArray=imgs;
    
    UILabel *pullMsgView = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, 40)];
    pullMsgView.textAlignment = NSTextAlignmentCenter;
    pullMsgView.text = @"上拉显示网页";
    pullMsgView.textColor = kACColorBlack;
    
    UIView *footView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, 40)];
    [footView addSubview:pullMsgView];
    
    _tableView.tableFooterView = footView;
    
    //设置下拉提示视图
    UILabel *downPullMsgView = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, 40)];
    downPullMsgView.textAlignment = NSTextAlignmentCenter;
    downPullMsgView.text = @"下拉显示列表";
    downPullMsgView.textColor = kACColorBlack;
    
    UIView *downMsgView = [[UIView alloc] initWithFrame:CGRectMake(0, -40, Screen_Width, 40)];
    [downMsgView addSubview:downPullMsgView];
    [_webView.scrollView addSubview:downMsgView];
}

- (void)setBottomView
{
    UIView *bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, Screen_Height - _bottomHeight, Screen_Width, _bottomHeight)];
    bottomView.backgroundColor = kACColorBackgroundGray;
    [self.view addSubview:bottomView];
    
    UIButton *addButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    addButton.frame = CGRectMake(bottomView.mj_w/2, 0, bottomView.mj_w/4, _bottomHeight);
    addButton.backgroundColor = RGBCOLOR(250, 112, 60);
    addButton.titleLabel.font = SYSTEMFONT(16);
    [addButton setTitle:@"加入购物车" forState:(UIControlStateNormal)];
    [addButton setTitleColor:kACColorWhite forState:(UIControlStateNormal)];
    addButton.tag=0;
    [addButton addTarget:self action:@selector(addAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [bottomView addSubview:addButton];
    
    UIButton *addimButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    addimButton.frame = CGRectMake(bottomView.mj_w*3/4, 0, bottomView.mj_w/4, _bottomHeight);
    addimButton.backgroundColor = kACColorRed;
    addimButton.titleLabel.font = SYSTEMFONT(16);
    [addimButton setTitle:@"立即购买" forState:(UIControlStateNormal)];
    [addimButton setTitleColor:kACColorWhite forState:(UIControlStateNormal)];
    addimButton.tag=1;
    [addimButton addTarget:self action:@selector(addAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [bottomView addSubview:addimButton];
    
}
-(void)addAction:(id)sender
{
    EaseMessageViewController *chatController = [[EaseMessageViewController alloc] initWithConversationChatter:@"1156078615943835648" conversationType:EMConversationTypeChat];
    [self.navigationController pushViewController:chatController animated:YES];
}
#pragma mark - 收藏 购物车
- (void)setUpLeftTwoButton
{
    NSArray *imagesNor = @[@"tabr_07shoucang_up",@"ptgd_icon_xiaoxi",@"tabr_08gouwuche"];
    NSArray *imagesSel = @[@"tabr_07shoucang_down",@"ptgd_icon_xiaoxi",@"tabr_08gouwuche"];
    CGFloat buttonW = Screen_Width * 0.15;
    CGFloat buttonH = _bottomHeight;
    CGFloat buttonY = Screen_Height - buttonH;
    
    for (NSInteger i = 0; i < imagesNor.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setImage:[UIImage imageNamed:imagesNor[i]] forState:UIControlStateNormal];
        button.backgroundColor = kACColorBackgroundGray;
        [button setImage:[UIImage imageNamed:imagesSel[i]] forState:UIControlStateSelected];
        button.tag = i;
        [button addTarget:self action:@selector(bottomButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        CGFloat buttonX = (buttonW * i);
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        [self.view addSubview:button];
    }
}
- (void)setImageGroupArray:(NSArray *)imageGroupArray{
    _imageGroupArray = imageGroupArray;
    _cycleScrollView.placeholderImage = [UIImage imageNamed:@"首页_轮播占位图"];
    if (imageGroupArray.count == 0) return;
    _cycleScrollView.imageURLStringsGroup = _imageGroupArray;
    
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offset = scrollView.contentOffset.y;
    
    if (scrollView == _tableView){
        //重新赋值，就不会有用力拖拽时的回弹
        _tempScrollView.contentOffset = CGPointMake(_tempScrollView.contentOffset.x, 0);
        if (offset >= 0 && offset <= Screen_Width) {
            //因为tempScrollView是放在tableView上的，tableView向上速度为1，实际上tempScrollView的速度也是1，此处往反方向走1/2的速度，相当于tableView还是正向在走1/2，这样就形成了视觉差！
            _tempScrollView.contentOffset = CGPointMake(_tempScrollView.contentOffset.x, - offset / 2.0f);
        }
    }
    
}

#pragma mark -- 监听滚动实现商品详情与图文详情界面的切换
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    
    WeakSelf(self);
    CGFloat offset = scrollView.contentOffset.y;
    if (scrollView == _tableView) {
        if (offset > _tableView.contentSize.height - Screen_Height + self.bottomHeight + 50) {
            [UIView animateWithDuration:0.4 animations:^{
                weakself.bigView.transform = CGAffineTransformTranslate(weakself.bigView.transform, 0, -Screen_Height +  self.bottomHeight + TopHeight);
            } completion:^(BOOL finished) {
                
            }];
        }
        //        [_basecontroller.segmentedControl didSelectIndex:1];
    }
    if (scrollView == _webView.scrollView) {
        if (offset < -50) {
            [UIView animateWithDuration:0.4 animations:^{
                [UIView animateWithDuration:0.4 animations:^{
                    weakself.bigView.transform = CGAffineTransformIdentity;
                    
                }];
            } completion:^(BOOL finished) {
                
            }];
        }
        //        [_basecontroller.segmentedControl didSelectIndex:1];
        
    }
}

#pragma mark -- UITableViewDelegate & dataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section==1)
        return 1;
    else if(section==3)
        return 3;
    return 1;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        return 100;
    }
    else if (indexPath.section==1&&indexPath.row!=0){
        return 80;
    }
    else if (indexPath.section==1&&indexPath.row==0){
        return 40;
    }
    else if (indexPath.section==2) {
        return 80;
    }
    else{
        
        return 60;
    }
}
//设置分区尾视图高度
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section>0) {
        return 10;
    }
    else{
        return 0.01;
    }}
//设置分区头视图高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 0.01;
}
//设置分区的尾视图
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 10)];
    view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    return view;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"identifier";
    
    //    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    //    if (!cell) {
    UITableViewCell* cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    //    }
    
    cell.textLabel.font = SYSTEMFONT(16);
    cell.textLabel.textColor = kACColorBlack;
    cell.textLabel.text = [_detailTitles objectAtIndex:indexPath.row+indexPath.section];
    if (indexPath.section==0) {
        ProductInfoCell *cell=[_tableView dequeueReusableCellWithIdentifier:@"productinfocell"];
        cell.titleLabel.text=@"代理公司记账";
        cell.titleLabel.numberOfLines=0;
        cell.priceLabel.text=[NSString stringWithFormat:@"￥:%@",@"1000"];
        cell.oPriceLabel.text=[NSString stringWithFormat:@"价格:￥%@",@""];
        return cell;
    }
    if (indexPath.section==2) {
        cell.textLabel.text=@"经营范围";
        cell.detailTextLabel.text=@"转让北京现成资质14项房建总包三级，市政";
    }
    if (indexPath.section==3) {
        cell.textLabel.text=@"注册时间";
        cell.detailTextLabel.text=@"2019-06-19";
    }
//    if(indexPath.section==1&&indexPath.row==0){
//        UIView* v=[[UIView alloc] initWithFrame:CGRectMake(0, 0, Main_Screen_Width, 80)];
//        UIButton* b=[UIButton new];
//        [b setTitle:[NSString stringWithFormat:@"商品评论(%d)",_commentList.count] forState:UIControlStateNormal];
//        [b setFont:[UIFont systemFontOfSize:13]];
//        [b setTitleColor:KDarkTextColor forState:(UIControlStateNormal)];
//        [b addTarget:self action:@selector(comment) forControlEvents:UIControlEventTouchUpInside];
//        [v addSubview:b];
//        [cell.contentView addSubview:v];
//
//        [b mas_makeConstraints:^(MASConstraintMaker *make) {
//            [make.centerY.mas_equalTo(cell.contentView)setOffset:(0)];
//            [make.left.mas_equalTo(cell.contentView)setOffset:(-5)];
//            make.size.mas_equalTo(CGSizeMake(120, 40));
//        }];
//        cell.textLabel.text=@"";
//        return cell;
//    }
//    if (indexPath.section==1&&indexPath.row==1&&_commentList.count>0) {
//        UIView* v=[[UIView alloc] initWithFrame:CGRectMake(0, 0, Main_Screen_Width, 80)];
//        UILabel*comName=[UILabel new];
//        StarView* star=[StarView new];
//        UILabel* date=[UILabel new];
//        UILabel* comm=[UILabel new];
//
//        cell.textLabel.text=@"";
//        return cell;
//    }
//    else if(indexPath.section==1&&indexPath.row==2){
//        UIView* v=[[UIView alloc] initWithFrame:CGRectMake(0, 0, Main_Screen_Width, 80)];
//        UIButton* b=[UIButton new];
//        [b setTitle:@"查看更多评论" forState:UIControlStateNormal];
//        [b setTitleColor:[UIColor redColor] forState:(UIControlStateNormal)];
//        [b addTarget:self action:@selector(comment) forControlEvents:UIControlEventTouchUpInside];
//        [v addSubview:b];
//        [cell.contentView addSubview:v];
//
//        [b mas_makeConstraints:^(MASConstraintMaker *make) {
//            [make.center.mas_equalTo(cell.contentView)setOffset:(0)];
//            make.size.mas_equalTo(CGSizeMake(120, 40));
//        }];
//        cell.textLabel.text=@"";
//        return cell;
//    }
//    else if (indexPath.section==2)
//    {
//        cell.detailTextLabel.text=_pmodel.detailInfo;
//        return cell;
//    }
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
@end
