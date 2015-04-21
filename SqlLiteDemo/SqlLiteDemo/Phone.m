//
//  Phone.m
//  SqlLiteDemo
//
//  Created by Maggie on 15/4/15.
//  Copyright (c) 2015年 Maggie. All rights reserved.
//

#import "Phone.h"

@implementation Phone


- (instancetype)initWithPhoneNum:(NSString *)phoneNum userName:(NSString *)userName idKey:(int)idKey{
    
    self = [super init];
    if (self) {
        self.userName = userName;
        self.phoneNum = phoneNum;
        self.idKey = idKey;
    }
    return self;
}




@end
