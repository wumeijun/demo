//
//  DetailViewController.m
//  CollectionViewDemo
//
//  Created by Maggie on 15/3/31.
//  Copyright (c) 2015年 Maggie. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property (strong, nonatomic) UIImageView *imageView;
@end

@implementation DetailViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    UIImage *image =  [UIImage imageNamed:self.imageName];
    self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
    self.imageView.image = image;
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:self.imageView];


    
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
