//
//  Phone.h
//  SqlLiteDemo
//
//  Created by Maggie on 15/4/15.
//  Copyright (c) 2015年 Maggie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Phone : NSObject
@property (nonatomic, retain) NSString * phoneNum;
@property (nonatomic, retain) NSString * userName;
@property (nonatomic, assign) int idKey;

- (instancetype)initWithPhoneNum:(NSString *)phoneNum userName:(NSString *)userName idKey:(int)idKey;


@end
