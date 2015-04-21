//
//  Photos.h
//  TimeLineDemo
//
//  Created by Maggie on 15/4/17.
//  Copyright (c) 2015年 Maggie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Photos : NSObject
@property (strong, nonatomic) NSData *small_url;
@property (assign, nonatomic) NSInteger preview_width;
@property (assign, nonatomic) NSInteger preview_height;
- (instancetype)initWithDic:(NSDictionary *)dic;
@end
