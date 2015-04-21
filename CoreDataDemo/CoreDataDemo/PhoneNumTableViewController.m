//
//  PhoneNumTableViewController.m
//  CoreDataDemo
//
//  Created by Maggie on 15/4/10.
//  Copyright (c) 2015年 Maggie. All rights reserved.
//

#import "PhoneNumTableViewController.h"
#define kcell @"kcell"
#import "Phone.h"
#import "AppDelegate.h"
#import "DetailPhoneViewController.h"
@interface PhoneNumTableViewController ()

@end

@implementation PhoneNumTableViewController

-(void)viewDidAppear:(BOOL)animated{
    [self loadData];
    [self.tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"通讯录";

    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addPhoneNum)];
     self.navigationItem.rightBarButtonItem = rightBarButtonItem;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kcell];
//    [self loadData];
    
}


- (void) addPhoneNum{
    AddPhoneNumViewController *addPhoneNumViewController = [[AddPhoneNumViewController alloc] init];
    [self.navigationController pushViewController:addPhoneNumViewController animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the snumber of sections.
    return [self.arrays count];
}

//绘制一行cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //表示某单元
    UITableViewCell *cell = (UITableViewCell *)[self.tableView dequeueReusableCellWithIdentifier:kcell forIndexPath:indexPath];
    Phone *phone = self.arrays[indexPath.row];
    [self configureCell:cell forPhone:phone];
    return cell;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

//滑动删除
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (editingStyle ==UITableViewCellEditingStyleDelete) {//如果编辑样式为删除样式
        if (indexPath.row<[self.arrays count]) {
            NSInteger row = indexPath.row;
            [self deleteData:row];
            [self.arrays removeObjectAtIndex:row];//移除数据源的数据
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationLeft];//移除tableView中的数据
       
        }
    }
}


//查询数据
- (void)loadData{
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    // 初始化一个查询请求
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"Phone"];
    //初始化上下文
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    NSError *error;
    NSArray *objects = [context executeFetchRequest:request error:&error];
    if (nil == objects) {
        NSLog(@"error:%@,%@",error,[error userInfo]);
    }
    self.arrays = [[NSMutableArray alloc] init];

    for (NSManagedObject *object in objects) {

        [self.arrays addObject:object];
    }

    [appDelegate saveContext];
}

//删除数据
- (void)deleteData:(NSInteger)row{
    
    Phone *phone = self.arrays[row];

    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    // 初始化一个查询请求
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"Phone"];
    //初始化上下文
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    
    request.predicate = [NSPredicate predicateWithFormat:@"userName = %@ and phoneNum = %@",phone.userName,phone.phoneNum];
    NSError *error;
    NSArray *objects = [context executeFetchRequest:request error:&error];

    for (NSManagedObject *object in objects) {
        [context deleteObject:object];
    }
    
    BOOL isSave =   [context save:&error];
    if (!isSave) {
        NSLog(@"error:%@,%@",error,[error userInfo]);
    }
    

}

- (void)configureCell:(UITableViewCell *)cell forPhone:(Phone *)phone {
    cell.textLabel.text = phone.userName;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    Phone *phone = self.arrays[indexPath.row];
    DetailPhoneViewController *dvc = [[DetailPhoneViewController alloc] init];
    dvc.userName = phone.userName;
    dvc.phoneNum = phone.phoneNum;
    [self.navigationController pushViewController:dvc animated:YES];
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
