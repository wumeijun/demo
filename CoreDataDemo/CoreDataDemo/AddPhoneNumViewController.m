//
//  AddPhoneNumViewController.m
//  CoreDataDemo
//
//  Created by Maggie on 15/4/10.
//  Copyright (c) 2015年 Maggie. All rights reserved.
//

#import "AddPhoneNumViewController.h"
#import "SqlDataKit.h"
#import "Phone.h"
@interface AddPhoneNumViewController ()

@end

@implementation AddPhoneNumViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"新建联系人";
    
    UIBarButtonItem *saveButton = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(savePhoneNum)];
    self.navigationItem.rightBarButtonItem = saveButton;
    
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, 100, 30)];
    label1.text = @"名字:";
    self.userNameField = [[UITextField alloc] initWithFrame:CGRectMake(100, 10, 200, 30)];
    self.userNameField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:label1];
    [self.view addSubview:self.userNameField];
    
    
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(0, 45, 100, 30)];
    label2.text = @"电话:";
    self.phoneNumField = [[UITextField alloc] initWithFrame:CGRectMake(100, 45, 200, 30)];
    self.phoneNumField.borderStyle = UITextBorderStyleRoundedRect;

    [self.view addSubview:label2];
    [self.view addSubview:self.phoneNumField];
    
}

- (void)savePhoneNum{
    
    NSString *userName = self.userNameField.text;
    NSString *phoneNum = self.phoneNumField.text;
    Phone *phone = [[Phone alloc] init];
    phone.userName = userName;
    phone.phoneNum = phoneNum;
    if (![@""  isEqual: userName] && ![@""  isEqual: phoneNum]) {
        SqlDataKit *sqlData = [[SqlDataKit alloc] init];
        [sqlData insertData:phone];
        [self.navigationController popViewControllerAnimated:YES];
        
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
