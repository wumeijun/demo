//
//  PhoneNumTableViewController.h
//  CoreDataDemo
//
//  Created by Maggie on 15/4/10.
//  Copyright (c) 2015年 Maggie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddPhoneNumViewController.h"
#import "Phone.h"
@interface PhoneNumTableViewController : UITableViewController<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) AddPhoneNumViewController *addPhoneNumViewController;
@property (strong, nonatomic) NSMutableArray *arrays;

- (void)configureCell:(UITableViewCell *)cell forPhone:(Phone *)phone;

@end
