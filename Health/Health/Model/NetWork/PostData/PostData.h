//
//  PostData.h
//  Health
//
//  Created by yuntu on 14-4-3.
//  Copyright (c) 2014年 yutu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PostData : NSObject
+(NSArray *)sendUserData;
+(NSArray *)getHistoryData;
+(NSArray*)productDataAndType:(NSString*)type;
+(NSArray *)resuleMyDataAndType:(NSString *)type;
+(NSArray *)resuleLifeDataAndType:(NSString *)type;
@end
