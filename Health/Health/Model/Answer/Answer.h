//
//  Answer.h
//  Health
//
//  Created by yuntu on 14-4-2.
//  Copyright (c) 2014年 yutu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Answer : NSObject
+(void)myTestAnswer:(NSMutableDictionary *)dict;
+(void)myTestQuestion:(int)index andString:(NSString*)string;
+(void)lifeTestAnswer:(NSMutableDictionary *)dict;
+(void)lifeTestQuestion:(int)index andString:(NSString *)string;
@end
