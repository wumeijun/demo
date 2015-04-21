//
//  ResultsViewController.m
//  TableSearchDemo
//
//  Created by Maggie on 15/4/7.
//  Copyright (c) 2015年 Maggie. All rights reserved.
//

#import "ResultsViewController.h"
#import "Product.h"

@interface ResultsViewController ()

@end

@implementation ResultsViewController



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.filteredProducts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = (UITableViewCell *)[self.tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
    
    Product *product = self.filteredProducts[indexPath.row];

    [self configureCell:cell forProduct:product];
    
    return cell;
}

@end
