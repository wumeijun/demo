//
//  AddDataViewController.m
//  Cells
//
//  Created by Maggie on 15/3/24.
//  Copyright (c) 2015年 Maggie. All rights reserved.
//

#import "AddDataViewController.h"

@interface AddDataViewController ()

@end

@implementation AddDataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 100)];
    self.label.text = self.value;
    [self.view addSubview:self.label];
    
//    自定义tabbar
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"添加" style:UIBarButtonItemStylePlain target:self action:@selector(add:)];
    self.navigationItem.rightBarButtonItem = item;
    
    
    self.text1 = [[UITextField alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-50,120, 100, 30)];
    self.text1.delegate = self;
    self.text1.borderStyle = UITextBorderStyleRoundedRect;
    self.text1.placeholder = @"Enter text here … ";
    [self.text1 becomeFirstResponder];
//    self.text1.keyboardType=UIKeyboardTypeDefault;//设置键盘类型为默认的
//    self.text1.returnKeyType=UIReturnKeyDefault;//返回键的类型
    [self.view addSubview:self.text1];

}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.text1 resignFirstResponder];
    return YES;
}


//add data
- (void)add:(id)sender{
    NSString *value = self.text1.text;
    if ([value  isEqual: @""] == NO) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"" message:value delegate:self cancelButtonTitle:@"取消" otherButtonTitles: nil];
        [alert show];
    }else{
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"" message:@"请输入" delegate:self cancelButtonTitle:@"取消" otherButtonTitles: nil];
        [alert show];
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
