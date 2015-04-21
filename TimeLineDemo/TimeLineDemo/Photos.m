//
//  Photos.m
//  TimeLineDemo
//
//  Created by Maggie on 15/4/17.
//  Copyright (c) 2015年 Maggie. All rights reserved.
//

#import "Photos.h"

@implementation Photos
- (instancetype)initWithDic:(NSDictionary *)dic{
    
    self = [super init];
    if (self) {
        self.small_url = dic[@"small_url"];
    }
    return self;
}

@end
