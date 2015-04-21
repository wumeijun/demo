//
//  DIYUIButton.m
//  Cells
//
//  Created by Maggie on 15/3/27.
//  Copyright (c) 2015年 Maggie. All rights reserved.
//

#import "DIYUIButton.h"
#define KImageHeight 0.6
#define KPadding 0.1
#define KTitleHeight (1-KImageHeight-2*KPadding)
@implementation DIYUIButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    //设置文字
    [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.titleLabel.textAlignment=NSTextAlignmentCenter;
    self.titleLabel.font=[UIFont systemFontOfSize:13];
    //设置图片
    self.imageView.contentMode=UIViewContentModeScaleAspectFit;
    self.adjustsImageWhenHighlighted=NO;
    return self;
}


-(CGRect)titleRectForContentRect:(CGRect)contentRect{
    int width =contentRect.size.width;
    int height=contentRect.size.height;
    return CGRectMake(0, height*(KPadding+KImageHeight), width, height*KTitleHeight);
}

-(CGRect )imageRectForContentRect:(CGRect)contentRect{
    int width =contentRect.size.width;
    int height=contentRect.size.height;
    return CGRectMake(0, height*KPadding, width, height*KImageHeight);
    
}


@end
