//
//  ViewController.m
//  TableViewCells
//
//  Created by Maggie on 15/3/28.
//  Copyright (c) 2015年 Maggie. All rights reserved.
//

#import "MainViewController.h"
#import "DetaliTableViewCell.h"
#define kCellIdentifier @"MyIdentifier"

@interface MainViewController ()
@property (nonatomic, strong) NSArray *data;
@property (nonatomic, strong) NSMutableArray *listData;
@end

@implementation MainViewController

- (instancetype)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:UITableViewStyleGrouped];
    if ( self ) {
        //
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[DetaliTableViewCell class] forCellReuseIdentifier:kCellIdentifier];
    
    
    self.data = @[
                  [[SubViewMode alloc] initWithImage:[UIImage imageNamed:@"apple.png"] title:@"oneqwerqwerqwerqwerqwerqwerqweroneqwerqwerqwerqwerqwerqwerqweroneqwe533443343434343434rqwerqwerqwerqwerqwerqwero"],
                  [[SubViewMode alloc] initWithImage:[UIImage imageNamed:@"bar.png"] title:@"oneqwerqwerqwerqwerqwerqwerqweroneqwerqwerqwerqwerqwerqwerqweroneqwe533443343434343434rqwerqwerqwerqwerqwerqwero"],
                  [[SubViewMode alloc] initWithImage:[UIImage imageNamed:@"star.png"] title:@"oneqwerqwerqwerqwerqwerqwerqweroneqwerqwerqwerqwerqwerqwerqweroneqwe533443343434343434rqwerqwerqwerqwerqwerqwero"]
                  ];
    
    self.listData = [NSMutableArray arrayWithCapacity:3];
    for (int i = 0; i<3; i++) {
        SubViewMode *mode = [[SubViewMode alloc]init];
        mode.title = @"ddd";
        mode.image = [UIImage imageNamed:@"star.png"];
        NSLog(@"%@",mode.image);
        [self.listData addObject:mode];
    }
    

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 3;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DetaliTableViewCell *cell = (DetaliTableViewCell *) [tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
    NSInteger row = indexPath.row;
    NSMutableArray *dataList = [NSMutableArray arrayWithCapacity:3];
    for (int i = 0; i < 3; i ++) {
        [dataList addObject:self.listData[row]];
    }
    

    [cell configCellModel:dataList];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return RCellHeight;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
