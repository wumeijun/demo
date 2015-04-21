//
//  ViewController.m
//  TouchExplorer
//
//  Created by Maggie on 15/4/1.
//  Copyright (c) 2015年 Maggie. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *image = [UIImage imageNamed:@"yosemite-meadows.png"];
    self.imageView = [[UIImageView alloc]initWithImage:image];
    self.imageView.center = CGPointMake(190, 250);
    self.imageView.userInteractionEnabled = YES;

    [self.view addSubview:self.imageView];
    //捏放
    UIPinchGestureRecognizer *pinchGestureRecognizer = [[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(handlePinch:)];
    pinchGestureRecognizer.delegate = self;
    [self.imageView addGestureRecognizer:pinchGestureRecognizer];
    
    //旋转
    UIRotationGestureRecognizer *rotationGestureRecognizer = [[UIRotationGestureRecognizer alloc]initWithTarget:self action:@selector(handleRotation:)];
    rotationGestureRecognizer.delegate = self;
    [self.imageView addGestureRecognizer:rotationGestureRecognizer];
    
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(handlePan:)];
    panGestureRecognizer.delegate = self;
    [self.imageView addGestureRecognizer:panGestureRecognizer];

//    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTap)];
//    [self.imageView addGestureRecognizer:tapGestureRecognizer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)handlePinch:(UIPinchGestureRecognizer *)pinchGestureRecognizer {
    
    self.imageView.transform = CGAffineTransformScale(self.imageView.transform, pinchGestureRecognizer.scale, pinchGestureRecognizer.scale);
    
}


- (void)handleRotation:(UIRotationGestureRecognizer *)gestureRecognizer {
    CGFloat rotation = gestureRecognizer.rotation;
//    NSLog(@"%f",rotation);
    self.imageView.transform = CGAffineTransformRotate(self.imageView.transform, rotation);
    gestureRecognizer.rotation = 0;
}

- (void)handlePan:(UIPanGestureRecognizer *)panGestureRecognizer {
    //返回要移动的距离
    CGPoint position = [panGestureRecognizer translationInView:self.view];
//    NSLog(@"%f",position.x);

    CGFloat sx = position.x + self.imageView.center.x;
    CGFloat sy = position.y + self.imageView.center.y;
    self.imageView.center = CGPointMake(sx, sy);
    [panGestureRecognizer setTranslation:CGPointMake(0, 0) inView:self.view];

}

@end
