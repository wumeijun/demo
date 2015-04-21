//
//  BIDDoubleComponentPickerViewController.h
//  Pickers
//
//  Created by Maggie on 15/3/22.
//  Copyright (c) 2015年 Maggie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BIDDoubleComponentPickerViewController : UIViewController<UIPickerViewDataSource,UIPickerViewDelegate>
@property (strong,nonatomic) NSDictionary *dict;
@property (strong,nonatomic) NSArray *provinceArray;
@property (strong,nonatomic) NSArray *cityArray;
@property (strong,nonatomic) UIPickerView *doublePickerView;
@end
