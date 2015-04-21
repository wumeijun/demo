//
//  AppDelegate.h
//  View Switch
//
//  Created by Maggie on 15/3/19.
//  Copyright (c) 2015年 Maggie. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "FirstViewController.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) FirstViewController *firstViewController;
@property (strong, nonatomic) UINavigationController *navController;
@end

