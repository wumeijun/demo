//
//  ViewController.m
//  TableViewUpdates
//
//  Created by Maggie on 15/3/30.
//  Copyright (c) 2015年 Maggie. All rights reserved.
//

#import "MainTableViewController.h"

@interface MainTableViewController ()

@end

@implementation MainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self LoadData];
}

- (NSArray *)LoadData{
    if (_dataList == NULL) {
        NSURL *url = [[NSBundle mainBundle] URLForResource:@"PlaysAndQuotations" withExtension:@"plist"];
        NSArray *array = [[NSArray alloc]initWithContentsOfURL:url];
        
        for (NSDictionary *dictionary in array) {
            
        }
        NSLog(@"%@",array[0]);
        
    }
    return _dataList;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
