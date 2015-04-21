//
//  BINDatePickerViewController.m
//  Pickers
//  日期选择器
//  Created by Maggie on 15/3/22.
//  Copyright (c) 2015年 Maggie. All rights reserved.
//

#import "BIDDatePickerViewController.h"

@interface BIDDatePickerViewController ()

@end

@implementation BIDDatePickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.datePicker = [[UIDatePicker alloc]init];
    NSDate *now = [NSDate date];
    [self.datePicker setDate:now animated:NO];
    [self.view addSubview:self.datePicker];
    
    self.button = [[UIButton alloc]init];
    [self.button addTarget:self action:@selector(buttonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.button setTitle:@"Button" forState:UIControlStateNormal];
    self.button.backgroundColor = [UIColor brownColor];
    [self.view addSubview:self.button];
    
    self.button.translatesAutoresizingMaskIntoConstraints = NO;

    NSLayoutConstraint *centerX=[NSLayoutConstraint constraintWithItem:self.button attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
    
    NSLayoutConstraint *topR=[NSLayoutConstraint constraintWithItem:self.button attribute:NSLayoutAttributeTop  relatedBy:NSLayoutRelationEqual toItem:self.datePicker attribute:NSLayoutAttributeBottom  multiplier:1 constant:20];
    
    [self.view addConstraint:centerX];
    [self.view addConstraint:topR];
    
    
}

- (void)buttonPressed{
    
    NSDate *selected = self.datePicker.date;
    NSString *message = [[NSString alloc]initWithFormat:@"message is %@",selected];
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Date and time selected" message:message delegate:self cancelButtonTitle:@"Yes,I did." otherButtonTitles:nil];
    [alert show];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
