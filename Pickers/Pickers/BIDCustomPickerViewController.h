//
//  BIDCustomPickerViewController.h
//  Pickers
//
//  Created by Maggie on 15/3/22.
//  Copyright (c) 2015年 Maggie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BIDCustomPickerViewController : UIViewController<UIPickerViewDataSource,UIPickerViewDelegate>
@property (strong,nonatomic) UIPickerView *customPickerView;
@property (strong,nonatomic) NSArray *imagesArray;
@property (strong,nonatomic) UILabel *label;
@property (strong,nonatomic) UIButton *button;
@end
