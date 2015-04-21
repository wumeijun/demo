//
//  AppDelegate.h
//  TableHeaderViewDemo
//
//  Created by Maggie on 15/4/2.
//  Copyright (c) 2015年 Maggie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainTableViewController.h"
#import <Foundation/Foundation.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UINavigationController *nav;
@property (strong, nonatomic) MainTableViewController *mainTableViewController;

@end

