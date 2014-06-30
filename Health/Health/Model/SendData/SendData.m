//
//  SendData.m
//  Health
//
//  Created by yuntu on 14-4-3.
//  Copyright (c) 2014年 yutu. All rights reserved.
//

#import "SendData.h"

@implementation SendData
+(int)myTextLocalData:(NSMutableDictionary *)dict
{
    int numberAll = 0;
    int numberThis=0;
    for (int i=0; i<28; i++) {
        NSString *key = [@"Row" stringByAppendingFormat:@"%d",i];
        NSNumber *checked = [dict objectForKey:key];
        if (checked!=nil) {
            int number=[checked intValue];
            switch (number) {
                case 101:
                    numberThis=1;
                    break;
                case 102:
                    numberThis=2;
                    break;
                case 103:
                    numberThis=3;
                    break;
                case 104:
                    numberThis=4;
                    break;
                case 105:
                    numberThis=5;
                    break;
                default:
                    break;
            }
            numberAll=numberAll+numberThis;
        }
    }
    NSLog(@"输出传给服务器的内容%d",numberAll);
    return numberAll;
}
+(NSString *)myTextSendDataToSenver:(NSMutableDictionary *)dict
{
    NSString *string=@"";
    for (int i=0; i<28; i++) {
        NSString *stringResult;
        NSString *key = [@"Row" stringByAppendingFormat:@"%d",i];
        NSNumber *checked = [dict objectForKey:key];
        if (checked!=nil) {
            int number=[checked intValue];
            switch (number) {
                case 101:
                    //stringResult=[NSString stringWithFormat:@"%dA",i+1];
                    stringResult=@"A|";
                    break;
                case 102:
                    stringResult=@"B|";
                    break;
                case 103:
                    stringResult=@"C|";
                    break;
                case 104:
                    stringResult=@"D|";
                    break;
                case 105:
                    stringResult=@"E|";
                    break;
                default:
                    break;
            }
        }else
        {
            stringResult=@"0|";
        }
        string=[string stringByAppendingString: stringResult];
    }
    NSLog(@"输出传给服务器的内容%@",string);
    return string;
}
+(int)lifeLocalData:(NSMutableDictionary *)dict
{
    int numberAll = 0;
    int numberThis=0;
    for (int i=0; i<20; i++) {
        NSString *key = [@"Row" stringByAppendingFormat:@"%d",i];
        NSNumber *checked = [dict objectForKey:key];
        if (checked!=nil) {
            int number=[checked intValue];
            switch (number) {
                case 201:
                    numberThis=0;
                    break;
                case 202:
                    numberThis=3;
                    break;
                case 203:
                    numberThis=5;
                    break;
                default:
                    break;
            }
            numberAll=numberAll+numberThis;
        }
    }
    NSLog(@"输出传给服务器的内容%d",numberAll);
    return numberAll;
}
+(NSString *)lifeSendDataToSenver:(NSMutableDictionary *)dict
{
    NSString *string=@"";
    for (int i=0; i<20; i++) {
        NSString *stringResult;
        NSString *key = [@"Row" stringByAppendingFormat:@"%d",i];
        NSNumber *checked = [dict objectForKey:key];
        if (checked!=nil) {
            int number=[checked intValue];
            switch (number) {
                case 201:
                    //stringResult=[NSString stringWithFormat:@"%dA",i+1];
                    stringResult=@"A|";
                    break;
                case 202:
                    stringResult=@"B|";
                    break;
                case 203:
                    stringResult=@"C|";
                    break;
                default:
                    break;
            }
        }else
        {
            stringResult=@"0|";
        }
        string=[string stringByAppendingString: stringResult];
    }
    NSLog(@"输出传给服务器的内容111111%@",string);
    return string;
}
@end
