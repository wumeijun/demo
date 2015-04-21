//
//  AppDelegate.h
//  CollectionViewDemo
//
//  Created by Maggie on 15/3/30.
//  Copyright (c) 2015年 Maggie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"
#import "ViewController.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UINavigationController *nav;
@property (strong, nonatomic) MainViewController *mainViewController;
@property (strong, nonatomic) ViewController *cc;
@end

