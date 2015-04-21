//
//  TimeLineInfo.h
//  TimeLineDemo
//
//  Created by Maggie on 15/4/17.
//  Copyright (c) 2015年 Maggie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TimeLineInfo : NSObject
@property (strong, nonatomic) NSString *body;
@property (strong, nonatomic) NSData *created_at;
@property (strong, nonatomic) NSArray *photos;
@property (strong, nonatomic) NSArray *user;

@end
