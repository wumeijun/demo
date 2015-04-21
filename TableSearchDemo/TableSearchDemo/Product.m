//
//  Product.m
//  TableSearchDemo
//
//  Created by Maggie on 15/4/7.
//  Copyright (c) 2015年 Maggie. All rights reserved.
//

#import "Product.h"

@implementation Product

- (instancetype)initDic:(NSDictionary *)dic

{
    self = [super init];
    if ( self ) {
        self.name = dic[@"name"];
        self.calory = dic[@"calory"];
    }
    return self;
}
@end
