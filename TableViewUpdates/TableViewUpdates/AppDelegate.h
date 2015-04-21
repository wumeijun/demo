//
//  AppDelegate.h
//  TableViewUpdates
//
//  Created by Maggie on 15/3/30.
//  Copyright (c) 2015年 Maggie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainTableViewController.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UINavigationController *nav;
@property (strong, nonatomic) MainTableViewController *mainTableViewController;

@end

