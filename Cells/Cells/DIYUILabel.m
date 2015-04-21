//
//  DIYUILabel.m
//  Cells
//
//  Created by Maggie on 15/3/27.
//  Copyright (c) 2015年 Maggie. All rights reserved.
//

#import "DIYUILabel.h"

@implementation DIYUILabel


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
//- (void)drawRect:(CGRect)rect {
//    // Drawing code
//    
//}

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.label = [[UILabel alloc]init];
        self.label.numberOfLines = 0;
        self.label.font = [UIFont systemFontOfSize:13];
    }
    return self;
}


@end
