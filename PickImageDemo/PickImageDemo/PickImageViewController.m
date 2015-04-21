//
//  ViewController.m
//  PickImageDemo
//
//  Created by Maggie on 15/4/15.
//  Copyright (c) 2015年 Maggie. All rights reserved.
//

#import "PickImageViewController.h"

@interface PickImageViewController ()

@property (strong, nonatomic) UIImagePickerController *imagePickController;
@end

@implementation PickImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.pickButton = [[UIButton alloc] initWithFrame:CGRectMake(50, 50, 50, 50)];
    [self.pickButton addTarget:self action:@selector(pickImage) forControlEvents:UIControlEventTouchUpInside];
    self.pickButton.backgroundColor = [UIColor blueColor];
    
}

- (void)pickImage{
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        _imagePickController = [[UIImagePickerController alloc] init];
        _imagePickController.sourceType = UIImagePickerControllerSourceTypeCamera;
        [self presentViewController:_imagePickController animated:YES completion:NULL];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
