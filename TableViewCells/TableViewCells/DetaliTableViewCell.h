//
//  CellViewTableViewCell.h
//  TableViewCells
//
//  Created by Maggie on 15/3/28.
//  Copyright (c) 2015年 Maggie. All rights reserved.
// 定义每个cell的视图

#import <UIKit/UIKit.h>
#import "SubViewMode.h"

#define RCellHeight 100

@interface DetaliTableViewCell : UITableViewCell
@property (nonatomic,assign) CGFloat width;
//设置cell的数据
- (void)configCellModel:(NSArray *)DataList;

@end
