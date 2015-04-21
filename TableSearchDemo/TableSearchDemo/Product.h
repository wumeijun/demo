//
//  Product.h
//  TableSearchDemo
//
//  Created by Maggie on 15/4/7.
//  Copyright (c) 2015年 Maggie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Product : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *calory;

- (instancetype)initDic:(NSDictionary *)dic ;

@end
