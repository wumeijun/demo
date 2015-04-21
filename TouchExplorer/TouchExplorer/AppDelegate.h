//
//  AppDelegate.h
//  TouchExplorer
//
//  Created by Maggie on 15/4/1.
//  Copyright (c) 2015年 Maggie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UINavigationController *nav;
@property (strong, nonatomic) MainViewController *mainViewController;
@end

