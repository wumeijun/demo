//
//  ViewController.m
//  CollectionViewDemo
//
//  Created by Maggie on 15/3/30.
//  Copyright (c) 2015年 Maggie. All rights reserved.
//

#import "MainViewController.h"
#define kcell @"cell"
#import "DetailViewController.h"

@interface MainViewController ()

@property (nonatomic, strong) UICollectionView *collectionView;
@end

@implementation MainViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    UICollectionViewFlowLayout *flowLayout =[[UICollectionViewFlowLayout alloc]init];
    self.collectionView  =[[UICollectionView alloc]initWithFrame:self.view.bounds
                                            collectionViewLayout:flowLayout];
       self.collectionView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    [self.collectionView registerClass:[CollectionCell class] forCellWithReuseIdentifier:kcell];
    [self.view addSubview:self.collectionView];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;

    
    //长按
    UILongPressGestureRecognizer *press = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handlePress:)];
    press.delegate = self;
    [self.collectionView addGestureRecognizer:press];
    
    //捏放
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(handlePinch:)];
    pinch.delegate = self;

    [self.collectionView addGestureRecognizer:pinch];
    
    //旋转
    UIRotationGestureRecognizer *rotation = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(handleRotation:)];
    rotation.delegate = self;

    [self.collectionView addGestureRecognizer:rotation];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 32;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CollectionCell *cell = (CollectionCell *)[collectionView dequeueReusableCellWithReuseIdentifier:kcell forIndexPath:indexPath];
    
    cell.label.text = [NSString stringWithFormat:@"{%ld,%ld}", (long)indexPath.row, (long)indexPath.section];
    
    NSString *imageToLoad = [NSString stringWithFormat:@"%ld.JPG", (long)indexPath.row];
    cell.imageView.image = [UIImage imageNamed:imageToLoad];
    return cell;
}

//定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

//
//定义每个UICollectionView 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(96, 123);
}
//定义每个UICollectionView 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(5, 5, 5, 5);
}

//选择了某个cell
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSString *imageName = [NSString stringWithFormat:@"%ld_full.JPG", (long)indexPath.row];
    DetailViewController *detailView = [[DetailViewController alloc]init];
    detailView.imageName = imageName;
    [self.navigationController pushViewController:detailView animated:YES];
}


//长按拖动cell.
- (void) handlePress:(UILongPressGestureRecognizer *)longPress {
    
    static UIView *copyView = nil;
    
    UIGestureRecognizerState state = longPress.state;
    
    //手势位置
    CGPoint location = [longPress locationInView:self.collectionView];
    NSIndexPath *indexPath = [self.collectionView indexPathForItemAtPoint:location];
    
    static NSIndexPath *sourceIndexPath = nil;
    
    switch (state) {
        case UIGestureRecognizerStateBegan: //手势开始
            
            if(indexPath){
                sourceIndexPath = indexPath;
                
                CollectionCell *cell = (CollectionCell *)[self.collectionView cellForItemAtIndexPath:sourceIndexPath];
                copyView = [self customCopyFromView:cell];
                
                __block CGPoint center = cell.center;
                copyView.center = center;
                copyView.alpha = 0;
                [self.collectionView addSubview:copyView];
                //根据手势的位置偏移 copyView
                [UIView animateWithDuration:0.25 animations:^{
                    center = location;
                    copyView.center = center;
                    copyView.alpha = 0.58;
                    cell.alpha = 0;
                } completion:^(BOOL finished) {
                    cell.hidden = YES;
                }];
                
            }
            
            break;
        case UIGestureRecognizerStateChanged:{
            
            //移动的时候根据手势的位置获取copyView的位置
            CGPoint center = location;
            copyView.center = center;
            
            if(indexPath && ![indexPath isEqual:sourceIndexPath]){
                    //moveItemAtIndexPath  (Moves an item from one location to another in the collection view.)
                  [self.collectionView moveItemAtIndexPath:sourceIndexPath toIndexPath:indexPath];
                  sourceIndexPath = indexPath;
            }
            
            break;
        default:{ //结束之后,将copyView移除
            CollectionCell *cell = (CollectionCell *)[self.collectionView cellForItemAtIndexPath:sourceIndexPath];
            cell.hidden = NO;
            cell.alpha = 1.0;
            [copyView removeFromSuperview];

        }
        break;
    }
}
}



- (UIView *)customCopyFromView:(UIView *)inputView {
    
    // 创建一个基于位图的上下文 opaque:NO 透明   scale设为0系统就会自动设置正确的比例
    UIGraphicsBeginImageContextWithOptions(inputView.bounds.size, NO, 0);
    [inputView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIView *copyView = [[UIImageView alloc] initWithImage:image];
    return copyView;
}


- (void) handlePinch:(UIPinchGestureRecognizer *)pinch{
    CGFloat scale = 1.0;
    if (pinch.state == UIGestureRecognizerStateEnded) {
        scale = 1.0;
    }
    
    CGFloat newScale = pinch.scale -scale +1.0;
    
    CGPoint location = [pinch locationInView:self.collectionView];
    NSIndexPath *indexPath = [self.collectionView indexPathForItemAtPoint:location];
    CollectionCell *cell = (CollectionCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
    cell.transform = CGAffineTransformScale(cell.transform, pinch.scale, pinch.scale);
    scale = newScale;
    
}


- (void) handleRotation:(UIRotationGestureRecognizer *)rotationGesture{
    
    CGPoint location = [rotationGesture locationInView:self.collectionView];
    NSIndexPath *indexPath = [self.collectionView indexPathForItemAtPoint:location];
    CollectionCell *cell = (CollectionCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
    cell.transform = CGAffineTransformScale(cell.transform, rotationGesture.rotation, rotationGesture.rotation);

}

//- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
//    
//    return YES;
//    
//}

@end

