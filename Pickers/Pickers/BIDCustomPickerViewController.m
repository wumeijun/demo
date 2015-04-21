
//
//  BIDCustomPickerViewController.m
//  Pickers
//
//  Created by Maggie on 15/3/22.
//  Copyright (c) 2015年 Maggie. All rights reserved.
//

#import "BIDCustomPickerViewController.h"

@interface BIDCustomPickerViewController ()

@end

@implementation BIDCustomPickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
}

- (void)initView{
    self.customPickerView = [[UIPickerView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 217)];
    self.customPickerView.delegate = self;
    [self.view addSubview:self.customPickerView];
    
    self.imagesArray = @[[UIImage imageNamed:@"apple"],[UIImage imageNamed:@"bar"],[UIImage imageNamed:@"cherry"],[UIImage imageNamed:@"crown"],[UIImage imageNamed:@"lemon"],[UIImage imageNamed:@"seven"]];
    
    
    self.label = [[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width*0.2, 300, 150, 150)];
    self.label.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.label];
    
    self.button = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.button setFrame:CGRectMake(self.view.frame.size.width*0.5-35, 530, 70, 30)];
//    self.button.backgroundColor = [UIColor blueColor];
    [self.button addTarget:self action:@selector(clicked) forControlEvents:UIControlEventTouchUpInside];
    [self.button setTitle:@"spin" forState:UIControlStateNormal];
    [self.view addSubview:self.button];
    
    //生成一个随机种子
    srandom((unsigned)time(NULL));
}

- (void)clicked{
    BOOL win = NO;
    int num = 1;
    int lastRowVal = -1;
    //生成每个组件被选中图像的下标,reload 组件
    for (int i = 0; i < 5; i++) {
        NSInteger newRowVal = random() % [self.imagesArray count];
        [self.customPickerView selectRow:newRowVal inComponent:i animated:YES];
        [self.customPickerView reloadComponent:i];
        
        if (newRowVal == lastRowVal) {
            num++;
        }else{
            num = 1;
        }
        lastRowVal = (int)newRowVal;
        if(num >=3){
            win = YES;
        }
    }
    
    if (win) {
        self.label.text = @"WIN!";
    } else {
        self.label.text = @"NO";
    }
    
    
}

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 5;
}
// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [self.imagesArray count];
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    UIImage *image = [self.imagesArray objectAtIndex:row];
    UIImageView *imageView = [[UIImageView alloc]initWithImage:image];
    return imageView;
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
