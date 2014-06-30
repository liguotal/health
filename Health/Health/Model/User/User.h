//
//  User.h
//  Health
//
//  Created by yuntu on 14-3-27.
//  Copyright (c) 2014年 yutu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject
@property (nonatomic,strong) NSString *stringID;
@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSString *sex;
@property (nonatomic,strong) NSString *brithday;
@property (nonatomic,strong) NSString *disease;
@property (nonatomic,strong) NSString *education;
@property (nonatomic,strong) NSString *marriage;
@property (nonatomic,strong) NSString *profession;
@property (nonatomic,strong) NSString *remark;
@property (nonatomic,strong) NSString *phone;
@property (nonatomic,strong) NSString *myTextResult;
@property (nonatomic,strong) NSString *myTextScores;
@property (nonatomic,strong) NSString *lifeTextResult;
@property (nonatomic,strong) NSString *lifeTextScores;
@property (nonatomic,strong) NSString *myResult;
@property (nonatomic,strong) NSString *province;
@property (nonatomic,strong) NSString *city;
@property (nonatomic,strong) NSString *street;
+ (User *)LMData;
@end
