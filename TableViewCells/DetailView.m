//
//  DetailView.m
//  TableViewCells
//
//  Created by Maggie on 15/3/28.
//  Copyright (c) 2015年 Maggie. All rights reserved.
//

#import "DetailView.h"

@implementation DetailView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)layoutSubviews
{
    [super layoutSubviews];
//     NSLog(@"%@", NSStringFromCGRect(self.frame));
    self.label.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height * 0.8);
    self.imageView.frame = CGRectMake(0, self.frame.size.height * 0.8, self.frame.size.width, self.frame.size.height * 0.2);
}

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        self.label = [[UILabel alloc]init];
        self.label.tag = 1001;
        self.label.backgroundColor = [UIColor redColor];
        [self addSubview:self.label];

        self.imageView = [[UIImageView alloc]init];
        self.imageView.contentMode = UIViewContentModeCenter;
        self.imageView.tag = 1000;
        [self addSubview:self.imageView];
        
    }
    return self;
}



@end
