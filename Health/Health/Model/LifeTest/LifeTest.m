//
//  LifeTest.m
//  Health
//
//  Created by yuntu on 14-4-1.
//  Copyright (c) 2014年 yutu. All rights reserved.
//

#import "LifeTest.h"

@implementation LifeTest
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
@synthesize personLResult;
@synthesize lifeResult;
static LifeTest *lifttext = nil;

+ (LifeTest *)LMData
{
    //    @synchronized(self){}
    if (!lifttext) {
        lifttext = [[LifeTest alloc] init];
    }
    return lifttext;
}
@end
