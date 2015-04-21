//
//  MainTableViewController.h
//  TableHeaderViewDemo
//
//  Created by Maggie on 15/4/2.
//  Copyright (c) 2015年 Maggie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainTableViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSArray *data;

@end
