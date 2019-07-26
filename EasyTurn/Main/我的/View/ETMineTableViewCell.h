//
//  ETMineTableViewCell.h
//  EasyTurn
//
//  Created by 王翔 on 2019/7/19.
//  Copyright © 2019年 EasyTurn. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ETMineTableViewCell : UITableViewCell
@property(nonatomic,strong)UIImageView *thingImg;
@property(nonatomic,strong)UILabel *comLab;
@property(nonatomic,strong)UILabel *sellLab;
@property(nonatomic,strong)UIImageView *seatLab;
@property(nonatomic,strong)UILabel *placeLab;
@property(nonatomic,strong)UILabel *glanceLab;
@property(nonatomic,strong)UILabel *renovateLab;
@property(nonatomic,strong)UILabel *priceLab;
@property(nonatomic,strong)UIButton *freshBtn;
@property(nonatomic,strong)UIButton *deleteBtn;

NS_ASSUME_NONNULL_END
