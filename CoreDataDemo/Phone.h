//
//  Phone.h
//  CoreDataDemo
//
//  Created by Maggie on 15/4/13.
//  Copyright (c) 2015年 Maggie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Phone : NSManagedObject

@property (nonatomic, retain) NSString * phoneNum;
@property (nonatomic, retain) NSString * userName;

@end
