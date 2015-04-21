//
//  CellMode.m
//  CollectionViewDemo
//
//  Created by Maggie on 15/3/31.
//  Copyright (c) 2015年 Maggie. All rights reserved.
//

#import "CellModel.h"

@implementation CellModel
- (instancetype)initWithImage:(NSString *)imageName title:(NSString *)titleValue
{
    self = [super init];
    if ( self ) {
        self.imageName = imageName;
        self.titleValue = titleValue;
    }
    return self;
}

@end
