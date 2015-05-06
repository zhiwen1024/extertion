//
//  HMWeibo.m
//
//
//  Created by apple on 13/12/12.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import "HMWeibo.h"

@implementation HMWeibo

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)weiboWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}
@end
