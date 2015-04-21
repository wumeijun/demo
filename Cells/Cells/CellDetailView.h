//
//  CellDetailView.h
//  Cells
//
//  Created by Maggie on 15/3/27.
//  Copyright (c) 2015年 Maggie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CellModel.h"
@interface CellDetailView : UIView
@property (strong,nonatomic) UILabel *nameLabel;
@property (strong,nonatomic) UIImageView *imageView;
- (void)configModel:(CellModel *)model;
- (CGFloat)calTextHeight:(CGFloat *)height;
- (CGFloat)calImageHeight;
- (CGFloat)calDetailViewHeight:(CGFloat *)height;
@end
