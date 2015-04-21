//
//  SectionHeaderView.m
//  TableHeaderViewDemo
//
//  Created by Maggie on 15/4/2.
//  Copyright (c) 2015年 Maggie. All rights reserved.
//

#import "SectionHeaderView.h"

@implementation SectionHeaderView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithReuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.button = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.button setImage:[UIImage imageNamed:@"carat.png"] forState:UIControlStateNormal];
        [self.button setImage:[UIImage imageNamed:@"carat-open.png"] forState:UIControlStateSelected];

    }
    
    return self;
    
}


@end
