//
//  HMWeiboCell.m
//
//
//  Created by apple on 13/12/12.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import "HMWeiboCell.h"
#import "HMWeibo.h"
#import "HMWeiboFrame.h"

#define HMNameFont [UIFont systemFontOfSize:13]
#define HMTextFont [UIFont systemFontOfSize:15]

@interface HMWeiboCell ()

@property (nonatomic, weak) UIImageView *imgViewIcon;

@property (nonatomic, weak) UILabel *lblName;

@property (nonatomic, weak) UIImageView *imgViewVip;

@property (nonatomic, weak) UILabel *lblText;

@property (nonatomic, weak) UIImageView *imgViewPicture;

@end


@implementation HMWeiboCell

/************* 重写cell的initWithStyle 方法(在该方法中创建Cell中的所有子控件) *************/
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        // 创建当前cell中的所有子控件
        
        // 头像
        UIImageView *imgViewIcon = [[UIImageView alloc] init];
        [self.contentView addSubview:imgViewIcon];
        self.imgViewIcon = imgViewIcon;
        
        // 昵称
        UILabel *lblName = [[UILabel alloc] init];
        lblName.font = HMNameFont;
        [self.contentView addSubview:lblName];
        self.lblName = lblName;
        
        
        // vip
        UIImageView *imgViewVip = [[UIImageView alloc] init];
        imgViewVip.image = [UIImage imageNamed:@"vip"];
        [self.contentView addSubview:imgViewVip];
        self.imgViewVip = imgViewVip;
        
        // 正文
        UILabel *lblText = [[UILabel alloc] init];
        lblText.font = HMTextFont;
        lblText.numberOfLines = 0;
        [self.contentView addSubview:lblText];
        self.lblText = lblText;
        
        
        // 配图
        UIImageView *imgViewPicture = [[UIImageView alloc] init];
        [self.contentView addSubview:imgViewPicture];
        self.imgViewPicture = imgViewPicture;
        
    }
    return self;
}






/************* 重写cell的weibo属性的set方法 *************/

- (void)setWeiboFrame:(HMWeiboFrame *)weiboFrame
{
    _weiboFrame = weiboFrame;
    
    //1. 通过weibo这个model, 设置cell中子控件的数据
    [self settingData];
    
    // 2. 设置Cell子控件的位置和大小(frame)
    [self settingFrame];
    
}



// 设置控件数据
- (void)settingData
{
    HMWeibo *model = self.weiboFrame.weibo;
    
    // 头像
    self.imgViewIcon.image = [UIImage imageNamed:model.icon];
    
    
    // 昵称
    self.lblName.text = model.name;
    
    // vip
    if (model.vip) {
        self.imgViewVip.hidden = NO;
        self.lblName.textColor = [UIColor redColor];
    } else {
        self.imgViewVip.hidden = YES;
        self.lblName.textColor = [UIColor blackColor];
    }
    
    // 正文
    self.lblText.text = model.text;
    
    
    
    // 配图
    if (model.picture) {
        // 如果有配图, 那么,设置
        // 1. 配图的图片
        self.imgViewPicture.image = [UIImage imageNamed:model.picture];
        // 2. 显示配图的图片框
        self.imgViewPicture.hidden = NO;
    } else {

        self.imgViewPicture.image = nil;
        self.imgViewPicture.hidden = YES;
    }
    
}



// 设置控件位置\尺寸
- (void)settingFrame
{
    // 头像
    self.imgViewIcon.frame = self.weiboFrame.iconF;
    
    
    // 昵称
    
    self.lblName.frame = self.weiboFrame.nameF;
    
    // vip
   
    self.imgViewVip.frame = self.weiboFrame.vipF;
    
    
    
    // 正文
    
    self.lblText.frame = self.weiboFrame.textF;
    
    
    
    // 配图
    self.imgViewPicture.frame = self.weiboFrame.pictureF;
    
    
}








- (void)awakeFromNib {
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
