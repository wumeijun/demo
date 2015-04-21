//
//  AppDelegate.m
//  TableHeaderViewDemo
//
//  Created by Maggie on 15/4/2.
//  Copyright (c) 2015年 Maggie. All rights reserved.
//

#import "AppDelegate.h"
#import "CellModel.h"
#import "DetailDataModel.h"

@interface AppDelegate ()
@property (nonatomic, strong) NSMutableArray *plays;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.mainTableViewController = [[MainTableViewController alloc]init];
    self.nav = [[UINavigationController alloc]initWithRootViewController:self.mainTableViewController];
    self.window.rootViewController = self.nav;
    self.window.backgroundColor = [UIColor whiteColor];
    self.mainTableViewController.data = [self getData];
    [self.window makeKeyAndVisible];
    return YES;
}


- (NSArray *)getData{
    
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"PlaysAndQuotations" withExtension:@"plist"];

    NSArray *playDictionariesArray = [[NSArray alloc ] initWithContentsOfURL:url];
    self.plays = [NSMutableArray arrayWithCapacity:[playDictionariesArray count]];
    
    for (NSDictionary *dic in playDictionariesArray) {
        
        CellModel *cellModel = [[CellModel alloc] init];
        cellModel.playName = dic[@"playName"];
        
        NSArray *quotationDictionaries = dic[@"quotations"];
        NSMutableArray *quotations = [NSMutableArray arrayWithCapacity:[quotationDictionaries count]];
        
        for (NSDictionary *dicData in quotationDictionaries) {
            DetailDataModel *detailDataModel = [[DetailDataModel alloc]init];
            [detailDataModel setValuesForKeysWithDictionary:dicData];
            [quotations addObject:detailDataModel];
        }
        
        cellModel.quotations = quotations;
        [self.plays addObject:cellModel];
    }
    
    return self.plays;
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
