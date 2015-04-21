//
//  ViewController.m
//  SqlLiteDemo
//
//  Created by Maggie on 15/4/14.
//  Copyright (c) 2015年 Maggie. All rights reserved.
//

#import "MainTableViewController.h"
#import "SqlDataKit.h"
#define kcell @"kcell"
#import "AddPhoneNumViewController.h"
#import "DetailPhoneViewController.h"
@interface MainTableViewController ()

@end

@implementation MainTableViewController
- (void)viewDidAppear:(BOOL)animated{
    [self loadData];
    [self.tableView reloadData];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"通讯录";
    
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addPhoneNum)];
    self.navigationItem.rightBarButtonItem = rightBarButtonItem;

    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kcell];
    self.array = [[NSMutableArray alloc] init];
    
    SqlDataKit *dataKit = [[SqlDataKit alloc] init];
    [dataKit execSql];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.array count];
}

- (void)configureCell:(UITableViewCell *)cell forPhone:(Phone *)phone {
    cell.textLabel.text = phone.userName;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //表示某单元
    UITableViewCell *cell = (UITableViewCell *)[self.tableView dequeueReusableCellWithIdentifier:kcell forIndexPath:indexPath];
    Phone *phone = self.array[indexPath.row];
    [self configureCell:cell forPhone:phone];
    return cell;
}

- (void)addPhoneNum{
    AddPhoneNumViewController *addPhoneNumViewController = [[AddPhoneNumViewController alloc] init];
    [self.navigationController pushViewController:addPhoneNumViewController animated:YES];
}


- (void)loadData{
    SqlDataKit *dataKit = [[SqlDataKit alloc] init];
    NSString *sqlStr = @"select * from phone";
    self.array = [dataKit selectData:sqlStr];
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    Phone *phone = self.array[indexPath.row];
    DetailPhoneViewController *dvc = [[DetailPhoneViewController alloc] init];
    dvc.userName = phone.userName;
    dvc.phoneNum = phone.phoneNum;
    dvc.idKey = phone.idKey;
    [self.navigationController pushViewController:dvc animated:YES];
}



- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

//滑动删除
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (editingStyle ==UITableViewCellEditingStyleDelete) {//如果编辑样式为删除样式
        if (indexPath.row<[self.array count]) {
            NSInteger row = indexPath.row;
            Phone *phone = self.array[row];
            if ([self deleteData:phone.idKey]) {
                [self.array removeObjectAtIndex:row];//移除数据源的数据
                [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationLeft];//移除tableView中的数据
            }
            
        }
    }
}

- (BOOL)deleteData:(int)row{
    SqlDataKit *sqlData = [[SqlDataKit alloc] init];
    NSString *sqlStr = [NSString stringWithFormat:@"delete from phone where id = %d",row];
    int result = [sqlData deleteData:sqlStr];
    if (result == 1) {
        return YES;
    }else{
        return false;
    }
}


@end
