//
//  HMWeibo.h
//
//
//  Created by apple on 13/12/12.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HMWeibo : NSObject

// 昵称
@property (nonatomic, copy) NSString *name;


// 头像
@property (nonatomic, copy) NSString *icon;

// 正文
@property (nonatomic, copy) NSString *text;

// 配图
@property (nonatomic, copy) NSString *picture;

// 否是vip
@property (nonatomic, assign) BOOL vip;



- (instancetype)initWithDict:(NSDictionary *)dict;

+ (instancetype)weiboWithDict:(NSDictionary *)dict;

@end
