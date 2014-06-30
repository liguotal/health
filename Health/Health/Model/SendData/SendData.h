//
//  SendData.h
//  Health
//
//  Created by yuntu on 14-4-3.
//  Copyright (c) 2014年 yutu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SendData : NSObject
+(int)myTextLocalData:(NSMutableDictionary *)dict;
+(NSString *)myTextSendDataToSenver:(NSMutableDictionary *)dict;
+(int)lifeLocalData:(NSMutableDictionary *)dict;
+(NSString *)lifeSendDataToSenver:(NSMutableDictionary *)dict;
@end
