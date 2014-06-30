//
//  DateSelect.h
//  MemorialDay
//
//  Created by 郝 建军 on 13-11-8.
//  Copyright (c) 2013年 郝 建军. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IDJDatePickerView.h"
@protocol dateSelectDelegate

@optional
- (void)updataNewDate:(NSString *)str andType:(NSInteger)type;//公历
- (void)passlunarStrWithStr:(NSMutableArray *)arr;//农历
@end
@interface DateSelect : UIView <IDJDatePickerViewDelegate>

@property (nonatomic, retain) IBOutlet UIButton * gregorianBar;
@property (nonatomic, retain) IBOutlet UIButton * lunarBar;
@property (nonatomic, retain) IDJDatePickerView *djdateGregorianView;//公历选择器
@property (nonatomic, retain) IDJDatePickerView *djdateChineseView;//农历选择器

@property (nonatomic, assign) NSInteger calendarType;

@property (nonatomic, assign) NSInteger year;
@property (nonatomic, assign) NSInteger month;
@property (nonatomic, assign) NSInteger day;

@property (nonatomic, retain) NSString * lunarStr;
@property (nonatomic, retain) NSMutableArray * lunarArr;

@property (nonatomic, assign) id <dateSelectDelegate> delegate;

@property (nonatomic, assign) BOOL isSelect;

- (IBAction)changeCalendarPicker:(id)sender;
- (IBAction)done:(id)sender;//确定
@end
