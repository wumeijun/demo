//
//  CellMode.h
//  CollectionViewDemo
//
//  Created by Maggie on 15/3/31.
//  Copyright (c) 2015年 Maggie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CellModel : NSObject
@property (strong,nonatomic) NSString *imageName;
@property (strong,nonatomic) NSString *titleValue;
- (instancetype)initWithImage:(NSString *)imageName title:(NSString *)titleValue;

@end
