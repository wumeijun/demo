//
//  BINDatePickerViewController.h
//  Pickers
//
//  Created by Maggie on 15/3/22.
//  Copyright (c) 2015年 Maggie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BIDDatePickerViewController : UIViewController
@property (strong , nonatomic) UIDatePicker *datePicker;
@property (strong , nonatomic) UIButton *button;
-(void) buttonPressed;
@end
