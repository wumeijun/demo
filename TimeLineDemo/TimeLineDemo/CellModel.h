//
//  CellModel.h
//  TimeLineDemo
//
//  Created by Maggie on 15/4/17.
//  Copyright (c) 2015年 Maggie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface CellModel : NSObject

@property (strong, nonatomic) NSString *dateValue;
@property (strong, nonatomic) NSString *body;
@property (strong, nonatomic) NSString *small_url;
@property (strong, nonatomic) NSString *nickName;
@property (strong, nonatomic) NSString *avatar_url;
@property (assign, nonatomic) CGFloat previewWidth;
@property (assign, nonatomic) CGFloat previewHeight;




@end
