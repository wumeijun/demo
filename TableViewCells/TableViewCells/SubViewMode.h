//
//  DetailCellMode.h
//  TableViewCells
//
//  Created by Maggie on 15/3/28.
//  Copyright (c) 2015年 Maggie. All rights reserved.
//  每个cell里存放了3个UIView,该mode存放UIview里明显的数据

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SubViewMode : NSObject
@property (strong, nonatomic) UIImage *image;
@property (strong, nonatomic) NSString *title;

- (instancetype)initWithImage:(UIImage *)image title:(NSString *)title;

@end
