//
//  CellFrameModel.h
//  TimeLineDemo
//
//  Created by Maggie on 15/4/17.
//  Copyright (c) 2015年 Maggie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "CellModel.h"

@interface CellFrameModel : NSObject

@property (nonatomic, strong) CellModel *cellModel;
@property (nonatomic, assign) CGRect iconFrame;
@property (nonatomic, assign) CGRect nickNameFrame;
@property (nonatomic, assign) CGRect dateFrame;
@property (nonatomic, assign) CGRect infoFrame;
@property (nonatomic, assign) CGRect imageFrame;
@property (nonatomic, assign) CGFloat cellheight;
@property (nonatomic, assign) CGFloat cellWidth;

-(void)configCellFrame;
@end
