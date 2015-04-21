//
//  DetailPhoneViewController.m
//  CoreDataDemo
//
//  Created by Maggie on 15/4/13.
//  Copyright (c) 2015年 Maggie. All rights reserved.
//

#import "DetailPhoneViewController.h"
#import "SqlDataKit.h"
@interface DetailPhoneViewController ()
@property (strong, nonatomic) UITextField *phoneNumField;
@property (strong, nonatomic) UILabel *label1;
@property (strong, nonatomic) UITextField *userNameField;
@property (strong, nonatomic) UILabel *label2;
@end

@implementation DetailPhoneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"编辑联系人";
    
    UIBarButtonItem *editPhone = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(editPhone)];
    self.navigationItem.rightBarButtonItem = editPhone;

    _label1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, 100, 30)];
    _label1.text = @"名字:";
    _userNameField = [[UITextField alloc] initWithFrame:CGRectMake(100, 10, 200, 30)];
    _userNameField.borderStyle = UITextBorderStyleRoundedRect;
    _userNameField.text = self.userName;
    [self.view addSubview:_label1];
    [self.view addSubview:_userNameField];
    
    
    _label2 = [[UILabel alloc] initWithFrame:CGRectMake(0, 45, 100, 30)];
    _label2.text = @"电话:";
    _phoneNumField = [[UITextField alloc] initWithFrame:CGRectMake(100, 45, 200, 30)];
    _phoneNumField.borderStyle = UITextBorderStyleRoundedRect;
    _phoneNumField.text = self.phoneNum;
    [self.view addSubview:_label2];
    [self.view addSubview:_phoneNumField];

}

- (void)editPhone{
    
    NSString *userName = self.userNameField.text;
    NSString *phoneNum = self.phoneNumField.text;
    int idKey = self.idKey;
    NSString *str = [NSString stringWithFormat:@"update phone set name = '%@' ,phone = '%@'  where id = %d",userName,phoneNum,idKey];
    if (![@"" isEqual:userName] && ![@"" isEqual:phoneNum]) {
        SqlDataKit *sqlData = [[SqlDataKit alloc] init];
        if ([sqlData updateData:str]) {
            [self.navigationController popViewControllerAnimated:YES];
            NSLog(@"success");
        }
       
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
