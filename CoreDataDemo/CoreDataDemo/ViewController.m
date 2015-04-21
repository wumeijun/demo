//
//  ViewController.m
//  CoreDataDemo
//
//  Created by Maggie on 15/4/7.
//  Copyright (c) 2015年 Maggie. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
    [self.textField setBorderStyle:UITextBorderStyleRoundedRect];
    self.textField.delegate = self;
    [self.view addSubview:self.textField];
    
    self.numField = [[UITextField alloc] initWithFrame:CGRectMake(0, 60, 100, 50)];
    [self.numField setBorderStyle:UITextBorderStyleRoundedRect];
    self.numField.delegate = self;
     [self.view addSubview:self.numField];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
