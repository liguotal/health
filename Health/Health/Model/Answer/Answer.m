//
//  Answer.m
//  Health
//
//  Created by yuntu on 14-4-2.
//  Copyright (c) 2014年 yutu. All rights reserved.
//

#import "Answer.h"

@implementation Answer//给每一个答案赋值或许后面扩展 会用到，此处暂时没用
+(void)myTestAnswer:(NSMutableDictionary *)dict
{
    //NSLog(@"输出字典%@",dict);
    for (int i=0; i<dict.count; i++) {
        NSString *key = [@"Row" stringByAppendingFormat:@"%d",i];
        NSNumber *checked = [dict objectForKey:key];
        int number=[checked intValue];
        NSString *stringAnswer;
        switch (number) {
            case 101:
                stringAnswer=@"A";
                break;
            case 102:
                stringAnswer=@"B";
                break;
            case 103:
                stringAnswer=@"C";
                break;
            case 104:
                stringAnswer=@"D";
                break;
            case 105:
                stringAnswer=@"E";
                break;
            default:
                break;
        }
        [Answer myTestQuestion:i andString:stringAnswer];
    }
}
+(void)myTestQuestion:(int)index andString:(NSString*)string
{
    switch (index) {
        case 0:
            [MyTest LMData].question1=string;
            break;
        case 1:
            [MyTest LMData].question2=string;
            break;
        case 2:
            [MyTest LMData].question3=string;
            break;
        case 3:
            [MyTest LMData].question4=string;
            break;
        case 4:
            [MyTest LMData].question5=string;
            break;
        case 5:
            [MyTest LMData].question6=string;
            break;
        case 6:
            [MyTest LMData].question7=string;
            break;
        case 7:
            [MyTest LMData].question8=string;
            break;
        case 8:
            [MyTest LMData].question9=string;
            break;
        case 9:
            [MyTest LMData].question10=string;
            break;
        case 10:
            [MyTest LMData].question11=string;
            break;
        case 11:
            [MyTest LMData].question12=string;
            break;
        case 12:
            [MyTest LMData].question13=string;
            break;
        case 13:
            [MyTest LMData].question14=string;
            break;
        case 14:
            [MyTest LMData].question15=string;
            break;
        case 15:
            [MyTest LMData].question16=string;
            break;
        case 16:
            [MyTest LMData].question17=string;
            break;
        case 17:
            [MyTest LMData].question18=string;
            break;
        case 18:
            [MyTest LMData].question19=string;
            break;
        case 19:
            [MyTest LMData].question20=string;
            break;
        case 20:
            [MyTest LMData].question21=string;
            break;
        case 21:
            [MyTest LMData].question22=string;
            break;
        case 22:
            [MyTest LMData].question23=string;
            break;
        case 23:
            [MyTest LMData].question24=string;
            break;
        case 24:
            [MyTest LMData].question25=string;
            break;
        case 25:
            [MyTest LMData].question26=string;
            break;
        case 26:
            [MyTest LMData].question27=string;
            break;
        case 27:
            [MyTest LMData].question28=string;
            break;
        case 28:
            [MyTest LMData].question29=string;
            break;
        default:
            break;
    }
}
+(void)lifeTestAnswer:(NSMutableDictionary *)dict
{
    //NSLog(@"输出字典%@",dict);
    for (int i=0; i<dict.count; i++) {
        NSString *key = [@"Row" stringByAppendingFormat:@"%d",i];
        NSNumber *checked = [dict objectForKey:key];
        int number=[checked intValue];
        NSString *stringAnswer;
        switch (number) {
            case 201:
                stringAnswer=@"A";
                break;
            case 202:
                stringAnswer=@"B";
                break;
            case 203:
                stringAnswer=@"C";
                break;
            default:
                break;
        }
        [Answer lifeTestQuestion:i andString:stringAnswer];
    }
}
+(void)lifeTestQuestion:(int)index andString:(NSString *)string
{
    switch (index) {
        case 0:
            [LifeTest LMData].question1=string;
            break;
        case 1:
            [LifeTest LMData].question2=string;
            break;
        case 2:
            [LifeTest LMData].question3=string;
            break;
        case 3:
            [LifeTest LMData].question4=string;
            break;
        case 4:
            [LifeTest LMData].question5=string;
            break;
        case 5:
            [LifeTest LMData].question6=string;
            break;
        case 6:
            [LifeTest LMData].question7=string;
            break;
        case 7:
            [LifeTest LMData].question8=string;
            break;
        case 8:
            [LifeTest LMData].question9=string;
            break;
        case 9:
            [LifeTest LMData].question10=string;
            break;
        case 10:
            [LifeTest LMData].question11=string;
            break;
        case 11:
            [LifeTest LMData].question12=string;
            break;
        case 12:
            [LifeTest LMData].question13=string;
            break;
        case 13:
            [LifeTest LMData].question14=string;
            break;
        case 14:
            [LifeTest LMData].question15=string;
            break;
        case 15:
            [LifeTest LMData].question16=string;
            break;
        case 16:
            [LifeTest LMData].question17=string;
            break;
        case 17:
            [LifeTest LMData].question18=string;
            break;
        case 18:
            [LifeTest LMData].question19=string;
            break;
            
        default:
            break;
    }
}
@end
