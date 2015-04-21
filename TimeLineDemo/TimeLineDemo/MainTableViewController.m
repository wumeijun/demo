//
//  MainTableViewController.m
//  TimeLineDemo
//
//  Created by Maggie on 15/4/17.
//  Copyright (c) 2015年 Maggie. All rights reserved.
//

#import "MainTableViewController.h"
#import "AFNetworking.h"
#import "CellModel.h"
#import "Photos.h"
#import "UserInfoModel.h"
#define kcell @"kcell"
#define kTimeLineURL @"http://one.boohee.com/api/v1/home_timeline.json?status_api_version=1.1&app_version=5.9.5&os_version=8.3&limit=20&token=6WEpbxwYnyENUM8f8CYz&app_device=iOS&app_name=ONE"
@interface MainTableViewController ()

@end

@implementation MainTableViewController

           
- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    [self.tableView registerClass:[CustomCell class] forCellReuseIdentifier:kcell];
    self.viewcell = [[CustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomCell *cell = (CustomCell *)[tableView dequeueReusableCellWithIdentifier:kcell forIndexPath:indexPath];
    CellFrameModel *cellFrame = self.dataArray[indexPath.row];
    [cell configCell:cellFrame];    
    return cell;
}


- (void)loadData{
    
//    NSString *url = [NSString stringWithFormat:kTimeLineURL];
    if (self.dataArray == nil) {
        
   

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];//使用这个将得到的是JSON
    NSMutableArray *arrys = [[NSMutableArray alloc] init];

    //发送请求
    [manager GET:kTimeLineURL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {

        NSArray *postArray = responseObject[@"posts"];
        for (NSDictionary *dic in postArray) {
            
            CellModel *cellModel = [[CellModel alloc] init];
            
            cellModel.dateValue = dic[@"created_at"];
            cellModel.body = dic[@"body"];
            
            NSArray *photosArray = dic[@"photos"];
            for(NSDictionary *potoDic in photosArray){
                cellModel.small_url = potoDic[@"small_url"];
                cellModel.previewHeight = [potoDic[@"preview_height"] floatValue];
                cellModel.previewWidth = [potoDic[@"preview_width"] floatValue];

            }
            
            
            NSDictionary *userDict = dic[@"user"];
            if(![userDict isEqual:@""]){
                cellModel.nickName = userDict[@"nickname"];
                cellModel.avatar_url = userDict[@"avatar_url"];
            }
         
            
            CellFrameModel *cellFrame = [[CellFrameModel alloc] init];
            cellFrame.cellModel = cellModel;
            cellFrame.cellWidth = self.tableView.frame.size.width;
            [cellFrame configCellFrame];
            [arrys addObject:cellFrame];
        }
        self.dataArray = arrys;
        [self.tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
     }

}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CellFrameModel *cellFrame = self.dataArray[indexPath.row];
    return cellFrame.cellheight;
}



@end
