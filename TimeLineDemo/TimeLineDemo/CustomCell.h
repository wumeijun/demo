//
//  CustomCell.h
//  TimeLineDemo
//
//  Created by Maggie on 15/4/17.
//  Copyright (c) 2015年 Maggie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CellFrameModel.h"

@interface CustomCell : UITableViewCell

@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic, strong) UILabel *nickNameLabel;
@property (nonatomic, strong) UILabel *dateLabel;
@property (nonatomic, strong) UILabel *infoLabel;
@property (nonatomic, strong) UIImageView *imageview;

@property (nonatomic, strong) CellFrameModel *cellFrame;

- (void)configCell:(CellFrameModel *)cellFrame;

@end
