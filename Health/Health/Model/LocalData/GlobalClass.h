//
//  GlobalClass.h
//  有礼网
//
//  Created by yuntu on 13-12-16.
//  Copyright (c) 2013年 yuntu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GlobalClass : NSObject
+ (void)textNoSpace:(NSString *)string;
//得到用户信息
+ (void)getUserData;
//存储用户信息
+ (void)storeUserData;
+(NSString *)LunarForSolar:(NSDate *)solarDate;
@end
