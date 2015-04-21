//
//  ViewController.h
//  SqlLiteDemo
//
//  Created by Maggie on 15/4/14.
//  Copyright (c) 2015年 Maggie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainTableViewController : UITableViewController<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) NSMutableArray *array;
@end

