//
//  HMWeiboCell.h
//
//
//  Created by apple on 13/12/12.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HMWeiboFrame;
@interface HMWeiboCell : UITableViewCell

// 编写一个属性, 用来保存用户传递过来的model
@property (nonatomic, strong) HMWeiboFrame *weiboFrame;
@end
