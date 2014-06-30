//
//  User.m
//  Health
//
//  Created by yuntu on 14-3-27.
//  Copyright (c) 2014年 yutu. All rights reserved.
//

#import "User.h"

@implementation User
@synthesize stringID;
@synthesize name;
@synthesize sex;
@synthesize brithday;
@synthesize disease;
@synthesize education;
@synthesize marriage;
@synthesize profession;
@synthesize remark;
@synthesize phone;
@synthesize myTextResult;
@synthesize myTextScores;
@synthesize lifeTextResult;
@synthesize lifeTextScores;
@synthesize myResult;
@synthesize province;
@synthesize city;
@synthesize street;
static User *user = nil;

+ (User *)LMData
{
    //    @synchronized(self){}
    if (!user) {
        user = [[User alloc] init];
    }
    return user;
}
@end
