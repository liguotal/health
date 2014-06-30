//
//  PostData.m
//  Health
//
//  Created by yuntu on 14-4-3.
//  Copyright (c) 2014年 yutu. All rights reserved.
//

#import "PostData.h"

@implementation PostData
+(NSArray *)sendUserData
{
    NSArray *array=[NSArray arrayWithObjects:[NSDictionary dictionaryWithObject:[User LMData].sex forKey:@"gender"],[NSDictionary dictionaryWithObject:[User LMData].brithday forKey:@"birthday"],[NSDictionary dictionaryWithObject:[User LMData].marriage forKey:@"marriagestate"],[NSDictionary dictionaryWithObject:[User LMData].disease forKey:@"isdisease"],[NSDictionary dictionaryWithObject:[User LMData].remark forKey:@"remark"],[NSDictionary dictionaryWithObject:[User LMData].phone forKey:@"phone"],[NSDictionary dictionaryWithObject:[User LMData].profession forKey:@"occupation"],[NSDictionary dictionaryWithObject:[User LMData].education forKey:@"education"],[NSDictionary dictionaryWithObject:[User LMData].province forKey:@"province"],[NSDictionary dictionaryWithObject:[User LMData].city forKey:@"city"],[NSDictionary dictionaryWithObject:[User LMData].street forKey:@"street"],nil];
    return array;
}
+(NSArray *)getHistoryData
{
    NSArray *array=[NSArray arrayWithObjects:[NSDictionary dictionaryWithObject:[User LMData].phone forKey:@"phone"],nil];
    return array;
}
+(NSArray*)productDataAndType:(NSString*)type
{
    //[DataAll LMDataAll].testcode
    NSArray *array=[NSArray arrayWithObjects:[NSDictionary dictionaryWithObject:type forKey:@"type"],nil];
    return array;
}
+(NSArray *)resuleMyDataAndType:(NSString *)type
{
    NSArray *array=[NSArray arrayWithObjects:[NSDictionary dictionaryWithObject:type forKey:@"testtype"],[NSDictionary dictionaryWithObject:[User LMData].phone forKey:@"phone"],[NSDictionary dictionaryWithObject:[User LMData].stringID forKey:@"userid"],[NSDictionary dictionaryWithObject:[User LMData].myTextResult forKey:@"testresult"],[NSDictionary dictionaryWithObject:[User LMData].myTextScores forKey:@"testscores"],nil];
    return array;
}
+(NSArray *)resuleLifeDataAndType:(NSString *)type
{
    NSArray *array=[NSArray arrayWithObjects:[NSDictionary dictionaryWithObject:type forKey:@"testtype"],[NSDictionary dictionaryWithObject:[User LMData].phone forKey:@"phone"],[NSDictionary dictionaryWithObject:[User LMData].stringID forKey:@"userid"],[NSDictionary dictionaryWithObject:[User LMData].lifeTextResult forKey:@"testresult"],[NSDictionary dictionaryWithObject:[User LMData].lifeTextScores forKey:@"testscores"],[NSDictionary dictionaryWithObject:[User LMData].myResult forKey:@"testselfscores"],nil];
    return array;
}
@end
