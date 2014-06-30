//
//  MainHeader.h
//  有礼网
//
//  Created by yuntu on 13-12-9.
//  Copyright (c) 2013年 yuntu. All rights reserved.
//

#ifndef ____MainHeader_h
#define ____MainHeader_h

#define mainscreen [UIScreen mainScreen].bounds
#define mainscreenhight [UIScreen mainScreen].bounds.size.height
#define mainscreenwidth [UIScreen mainScreen].bounds.size.width
#define IS_IOS_7 ([[[UIDevice currentDevice] systemVersion] doubleValue]>=7.0)?YES:NO
#define NavBarHeight ((IS_IOS_7)?65:0)
#define StateBarHeight ((IS_IOS_7)?20:0)
#define ButtonFrame ((IS_IOS_7)?45:65)
#define IPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
//#define API @"http://58.221.58.57:8015/clientserver/"
#define API @"http://jingzhui.yuntubj.com/clientserver/"

#define globalURL(str) [NSString stringWithFormat:@"http://115.29.36.80/userapi.php?%@",str]
#define LM_USER_DEFAULT         [NSUserDefaults standardUserDefaults]
#define IOS7 [[[UIDevice currentDevice] systemVersion]floatValue]>=7
//警告框----两个按钮
#define kYX_ALERT_VIEW(titles,messages,delegates,cancelTitles,otherTitles)              [[UIAlertView alloc] initWithTitle:titles message:messages delegate:delegates cancelButtonTitle:cancelTitles otherButtonTitles:otherTitles, nil];
#define HIGH [[UIScreen mainScreen] currentMode].size
#define kBgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
#import "MyTest.h"
#import "LifeTest.h"
#import "User.h"
#import "Datetime.h"
#import "Answer.h"
#import "SendData.h"
#import "ASIHTTPRequest.h"
#import "PostData.h"
#import "NetWork.h"
#import "SVProgressHUD.h"
#import "ScienceModel.h"
#import "GlobalClass.h"
#import "HistoryModel.h"
#import "LMBackBt.h"
#endif
