//
//  AppDelegate.h
//  SqlLiteDemo
//
//  Created by Maggie on 15/4/14.
//  Copyright (c) 2015年 Maggie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainTableViewController.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) MainTableViewController *mainViewController;
@property (strong, nonatomic) UINavigationController *nav;
@end

