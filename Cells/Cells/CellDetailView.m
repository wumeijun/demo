//
//  CellDetailView.m
//  Cells
//
//  Created by Maggie on 15/3/27.
//  Copyright (c) 2015年 Maggie. All rights reserved.
//

#import "CellDetailView.h"

@implementation CellDetailView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)layoutSubviews
{
    [super layoutSubviews];
    
//    self.nameLabel.frame = CGRectMake(0, 0, self.frame.size.width/3, [self calTextHeight]);
//    self.imageView.frame = CGRectMake(0, CGRectGetMaxY(self.nameLabel.frame), self.frame.size.width/3, [self calImageHeight]);
}

-(id) initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    if (self) {
        self.nameLabel = [[UILabel alloc]init];
        self.nameLabel.numberOfLines = 0;
        self.nameLabel.font = [UIFont systemFontOfSize:13];
        [self addSubview:self.nameLabel];
        self.imageView = [[UIImageView alloc]init];
        self.imageView.contentMode = UIViewContentModeCenter;
        [self addSubview:self.imageView];
    }
    return self;
}

- (void)configModel:(CellModel *)model
{
    self.nameLabel.text = model.title;
    self.imageView.image = model.image;
    [self layoutIfNeeded];
}



-(CGFloat)calTextHeight:(CGFloat *)height {
    CGFloat contentWidth = *height;
    NSDictionary *attribute = @{NSFontAttributeName: [UIFont systemFontOfSize:13]};
    CGSize requiredSize = CGSizeZero;
    NSString *content = self.nameLabel.text;
    NSLog(@"%@",self.nameLabel.text);

    requiredSize = [content boundingRectWithSize:CGSizeMake(contentWidth, 1000) options:\
                    NSStringDrawingTruncatesLastVisibleLine |
                    NSStringDrawingUsesLineFragmentOrigin |
                    NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
    NSLog(@"%f",requiredSize.height);
    return requiredSize.height;
}

-(CGFloat)calDetailViewHeight:(CGFloat *)height {
    return [self calTextHeight:height] + [self calImageHeight] ;
}


-(CGFloat)calImageHeight{
    return self.imageView.image.size.height;
}


@end
