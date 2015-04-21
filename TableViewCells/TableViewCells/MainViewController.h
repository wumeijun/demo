//
//  ViewController.h
//  TableViewCells
//
//  Created by Maggie on 15/3/28.
//  Copyright (c) 2015年 Maggie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UITableViewController<UITableViewDataSource,UITableViewDelegate,UISearchControllerDelegate>

@property (strong,nonatomic) NSArray *array;
@property (assign,nonatomic) CGFloat windowWidth;

@end

