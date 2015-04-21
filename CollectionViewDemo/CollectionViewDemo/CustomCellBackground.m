//
//  CustomCellBackground.m
//  CollectionViewDemo
//
//  Created by Maggie on 15/3/31.
//  Copyright (c) 2015年 Maggie. All rights reserved.
//

#import "CustomCellBackground.h"

@implementation CustomCellBackground

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGContextRef aRef = UIGraphicsGetCurrentContext();
    CGContextSaveGState(aRef);
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:5.0f];
    [bezierPath setLineWidth:5.0f];
    [[UIColor blackColor] setStroke];
    
    UIColor *fillColor = [UIColor colorWithRed:0.529 green:0.808 blue:0.922 alpha:1]; // color equivalent is #87ceeb
    [fillColor setFill];
    
    [bezierPath stroke];
    [bezierPath fill];
    CGContextRestoreGState(aRef);
}

@end
