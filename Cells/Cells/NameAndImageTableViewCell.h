//
//  NameAndImageTableViewCell.h
//  Cells
//
//  Created by Maggie on 15/3/25.
//  Copyright (c) 2015年 Maggie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CellModel.h"
@interface NameAndImageTableViewCell : UITableViewCell

@property(strong,nonatomic) UILabel *nameLabel;
@property(strong,nonatomic) UIImageView *ImageView;
- (CGFloat)calTextHeight;
- (CGFloat)calImageHeight;
- (CGFloat)calCellHeight;

- (void)configCellModel:(CellModel *)model;

@end


