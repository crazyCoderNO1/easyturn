//
//  MEVIPTableViewCell.m
//  EasyTurn
//
//  Created by 王翔 on 2019/7/22.
//  Copyright © 2019年 EasyTurn. All rights reserved.
//

#import "MEVIPTableViewCell.h"

@implementation MEVIPTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab=[[UILabel alloc]init];
        
    }
    return _titleLab;
}
@end
