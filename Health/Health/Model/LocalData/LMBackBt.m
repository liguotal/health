//
//  LMBackBt.m
//  有礼网
//
//  Created by yuntu on 13-12-10.
//  Copyright (c) 2013年 yuntu. All rights reserved.
//

#import "LMBackBt.h"

@implementation LMBackBt

+(UIButton *)LMbackButton
{
    UIButton* backbutton=[UIButton  buttonWithType:UIButtonTypeCustom];
    backbutton.frame=CGRectMake(-100, 0.0,18, 15);
    [backbutton setImage:[UIImage imageNamed:@"backBt"] forState:UIControlStateNormal];
    return backbutton;
}
+(UIButton *)LMHomeButton
{
    UIButton* backbutton=[UIButton  buttonWithType:UIButtonTypeCustom];
    backbutton.frame=CGRectMake(-100, 0.0,20, 20);
    [backbutton setImage:[UIImage imageNamed:@"homeBt"] forState:UIControlStateNormal];
    return backbutton;
}
+(UILabel*)LMLable:(NSString*)title andFond:(int)size andColor:(UIColor*)color andXing:(NSString *)xing andFrame:(CGRect)rect
{
    UILabel *lable=[[UILabel alloc] initWithFrame:rect];
    lable.backgroundColor=[UIColor clearColor];
    UIFont * myFontCom = [UIFont fontWithName:xing size:size];//Helvetica
    lable.textColor=color;
    lable.text=title;
    [lable setFont:myFontCom];
    return lable;
}

@end
