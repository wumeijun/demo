//
//  ViewController.h
//  CollectionViewDemo
//
//  Created by Maggie on 15/3/30.
//  Copyright (c) 2015年 Maggie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CollectionCell.h"
@interface MainViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UIGestureRecognizerDelegate>

@property(strong,nonatomic) NSArray *array;

@end

