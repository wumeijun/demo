//
//  MainViewController.m
//  TableSearchDemo
//
//  Created by Maggie on 15/4/7.
//  Copyright (c) 2015年 Maggie. All rights reserved.
//

#import "MainViewController.h"
#import "ResultsViewController.h"
#import "Product.h"
#import "AFNetworking.h"

@interface MainViewController () <UISearchBarDelegate, UISearchControllerDelegate, UISearchResultsUpdating>

@property (nonatomic, strong) UISearchController *searchController;

@property (nonatomic, strong) ResultsViewController *resultsTableController;
@property (nonatomic, strong) NSMutableArray *array;
@property BOOL searchControllerWasActive;
@property BOOL searchControllerSearchFieldWasFirstResponder;
// 加载状态
@property (nonatomic, assign) int page;
@property (nonatomic, assign) int total_pages;
@property (nonatomic, strong) NSString *searchValue;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _resultsTableController = [[ResultsViewController alloc] init];
    _searchController = [[UISearchController alloc] initWithSearchResultsController:self.resultsTableController];
    self.searchController.searchResultsUpdater = self;
    self.tableView.tableHeaderView = self.searchController.searchBar;
    [self.searchController.searchBar sizeToFit];
    self.resultsTableController.tableView.delegate = self;
    self.searchController.delegate = self;
    self.searchController.dimsBackgroundDuringPresentation = NO; // default is YES
    self.searchController.searchBar.delegate = self;
    self.definesPresentationContext = YES;
    self.resultList = [[NSMutableArray alloc] init];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    
    [searchBar resignFirstResponder];
}


//
//- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
//    NSString *searchText = searchController.searchBar.text;
//    self.searchValue = searchText;
//    NSString *urlStr=[NSString stringWithFormat:@"http://food.boohee.com/fb/v1/foods/search"];
//
//    NSDictionary *parameters = @{@"q": searchText};
//    
//    
//    ResultsViewController *tableController = (ResultsViewController *)self.searchController.searchResultsController;
//
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//
//    manager.responseSerializer = [AFJSONResponseSerializer serializer];//使用这个将得到的是JSON
//
//    //发送请求
//    [manager POST:urlStr parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSArray *arry = responseObject[@"foods"];
//        _array = [[NSMutableArray array] init];
//        for (NSDictionary *dict in arry) {
//            Product *product = [[Product alloc] initDic:dict];
//            [_array addObject:product];
//            NSLog(@"%@",_array[0]);
//        }
//       
//        NSLog(@"%lu",(unsigned long)[self.array count]);
//        tableController.filteredProducts = self.array;
//        [tableController.tableView reloadData];
//
//        
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        NSLog(@"Error: %@", error);
//    }];
//
//  
//
//}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.products.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = (UITableViewCell *)[self.tableView dequeueReusableCellWithIdentifier:kCellIdentifier forIndexPath:indexPath];
    
    Product *product = self.products[indexPath.row];
    [self configureCell:cell forProduct:product];
    
    return cell;
}



- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate

{
    
    // 下拉到最底部时显示更多数据
    if(scrollView.contentOffset.y > (scrollView.contentSize.height - scrollView.frame.size.height))
    {
        self.page = self.page + 1;
        if (self.page < self.total_pages + 1 && self.page < 11) {
            
            NSDictionary *parameters = @{@"q": self.searchValue ,@"page" : [NSNumber numberWithInteger:self.page]};
            [self loadData:parameters];

        }
    }
    
    
}


- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    NSString *searchText = searchController.searchBar.text;
    self.searchValue = [searchText stringByReplacingOccurrencesOfString:@" " withString:@""];
    self.page = 1;
    self.total_pages = 1;
    self.array = [[NSMutableArray alloc] init];
    NSDictionary *parameters = @{@"q": searchText ,@"page" : [NSNumber numberWithInteger:self.page]};
    
    
    [self loadData:parameters];
    
    
}



- (void)loadData:(NSDictionary *)parameters

{
    NSString *urlStr=[NSString stringWithFormat:@"http://food.boohee.com/fb/v1/foods/search"];
    
//    NSDictionary *parameters = @{@"q": searchText,@"page" : pageSize};
    
    
    ResultsViewController *tableController = (ResultsViewController *)self.searchController.searchResultsController;
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer = [AFJSONResponseSerializer serializer];//使用这个将得到的是JSON
    
    //发送请求
    [manager POST:urlStr parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        self.page = [responseObject[@"page"] intValue];
        self.total_pages = [responseObject[@"total_pages"] intValue];

        NSArray *arry = responseObject[@"foods"];
//        _array = [[NSMutableArray array] init];
        for (NSDictionary *dict in arry) {
            Product *product = [[Product alloc] initDic:dict];
            [self.array addObject:product];
        }
        
        tableController.filteredProducts = self.array;
        [tableController.tableView reloadData];
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
