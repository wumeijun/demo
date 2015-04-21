//
//  AppDelegate.h
//  TableSearchDemo
//
//  Created by Maggie on 15/4/7.
//  Copyright (c) 2015年 Maggie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "MainViewController.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (strong, nonatomic) MainViewController *mainViewController;
@property (strong, nonatomic) UINavigationController *nav;
- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;


@end

