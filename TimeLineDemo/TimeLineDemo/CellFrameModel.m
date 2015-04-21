//
//  CellFrameModel.m
//  TimeLineDemo
//
//  Created by Maggie on 15/4/17.
//  Copyright (c) 2015年 Maggie. All rights reserved.
//

#import "CellFrameModel.h"
#define TextFont [UIFont systemFontOfSize:16]
#define dateFont [UIFont systemFontOfSize:14]

@implementation CellFrameModel


-(void)configCellFrame{
    CGRect screenBounds = [[UIScreen mainScreen] applicationFrame];

    //头像
    CGFloat padding = 10;
    CGFloat iconX = padding;
    CGFloat iconY = padding;
    CGFloat iconH = 30;
    CGFloat iconW = 30;
    self.iconFrame = CGRectMake(iconX, iconY, iconW, iconH);
    
    //nickName
    CGFloat textLabelX = CGRectGetMaxX(self.iconFrame) + padding;
    CGSize textSize = [self calTextSize:self.cellModel.nickName font:TextFont maxSize:CGSizeMake(300, MAXFLOAT)];
    self.nickNameFrame = CGRectMake(textLabelX, padding, 200, textSize.height);
    
    //创建时间
//    CGSize dateSize = [self calTextSize:[self.cellModel.dateValue substringToIndex:10] font:dateFont maxSize:CGSizeMake(MAXFLOAT, MAXFLOAT)];
    self.dateFrame = CGRectMake(270, padding, 100, textSize.height);

    //动态
    CGFloat infoX = textLabelX;
    CGFloat infoY = iconH;

    CGSize infoSize = [self calTextSize:self.cellModel.body font:TextFont maxSize:CGSizeMake(self.cellWidth - iconW, MAXFLOAT)];
    self.infoFrame = CGRectMake(infoX, infoY, infoSize.width, infoSize.height);
    CGFloat imageX = textLabelX;
    CGFloat imageY = infoSize.height + iconH + padding;

    //配图
    if (self.cellModel.small_url) {
        self.imageFrame = CGRectMake(imageX, imageY, self.cellModel.previewWidth, self.cellModel.previewHeight);
        self.cellheight = imageY + self.cellModel.previewHeight;
    }else {
        self.imageFrame = CGRectMake(imageX, imageY, padding, padding);
        self.cellheight = imageY + padding;
    }
}



- (CGSize)calTextSize:(NSString *)str font:(UIFont *)font maxSize:(CGSize)maxSize
{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.lineBreakMode = NSLineBreakByCharWrapping;
    NSDictionary *dict = @{NSFontAttributeName : font,NSParagraphStyleAttributeName:paragraphStyle.copy};
    
    CGSize size =  [str boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:dict context:nil].size;
    
    return size;
}



@end
