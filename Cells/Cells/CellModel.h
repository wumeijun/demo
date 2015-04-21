//
//  CellModel.h
//  Cells
//
//  Created by Maggie on 15/3/26.
//  Copyright (c) 2015年 Maggie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CellModel : NSObject

@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) NSString *title;

- (instancetype)initWithImage:(UIImage *)image title:(NSString *)title;

@end
