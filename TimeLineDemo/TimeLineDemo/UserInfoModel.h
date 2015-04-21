//
//  UserInfoModel.h
//  TimeLineDemo
//
//  Created by Maggie on 15/4/17.
//  Copyright (c) 2015年 Maggie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserInfoModel : NSObject

@property (nonatomic, strong) NSString *nickname;
@property (nonatomic, strong) NSData *avatar_url;
@property (nonatomic, strong) NSString *descript;

- (instancetype)initDic:(NSDictionary *)dic ;

@end
