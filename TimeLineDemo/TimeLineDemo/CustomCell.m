//
//  CustomCell.m
//  TimeLineDemo
//
//  Created by Maggie on 15/4/17.
//  Copyright (c) 2015年 Maggie. All rights reserved.
//

#import "CustomCell.h"
#define TextFont [UIFont systemFontOfSize:16]
#define dateFont [UIFont systemFontOfSize:14]

@implementation CustomCell


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.iconView = [[UIImageView alloc] init];
        [self.contentView addSubview:self.iconView];
        
        self.nickNameLabel = [[UILabel alloc] init];
        self.nickNameLabel.font = TextFont;
        self.nickNameLabel.textColor = [UIColor redColor];
        [self.contentView addSubview:self.nickNameLabel];
        
        self.dateLabel = [[UILabel alloc] init];
        self.dateLabel.textColor = [UIColor grayColor];
        self.dateLabel.font = dateFont;

        [self.contentView addSubview:self.dateLabel];
        
        self.infoLabel = [[UILabel alloc] init];
        self.infoLabel.numberOfLines = 0;
        self.infoLabel.font = TextFont;
        [self.contentView addSubview:self.infoLabel];
        
        self.imageview = [[UIImageView alloc] init];
        [self.contentView addSubview:self.imageview];
        
        self.cellFrame = [[CellFrameModel alloc] init];
    }
    return self;
}


- (void)layoutSubviews{
    
    [super layoutSubviews];
    self.iconView.frame = self.cellFrame.iconFrame;
    self.nickNameLabel.frame = self.cellFrame.nickNameFrame;
    self.dateLabel.frame = self.cellFrame.dateFrame;
    self.infoLabel.frame = self.cellFrame.infoFrame;
    if (self.cellFrame.cellModel.small_url) {
        self.imageview.frame = self.cellFrame.imageFrame;
    }
}

- (void)configCellData
{
    CellModel *cellModel = self.cellFrame.cellModel;
    
    self.iconView.image = [self getImageFromUrl:cellModel.avatar_url];
    self.nickNameLabel.text = cellModel.nickName;
    
    self.dateLabel.text = [cellModel.dateValue substringToIndex:10];
    
    self.infoLabel.text = cellModel.body;
    if (cellModel.small_url) {
        self.imageview.image = [self getImageFromUrl:cellModel.small_url];
    }
    [self layoutIfNeeded];

}

- (UIImage *)getImageFromUrl:(NSString *)url{
    
    UIImage *result;
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
    result = [UIImage imageWithData:data];
    return result;
    
}

- (void)configCell:(CellFrameModel *)cellFrame{
    self.cellFrame = cellFrame;
    self.cellFrame.cellModel = cellFrame.cellModel;
    [self configCellData];
}




@end
