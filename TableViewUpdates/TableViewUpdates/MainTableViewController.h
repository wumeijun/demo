//
//  ViewController.h
//  TableViewUpdates
//
//  Created by Maggie on 15/3/30.
//  Copyright (c) 2015年 Maggie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainTableViewController : UITableViewController<UITableViewDelegate, UITableViewDataSource>

@property(nonatomic,strong)NSArray *dataList;

@end

