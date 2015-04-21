//
//  BIDDoubleComponentPickerViewController.m
//  Pickers
//
//  Created by Maggie on 15/3/22.
//  Copyright (c) 2015年 Maggie. All rights reserved.
//

#import "BIDDoubleComponentPickerViewController.h"

@interface BIDDoubleComponentPickerViewController ()

@end

@implementation BIDDoubleComponentPickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initPicker];
}


- (void)initPicker{
    NSBundle *bundle = [NSBundle mainBundle];
//    NSString *plistPath = [bundle pathForResource:@"provinces_cities" ofType:@"plist"];
//    self.dict = [[NSDictionary alloc]initWithContentsOfFile:plistPath];
//    
    NSURL *plistPath = [bundle URLForResource:@"provinces_cities" withExtension:@"plist"];
    self.dict = [[NSDictionary alloc]initWithContentsOfURL:plistPath];
    
    self.provinceArray = self.dict.allKeys;
    NSInteger row = [self.doublePickerView selectedRowInComponent:0];
    NSString *selectedProvince = [self.provinceArray objectAtIndex:row];
    self.cityArray = [self.dict objectForKey:selectedProvince];
    
    self.doublePickerView = [[UIPickerView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 216)];
    self.doublePickerView.delegate = self;
    [self.view addSubview:self.doublePickerView];

    
}

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (component == 0) {
        return  [self.provinceArray count];
    }else{
        return [self.cityArray count];
    }
}
//展示数据
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if (component == 0) {
        return  [self.provinceArray objectAtIndex:row];
    }else{
        return [self.cityArray objectAtIndex:row];
    }
}

//监控滚轮
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if(component == 0){
        NSString *selectedProvince = [self.provinceArray objectAtIndex:row];
        self.cityArray = [self.dict objectForKey:selectedProvince];
        //重新加载第二个滚轮的数据
        [self.doublePickerView reloadComponent:1];
    }
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
