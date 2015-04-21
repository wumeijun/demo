//
//  cellModel.m
//  CoreDataDemo
//
//  Created by Maggie on 15/4/10.
//  Copyright (c) 2015年 Maggie. All rights reserved.
//

#import "cellModel.h"

@implementation cellModel

- (instancetype) initWithUserName:(NSString *)userName phoneNum:(NSString *)phoneNum{
    
    self = [super init];
    if (self) {
        self.userName = userName;
        self.phoneNum = phoneNum;
    }
    return self;
}

@end
