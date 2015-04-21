//
//  NameAndImageTableViewCell.m
//  Cells
//
//  Created by Maggie on 15/3/25.
//  Copyright (c) 2015年 Maggie. All rights reserved.
//

#import "NameAndImageTableViewCell.h"
@implementation NameAndImageTableViewCell

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.nameLabel.frame = CGRectMake(0, 0, self.frame.size.width, [self calTextHeight]);
    self.ImageView.frame = CGRectMake(0, CGRectGetMaxY(self.nameLabel.frame), self.frame.size.width, [self calImageHeight]);
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if ( self ) {
        self.nameLabel = [[UILabel alloc]init];
        self.nameLabel.numberOfLines = 0;
        self.nameLabel.font = [UIFont systemFontOfSize:13];
        [self.contentView addSubview:self.nameLabel];
        
        self.ImageView = [[UIImageView alloc]init];
        self.ImageView.contentMode = UIViewContentModeCenter;
        [self.contentView addSubview:self.ImageView];
        
        
    }
    return self;
}





- (void)configCellModel:(CellModel *)model
{
    self.nameLabel.text = model.title;
    self.ImageView.image = model.image;
    [self layoutIfNeeded];
}

-(CGFloat)calTextHeight {
    CGFloat contentWidth = self.frame.size.width;
    NSDictionary *attribute = @{NSFontAttributeName: [UIFont systemFontOfSize:13]};
    CGSize requiredSize = CGSizeZero;
    NSString *content = self.nameLabel.text;
    requiredSize = [content boundingRectWithSize:CGSizeMake(contentWidth, 1000) options:\
                    NSStringDrawingTruncatesLastVisibleLine |
                    NSStringDrawingUsesLineFragmentOrigin |
                    NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
    return requiredSize.height;
}

-(CGFloat)calCellHeight {
    CGFloat cellHeigth = [self calImageHeight] + [self calTextHeight];
    return cellHeigth;
}


-(CGFloat)calImageHeight{
    
    return self.ImageView.image.size.height;
}

@end
