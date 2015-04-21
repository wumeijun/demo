//
//  BaseTableViewController.m
//  TableSearchDemo
//
//  Created by Maggie on 15/4/7.
//  Copyright (c) 2015年 Maggie. All rights reserved.
//

#import "BaseTableViewController.h"

NSString *const kCellIdentifier = @"cellID";
NSString *const kTableCellNibName = @"TableCell";

@interface BaseTableViewController ()

@end

@implementation BaseTableViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kCellIdentifier];
    
    
}

- (void)configureCell:(UITableViewCell *)cell forProduct:(Product *)product {
    cell.textLabel.text = product.name;
}

@end
