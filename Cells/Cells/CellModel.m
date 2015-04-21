//
//  CellModel.m
//  Cells
//
//  Created by Maggie on 15/3/26.
//  Copyright (c) 2015年 Maggie. All rights reserved.
//

#import "CellModel.h"

@implementation CellModel

- (instancetype)initWithImage:(UIImage *)image title:(NSString *)title
{
    self = [super init];
    if ( self ) {
        self.image = image;
        self.title = title;
    }
    return self;
}

@end
