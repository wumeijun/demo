//
//  ViewController.m
//  Cells
//
//  Created by Maggie on 15/3/24.
//  Copyright (c) 2015年 Maggie. All rights reserved.
//

#import "FirstViewController.h"
#import "AddDataViewController.h"
#import "CellModel.h"

#define kCellIdentifier @"MyIdentifier"


@interface FirstViewController ()

@property (nonatomic, strong) NSArray *images;
@property (nonatomic, strong) NSArray *data;
@end

@implementation FirstViewController

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
    UISearchBar *searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 30)];
    self.tableView.tableHeaderView = searchBar;
    [self.tableView registerClass:[NameAndImageTableViewCell class] forCellReuseIdentifier:kCellIdentifier];
    
    self.data = @[
                  [[CellModel alloc] initWithImage:[UIImage imageNamed:@"apple.png"] title:@"oneqwerqwerqwerqwerqwerqwerqweroneqwerqwerqwerqwerqwerqwerqweroneqwe533443343434343434rqwerqwerqwerqwerqwerqwero"],
                  [[CellModel alloc] initWithImage:[UIImage imageNamed:@"bar.png"] title:@"oneqwerqwerqwerqwerqwerqwerqweroneqwerqwerqwerqwerqwerqwerqweroneqwe533443343434343434rqwerqwerqwerqwerqwerqwero"],
                  [[CellModel alloc] initWithImage:[UIImage imageNamed:@"star.png"] title:@"oneqwerqwerqwerqwerqwerqwerqweroneqwerqwerqwerqwerqwerqwerqweroneqwe533443343434343434rqwerqwerqwerqwerqwerqwero"],
                  [[CellModel alloc] initWithImage:[UIImage imageNamed:@"apple.png"] title:@""]
                  ];
    
    self.viewcell = [[NameAndImageTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//返回表格的总行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return  [self.data count];
}


//绘制一行cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //表示某单元

    NameAndImageTableViewCell *cell = (NameAndImageTableViewCell *)[tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
    NSInteger row = indexPath.row;
    CellModel *model = [self.data objectAtIndex:row];
    [cell configCellModel:model];
    return cell;
}

//设置单元格高度随内容变化
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NameAndImageTableViewCell *cell = (NameAndImageTableViewCell *)[tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
    CellModel *model = self.data[indexPath.row];
    [cell configCellModel:model];
    NSLog(@"%f",model.image.size.height);
    return [cell calCellHeight];
}



// Called after the user changes the selection.
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"" message:@"i diddd" delegate:self cancelButtonTitle:@"quxiao" otherButtonTitles: nil];
//    [alert show];
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    AddDataViewController *addController = [[AddDataViewController alloc]init];
    addController.value = [self.array objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:addController animated:YES];
    
}


@end
