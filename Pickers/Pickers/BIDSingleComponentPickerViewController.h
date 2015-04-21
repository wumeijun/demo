//
//  BIDSingleComponentPickerViewController.h
//  Pickers
//
//  Created by Maggie on 15/3/22.
//  Copyright (c) 2015年 Maggie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BIDSingleComponentPickerViewController : UIViewController<UIPickerViewDataSource,UIPickerViewDelegate>
@property (nonatomic,strong) UIPickerView *pickerView;
@property (nonatomic,strong) NSArray *pickData;
@property (nonatomic,strong) UIButton *btn;
@end
