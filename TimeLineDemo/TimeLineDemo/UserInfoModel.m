//
//  UserInfoModel.m
//  TimeLineDemo
//
//  Created by Maggie on 15/4/17.
//  Copyright (c) 2015年 Maggie. All rights reserved.
//

#import "UserInfoModel.h"

@implementation UserInfoModel

- (instancetype)initDic:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        self.nickname = dic[@"nickname"];
        self.avatar_url = dic[@"avatar_url"];
        self.descript = dic[@"description"];
    }
    return self;
}


@end
