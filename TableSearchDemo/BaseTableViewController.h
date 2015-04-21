//
//  BaseTableViewController.h
//  TableSearchDemo
//
//  Created by Maggie on 15/4/7.
//  Copyright (c) 2015年 Maggie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Product.h"
extern NSString *const kCellIdentifier;

@interface BaseTableViewController : UITableViewController 

- (void)configureCell:(UITableViewCell *)cell forProduct:(Product *)product;


@end
