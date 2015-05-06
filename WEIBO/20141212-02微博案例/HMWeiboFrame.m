//
//  HMWeiboFrame.m
//
//
//  Created by apple on 13/12/12.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import "HMWeiboFrame.h"
#import "HMWeibo.h"
#import <UIKit/UIKit.h>
#define HMNameFont [UIFont systemFontOfSize:13]
#define HMTextFont [UIFont systemFontOfSize:15]


@implementation HMWeiboFrame

- (void)setWeibo:(HMWeibo *)weibo
{
    _weibo = weibo;
    
    // 计算位置和尺寸
    // 设置每个控件之间的间距都是 10
    CGFloat margin = 10;
    
    
    // 头像
    CGFloat iconX = margin;
    CGFloat iconY = margin;
    CGFloat iconW = 30;
    CGFloat iconH = 30;
    _iconF = CGRectMake(iconX, iconY, iconW, iconH);
    
    
    // 昵称
    // 1. 获取self.lblName中的文字
    NSString *nickName = weibo.name;
    
    // 2. 根据文字\字体大小\是否限制了最大的宽和高,来计算最终的lable的大小.
    
    NSDictionary *attrs = @{NSFontAttributeName : HMNameFont};
    CGSize nameSize = [nickName boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
    
    CGFloat nameW = nameSize.width;
    CGFloat nameH = nameSize.height;
    CGFloat nameX = CGRectGetMaxX(_iconF) + margin;
    CGFloat nameY = margin + (iconH - nameH) * 0.5;
    _nameF = CGRectMake(nameX, nameY, nameW, nameH);
    
    // vip
    CGFloat vipX = CGRectGetMaxX(_nameF) + margin;
    CGFloat vipY = nameY;
    CGFloat vipW = 15;
    CGFloat vipH = 15;
    _vipF = CGRectMake(vipX, vipY, vipW, vipH);
    
    
    
    
    // 正文
    
    CGSize textSize = [self sizeWithText:weibo.text font:HMTextFont maxSize:CGSizeMake(355, MAXFLOAT)];
    CGFloat textX = iconX;
    CGFloat textY = CGRectGetMaxY(_iconF) + margin;
    CGFloat textW = textSize.width;
    CGFloat textH = textSize.height;
    _textF = CGRectMake(textX, textY, textW, textH);
    
    
    
    
    
    
    // 配图
    CGFloat pictureX = iconX;
    CGFloat pictureY = CGRectGetMaxY(_textF) + margin;
    CGFloat pictureW = 100;
    CGFloat pictureH = 100;
    _pictureF = CGRectMake(pictureX, pictureY, pictureW, pictureH);
    
    
    // 计算单元格的高度
    CGFloat cellHeight = 0;
    if (self.weibo.picture) {
        // 有配图
        cellHeight = CGRectGetMaxY(_pictureF) + margin;
    } else {
        // 没有配图
        cellHeight = CGRectGetMaxY(_textF) + margin;
    }
    _cellHeight = cellHeight;

    
}



// 封装一个根据字符串\字体\最大大小,来计算大小的方法
- (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font maxSize:(CGSize)maxSize
{
    NSDictionary *attrs = @{NSFontAttributeName : font};
    return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}
@end
