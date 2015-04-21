//
//  AppDelegate.m
//  Pickers
//
//  Created by Maggie on 15/3/22.
//  Copyright (c) 2015年 Maggie. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    self.rootController = [[UITabBarController alloc]init];
    self.window.rootViewController = self.rootController;
    self.window.backgroundColor = [UIColor whiteColor];
    
    self.datePicker = [[BIDDatePickerViewController alloc]init];
    self.singleComponentPicker = [[BIDSingleComponentPickerViewController alloc]init];
    self.dependentComponentPicker = [[BIDDependentComponentPickerViewController alloc]init];
    self.doubleComponentPicker = [[BIDDoubleComponentPickerViewController alloc]init];
    self.customPicker = [[BIDCustomPickerViewController alloc]init];
    
    self.datePicker.tabBarItem.title = @"Date";
    self.singleComponentPicker.tabBarItem.title = @"single";
    self.dependentComponentPicker.tabBarItem.title = @"dependent";
    self.doubleComponentPicker.tabBarItem.title = @"double";
    self.customPicker.tabBarItem.title = @"custom";
    
    self.datePicker.tabBarItem.image = [UIImage imageNamed:@"clockicon"];
    self.singleComponentPicker.tabBarItem.image = [UIImage imageNamed:@"singleicon"];
    self.dependentComponentPicker.tabBarItem.image = [UIImage imageNamed:@"dependenticon"];
    self.doubleComponentPicker.tabBarItem.image = [UIImage imageNamed:@"doubleicon"];
    self.customPicker.tabBarItem.image = [UIImage imageNamed:@"toolicon"];

    
    
    NSArray *controllers = [NSArray arrayWithObjects:self.datePicker,self.singleComponentPicker,self.dependentComponentPicker,self.doubleComponentPicker,self.customPicker,nil];
    
    self.rootController.viewControllers = controllers;
    
    
    [self.window makeKeyAndVisible];
    
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
