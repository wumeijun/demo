//
//  DetailButton.m
//  TableViewCells
//
//  Created by Maggie on 15/3/30.
//  Copyright (c) 2015年 Maggie. All rights reserved.
//

#import "DetailButton.h"

@implementation DetailButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.imageView.contentMode = UIViewContentModeScaleToFill;
        self.titleLabel.font = [UIFont systemFontOfSize:15.0f];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        [self addTarget:self action:@selector(handle) forControlEvents:UIControlEventTouchUpOutside];
    }
    return self;
}



@end
