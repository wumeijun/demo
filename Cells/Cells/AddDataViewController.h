//
//  AddDataViewController.h
//  Cells
//
//  Created by Maggie on 15/3/24.
//  Copyright (c) 2015年 Maggie. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol AddValueDelegate <NSObject>
- (void) addValue:(NSString *)val;;
@end
@interface AddDataViewController : UIViewController<UITextFieldDelegate>
@property (strong , nonatomic) UILabel *label;
@property (strong , nonatomic) NSString *value;
@property (strong , nonatomic) UITextField *text1;
@property (strong , nonatomic) UIButton *btn;


@end
