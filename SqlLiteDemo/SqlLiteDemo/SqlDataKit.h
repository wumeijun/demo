//
//  sqLiteKit.h
//  SqlLiteDemo
//
//  Created by Maggie on 15/4/14.
//  Copyright (c) 2015年 Maggie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "Phone.h"
@interface SqlDataKit : NSObject

@property (assign, nonatomic) sqlite3 *database;
//- (BOOL)connectDataBase:(sqlite3 *)database;
- (void)execSql;
- (void)insertData:(Phone *)phone;
- (BOOL)updateData:(NSString *)sqlStr;
- (NSMutableArray *)selectData:(NSString *)sqlStr;
- (int)deleteData:(NSString *)sqlStr;

//存放路径
- (NSString *)dataFilePath;
@end
