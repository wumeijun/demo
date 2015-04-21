//
//  CellViewTableViewCell.m
//  TableViewCells
//
//  Created by Maggie on 15/3/28.
//  Copyright (c) 2015年 Maggie. All rights reserved.
//
#import "DetaliTableViewCell.h"
#import "DetailView.h"
#define RMarginX 8
#define RMarginY 4

@implementation DetaliTableViewCell

- (void)layoutSubviews{
    [super layoutSubviews];
    CGFloat width1 = self.frame.size.width/3;
    NSLog(@"%f", width1);

}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        CGRect rect = [[UIScreen mainScreen] bounds];
        self.width = rect.size.width/3;
        [self initViews:self.width];
    }
    return self;
}

- (void)initViews:(CGFloat )width{
    
    for (int i = 0; i < 3; i++) {
        DetailView *dv = [[DetailView alloc]init];
        dv.frame = CGRectMake(i*width + RMarginX, RMarginY, width - 2*RMarginX, RCellHeight - 2*RMarginY);
        dv.tag = i +10000;
        [self.contentView addSubview:dv];
    }
    
}


//设置cell的数据
- (void)configCellModel:(NSArray *)DataList{
    for (int i = 0; i<3; i++) {
        DetailView *dv = (DetailView *)[self.contentView viewWithTag: i+10000];
        SubViewMode *data = DataList[i];
        UILabel *label = (UILabel *)[dv viewWithTag:1001];
        label.text = data.title;
        UIImageView *imageView = (UIImageView *)[dv viewWithTag:1000];
        imageView.image = data.image;
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    for (int i = 0; i<3; i++) {
        DetailView *dv = (DetailView *)[self.contentView viewWithTag: i+10000];
        UILabel *label = (UILabel *)[dv viewWithTag:1001];
        label.backgroundColor = [UIColor redColor];
    }
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
    [super setHighlighted:highlighted animated:animated];
    
}



@end
