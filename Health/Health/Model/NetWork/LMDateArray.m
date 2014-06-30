//
//  LMDateArray.m
//  Aimiandan
//
//  Created by yuntu on 13-12-3.
//  Copyright (c) 2013年 yuntu. All rights reserved.
//

#import "LMDateArray.h"
#import "JSONKit.h"

@implementation LMDateArray
+(NSString *)dataJson:(NSArray *)array
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    for (NSDictionary *dic in array) {
        [params setValue:[[dic allValues] objectAtIndex:0] forKey:[[dic allKeys] objectAtIndex:0]];
    }
    NSString *jsonString = nil;
    if([[params allKeys] count]>0){
        jsonString = [params JSONString];
    }
    return jsonString;
}
@end
