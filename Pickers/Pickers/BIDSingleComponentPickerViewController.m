//
//  BIDSingleComponentPickerViewController.m
//  Pickers
//
//  Created by Maggie on 15/3/22.
//  Copyright (c) 2015年 Maggie. All rights reserved.
//

#import "BIDSingleComponentPickerViewController.h"

@interface BIDSingleComponentPickerViewController ()

@end

@implementation BIDSingleComponentPickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.pickerView = [[UIPickerView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 216)];
    self.pickerView.showsSelectionIndicator=YES;
    self.pickerView.delegate = self;
    [self.view addSubview:self.pickerView];
    
    self.pickData = [[NSArray alloc]initWithObjects:@"许嵩",@"周杰伦",@"梁静茹",@"许飞",@"凤凰传奇",@"阿杜",@"方大同",@"林俊杰",@"胡夏",@"邱永传", nil];
    
    self.btn = [[UIButton alloc]init];
    [self.btn addTarget:self action:@selector(buttonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.btn setTitle:@"Button" forState:UIControlStateNormal];
    self.btn.backgroundColor = [UIColor brownColor];
    [self.view addSubview:self.btn];
    
    self.btn.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *centerX=[NSLayoutConstraint constraintWithItem:self.btn attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
    
    NSLayoutConstraint *topR=[NSLayoutConstraint constraintWithItem:self.btn attribute:NSLayoutAttributeTop  relatedBy:NSLayoutRelationEqual toItem:self.pickerView attribute:NSLayoutAttributeBottom  multiplier:1 constant:20];
    
    [self.view addConstraint:centerX];
    [self.view addConstraint:topR];
}

- (void)buttonPressed{
    NSInteger row = [self.pickerView selectedRowInComponent:0];
    NSString *value = [self.pickData objectAtIndex:row];
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"" message:value delegate:self cancelButtonTitle:@"取消" otherButtonTitles: nil];
    [alertView show];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//列数
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}
//行数
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [self.pickData count];
}

//返回当前行的内容,此处是将数组中数值添加到滚动的那个显示栏上
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [self.pickData objectAtIndex:row];
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
