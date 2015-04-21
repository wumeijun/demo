//
//  DetailCellMode.m
//  TableViewCells
//
//  Created by Maggie on 15/3/28.
//  Copyright (c) 2015年 Maggie. All rights reserved.
//

#import "SubViewMode.h"

@implementation SubViewMode

-(instancetype)initWithImage:(UIImage *)image title:(NSString *)title{
    self = [super init];
    if (self) {
        self.image = image;
        self.title = title;
    }
    return self;
}

@end
