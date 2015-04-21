//
//  DetailDataModel.h
//  TableHeaderViewDemo
//
//  Created by Maggie on 15/4/2.
//  Copyright (c) 2015年 Maggie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DetailDataModel : NSObject

@property (assign, nonatomic) NSInteger act;
@property (assign, nonatomic) NSInteger scene;
@property (strong, nonatomic) NSString *character;
@property (strong, nonatomic) NSString *quotation;

@end
