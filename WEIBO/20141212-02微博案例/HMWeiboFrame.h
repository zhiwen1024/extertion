//
//  HMWeiboFrame.h
//
//
//  Created by apple on 13/12/12.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

@class HMWeibo;
@interface HMWeiboFrame : NSObject

@property (nonatomic, strong) HMWeibo *weibo;
@property (nonatomic, assign, readonly) CGRect iconF;
@property (nonatomic, assign, readonly) CGRect nameF;
@property (nonatomic, assign, readonly) CGRect vipF;
@property (nonatomic, assign, readonly) CGRect textF;
@property (nonatomic, assign, readonly) CGRect pictureF;
@property (nonatomic, assign, readonly) CGFloat cellHeight;

@end
