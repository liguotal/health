//
//  NetWork.h
//  Health
//
//  Created by yuntu on 14-4-3.
//  Copyright (c) 2014年 yutu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetWork : NSObject
+(void)getScienceData:(void (^)(NSDictionary *))completeblock;
+(void)getProductData:(void(^)(NSDictionary *))completeblock;
+(void)sendUserData:(void (^)(NSDictionary *))completeblock;
+(void)getHistoryData:(void (^)(NSDictionary *))completeblock;
+(void)sendMytextResultData:(void (^)(NSDictionary *))completeblock;
+(void)sendLifetextResultData:(void (^)(NSDictionary *))completeblock;
@end
