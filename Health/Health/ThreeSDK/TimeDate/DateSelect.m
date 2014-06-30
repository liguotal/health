//
//  DateSelect.m
//  MemorialDay
//
//  Created by 郝 建军 on 13-11-8.
//  Copyright (c) 2013年 郝 建军. All rights reserved.
//

#import "DateSelect.h"
#import "IDJTimePickerView.h"
#import "IDJCalendarUtil.h"
#import "AppDelegate.h"

@implementation DateSelect
@synthesize gregorianBar;
@synthesize lunarBar;
@synthesize djdateGregorianView;
@synthesize djdateChineseView;
@synthesize year;
@synthesize month;
@synthesize day;
@synthesize delegate;
@synthesize calendarType;
@synthesize lunarStr;
@synthesize lunarArr;
@synthesize isSelect;

- (void)dealloc
{
    
    [gregorianBar release];
    gregorianBar = nil;
    [lunarBar release];
    lunarBar = nil;
    [djdateGregorianView release];
    djdateGregorianView = nil;
    [djdateChineseView release];
    djdateChineseView = nil;
    [lunarStr release];
    [lunarArr release];
    [super dealloc];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


- (void)awakeFromNib{
    //AppDelegate * mainDelegate = (MainAppDelegate *)[[UIApplication sharedApplication] delegate];
    //[MoreUse showMBProgressHUD:@"正在加载日历..." andWhereView:mainDelegate.window];
    
    self.year = [[Datetime GetYear] intValue];
    self.month = [[Datetime GetMonth] intValue];
    self.day = [Datetime GetDay].integerValue;
    calendarType = 1;
    [self addGregorianClalendar];
    
    [self performSelector:@selector(hiddlenProgress) withObject:nil afterDelay:2.0];
    
}


- (void)hiddlenProgress
{
    //MainAppDelegate * mainDelegate = (MainAppDelegate *)[[UIApplication sharedApplication] delegate];
    //[MoreUse hideMBprogressHUD:mainDelegate.window];
}


- (IBAction)done:(id)sender{
    if (!isSelect) {
        
        if (self.year >[[Datetime GetYear] intValue]) {
            [GlobalClass textNoSpace:@"请选择正确的日期!"];
            return;
            
        }else if(self.year ==[[Datetime GetYear] intValue]&&self.month >[[Datetime GetMonth] intValue]){
            
            [GlobalClass textNoSpace:@"请选择正确的日期!"];
            return;
        }else if(self.year ==[[Datetime GetYear] intValue]&&self.month ==[[Datetime GetMonth] intValue]&&self.day > [Datetime GetDay].integerValue){
           
            [GlobalClass textNoSpace:@"请选择正确的日期!"];
            return;
        }
    }
    
    if (delegate) {
       
        if (calendarType==2) {
            if (lunarArr) {
                
                
                [delegate passlunarStrWithStr:self.lunarArr];
            }
            else{
                
//                [GlobalClass textNoSpace:@"请选择正确的日期!"];
//                return;
            }
            
        }
        NSString * dateStr = [NSString stringWithFormat:@"%d-%02d-%02d",year,month,day];
        [delegate updataNewDate:dateStr andType:calendarType];
    }
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    self.frame = CGRectMake(0, HIGH.height/2-20, 320, 261);
    [UIView commitAnimations];
    
    [self performSelector:@selector(removePicker:) withObject:self afterDelay:0.5];
}

- (void)removePicker:(UIView *)tempView{
    
    [tempView removeFromSuperview];
}

//接收日期选择器选项变化的通知
- (void)notifyNewCalendar:(IDJCalendar *)cal {
    if ([cal isMemberOfClass:[IDJCalendar class]]) {
        
        year = cal.year.integerValue;
        month = cal.month.integerValue;
        day = cal.day.integerValue;
        self.calendarType = 1;
        
        NSLog(@"%@:era=%@, year=%@, month=%@, day=%@, weekday=%@", cal, cal.era, cal.year, cal.month, cal.day, cal.weekday);
    } else if ([cal isMemberOfClass:[IDJChineseCalendar class]]) {
        IDJChineseCalendar *_cal=(IDJChineseCalendar *)cal;
        NSLog(@"%@:era=%@, year=%@, month=%@, day=%@, weekday=%@, animal=%@", cal, cal.era, cal.year, cal.month, cal.day, cal.weekday, _cal.animal);
        
        self.lunarArr = [NSMutableArray arrayWithObjects:cal.year,cal.month,cal.day, nil];
        
        
       NSDateComponents * date = [IDJCalendarUtil toSolarDateWithYear:cal.year.integerValue
                                                               month:cal.month
                                                                 day:cal.day.integerValue];
        year = [date year];
        month = [date month];
        day = [date day];
        self.calendarType = 2;
    }
}


- (void)addGregorianClalendar{//添加公历
    
    
    if (djdateGregorianView) {
        
        djdateGregorianView.hidden = NO;
        djdateChineseView.hidden = YES;
    }else{
        IDJDatePickerView * tempView=[[IDJDatePickerView alloc]initWithFrame:CGRectMake(0, 51, 320, 200) type:Gregorian1];
        self.djdateGregorianView = tempView;
        [self addSubview:djdateGregorianView];
        djdateGregorianView.delegate=self;
        [tempView release];
    }
    
}

- (void)addLunarClalendar{//添加农历
    if (djdateChineseView) {
        
        djdateGregorianView.hidden = YES;
        djdateChineseView.hidden = NO;
    }else{
        IDJDatePickerView * tempView=[[IDJDatePickerView alloc]initWithFrame:CGRectMake(0, 51, 320, 200) type:Chinese1];
        self.djdateChineseView = tempView;
        [self addSubview:djdateChineseView];
        djdateChineseView.delegate=self;
        [tempView release];
    }
}

- (IBAction)changeCalendarPicker:(UIButton *)sender{
    
    gregorianBar.selected = NO;
    lunarBar.selected = NO;
    sender.selected = YES;
    if (gregorianBar.selected) {
        calendarType = 1;
        [self addGregorianClalendar];
    }else if (lunarBar.selected){
        calendarType = 2;
        [self addLunarClalendar];
    }
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
