//
//  LMData.h
//  Aimiandan
//
//  Created by yuntu on 13-11-27.
//  Copyright (c) 2013年 yuntu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LMData : NSObject
+ (id)dataAnalysisDictionary:(NSString *)modelClass andDictionry:(NSDictionary *)dic;


+ (NSMutableArray *)dataAnalysisArray:(NSString *)modelClass andArray:(NSArray *)array;

@end
