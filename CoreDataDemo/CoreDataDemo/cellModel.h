//
//  cellModel.h
//  CoreDataDemo
//
//  Created by Maggie on 15/4/10.
//  Copyright (c) 2015年 Maggie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface cellModel : NSObject

@property (strong, nonatomic) NSString *userName;
@property (strong, nonatomic) NSString *phoneNum;

- (instancetype) initWithUserName:(NSString *)userName phoneNum:(NSString *)phoneNum;
@end
