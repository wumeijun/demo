//
//  ACollectionViewCell.m
//  CollectionViewDemo
//
//  Created by Maggie on 15/3/30.
//  Copyright (c) 2015年 Maggie. All rights reserved.
//

#import "CollectionCell.h"

@implementation CollectionCell

- (void)layoutSubviews
{
    [super layoutSubviews];
        self.imageView.frame = CGRectMake(0, 0, 96, 105);
        self.label.frame = CGRectMake(0, 105, 96, 18);
}


- (id)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        self.label = [[UILabel alloc]init];
        self.label.textColor = [UIColor whiteColor];
        self.label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.label];
        self.imageView = [[UIImageView alloc]init];
        self.imageView.contentMode = UIViewContentModeScaleToFill;
        [self addSubview:self.imageView];
        self.layer.borderWidth = 3;
        self.layer.borderColor = [[UIColor colorWithWhite:1 alpha:1] CGColor];
    }
      return self;
}

- (void)configCellModel:(CellModel *)model{
    self.label.text = model.titleValue;
    self.imageView.image = [UIImage imageNamed:model.imageName];
    [self layoutIfNeeded];

}


@end
