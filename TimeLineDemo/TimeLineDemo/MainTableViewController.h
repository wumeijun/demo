//
//  MainTableViewController.h
//  TimeLineDemo
//
//  Created by Maggie on 15/4/17.
//  Copyright (c) 2015年 Maggie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomCell.h"
@interface MainTableViewController : UITableViewController<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) NSArray *dataArray;
@property (strong, nonatomic) CustomCell *viewcell;
@end
