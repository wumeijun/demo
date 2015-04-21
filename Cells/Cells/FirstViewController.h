//
//  ViewController.h
//  Cells
//
//  Created by Maggie on 15/3/24.
//  Copyright (c) 2015年 Maggie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NameAndImageTableViewCell.h"

@interface FirstViewController : UITableViewController<UITableViewDataSource,UITableViewDelegate,UISearchControllerDelegate>

@property (strong,nonatomic) NSArray *array;
@property (nonatomic,strong) UITableViewCell *prototypeCell;
@property (nonatomic,strong) UISearchController *searchController;
@property (nonatomic,strong) NameAndImageTableViewCell *viewcell;

@end

