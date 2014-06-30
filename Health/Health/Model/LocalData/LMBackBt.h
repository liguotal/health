//
//  LMBackBt.h
//  有礼网
//
//  Created by yuntu on 13-12-10.
//  Copyright (c) 2013年 yuntu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LMBackBt : NSObject

+(UIButton*)LMbackButton;
+(UIButton *)LMHomeButton;
+(UILabel*)LMLable:(NSString*)title andFond:(int)size andColor:(UIColor*)color andXing:(NSString *)xing andFrame:(CGRect)rect;
@end
