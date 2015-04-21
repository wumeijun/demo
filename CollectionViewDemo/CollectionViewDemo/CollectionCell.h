//
//  ACollectionViewCell.h
//  CollectionViewDemo
//
//  Created by Maggie on 15/3/30.
//  Copyright (c) 2015年 Maggie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CellModel.h"
#import "CustomCellBackground.h"
@interface CollectionCell : UICollectionViewCell

@property (strong,nonatomic) UILabel *label;
@property (strong,nonatomic) UIImageView *imageView;

- (void)configCellModel:(CellModel *)model;

@end
