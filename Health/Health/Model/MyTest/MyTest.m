//
//  MyTest.m
//  Health
//
//  Created by yuntu on 14-4-1.
//  Copyright (c) 2014年 yutu. All rights reserved.
//

#import "MyTest.h"

@implementation MyTest
@synthesize question1;
@synthesize question2;
@synthesize question3;
@synthesize question4;
@synthesize question5;
@synthesize question6;
@synthesize question7;
@synthesize question8;
@synthesize question9;
@synthesize question10;
@synthesize question11;
@synthesize question12;
@synthesize question13;
@synthesize question14;
@synthesize question15;
@synthesize question16;
@synthesize question17;
@synthesize question18;
@synthesize question19;
@synthesize question20;
@synthesize question21;
@synthesize question22;
@synthesize question23;
@synthesize question24;
@synthesize question25;
@synthesize question26;
@synthesize question27;
@synthesize question28;
@synthesize question29;
@synthesize personMResult;
@synthesize myResult;
static MyTest *mytext = nil;

+ (MyTest *)LMData
{
    //    @synchronized(self){}
    if (!mytext) {
        mytext = [[MyTest alloc] init];
    }
    return mytext;
}

@end
