//
//  AppDelegate.h
//  TimeLineDemo
//
//  Created by Maggie on 15/4/17.
//  Copyright (c) 2015年 Maggie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainTableViewController.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) MainTableViewController *mainTableViewController;
@property (strong, nonatomic) UINavigationController *nav;
@end

