//
//  AppDelegate.h
//  Pickers
//
//  Created by Maggie on 15/3/22.
//  Copyright (c) 2015年 Maggie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BIDDatePickerViewController.h"
#import "BIDCustomPickerViewController.h"
#import "BIDDependentComponentPickerViewController.h"
#import "BIDSingleComponentPickerViewController.h"
#import "BIDDoubleComponentPickerViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UITabBarController *rootController;
@property (strong, nonatomic) BIDDatePickerViewController *datePicker;
@property (strong, nonatomic) BIDCustomPickerViewController *customPicker;
@property (strong, nonatomic) BIDDependentComponentPickerViewController *dependentComponentPicker;
@property (strong, nonatomic) BIDSingleComponentPickerViewController *singleComponentPicker;
@property (strong, nonatomic) BIDDoubleComponentPickerViewController *doubleComponentPicker;


@end

