//
//  sqLiteKit.m
//  SqlLiteDemo
//
//  Created by Maggie on 15/4/14.
//  Copyright (c) 2015年 Maggie. All rights reserved.
//

#import "SqlDataKit.h"

@implementation SqlDataKit
sqlite3 *db;

//存放路径
- (NSString *)dataFilePath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentPath = [paths objectAtIndex:0];
    NSLog(@"%@",[documentPath stringByAppendingPathComponent:@"data.sqlite"] );
    return [documentPath stringByAppendingPathComponent:@"data.sqlite"];
}

- (BOOL)connectDataBase{
    
    if (sqlite3_open([[self dataFilePath] UTF8String], &db) ==SQLITE_OK ) {
        return YES;
    }else{
        sqlite3_close(db);
        return false;
    }
}

- (void)execSql{
    char *errmsg;
    //打开数据库创建表
    NSString *sqlStr = @"CREATE TABLE IF NOT EXISTS phone (id integer PRIMARY KEY AUTOINCREMENT,name text NOT NULL,phone text NOT NULL)";

    if ([self connectDataBase]) {
       
        if(sqlite3_exec(db, [sqlStr UTF8String], NULL, NULL, &errmsg) == SQLITE_OK){
            NSLog(@"创建成功");
        }else{
            NSLog(@"%s",errmsg);
        }
    }
}


- (void)insertData:(Phone *)phone{
    char *errmsg;

    NSString *sql=[NSString stringWithFormat:@"INSERT INTO phone (name,phone) VALUES ('%@','%@');",phone.userName ,phone.phoneNum];
    
    if ([self connectDataBase]) {
    
        if(sqlite3_exec(db, [sql UTF8String], NULL, NULL, &errmsg) == SQLITE_OK){
            
            NSLog(@"创建成功");
            
        }else{
            
            NSLog(@"%s",errmsg);
        }
    }

}
- (BOOL)updateData:(NSString *)sqlStr{
    char *errmsg;
    if (sqlite3_exec(db, [sqlStr UTF8String], NULL, NULL, &errmsg) == SQLITE_OK) {
        return YES;
    }else {
        return false;
    }

    
}
- (NSMutableArray *)selectData:(NSString *)sqlStr{
    //取数据
    sqlite3_stmt *stmt = NULL;
    NSMutableArray *array = [[NSMutableArray alloc] init];;
    //查询前准备工作
    if (sqlite3_prepare_v2(db, [sqlStr UTF8String], -1, &stmt, NULL) == SQLITE_OK) {
        
        while (sqlite3_step(stmt) == SQLITE_ROW) {
            int idKey = sqlite3_column_int(stmt, 0);
            char *nameRow = (char *)sqlite3_column_text(stmt, 1);
            char *phoneNumRow = (char *)sqlite3_column_text(stmt, 2);
            NSString *name = [[NSString alloc] initWithUTF8String:nameRow];
            NSString *phoneNum = [[NSString alloc] initWithUTF8String:phoneNumRow];
            Phone *phone = [[Phone alloc] initWithPhoneNum:phoneNum userName:name idKey:idKey];
            [array addObject:phone];
        }
    }
    return array;
    
    
}
- (int)deleteData:(NSString *)sqlStr{
    
    char *errmsg;
    if (sqlite3_exec(db, [sqlStr UTF8String], NULL, NULL, &errmsg) == SQLITE_OK) {
        return 1;
    }else {
        return 0;
    }
}



@end
