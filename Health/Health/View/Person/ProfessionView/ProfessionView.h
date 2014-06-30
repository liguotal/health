//
//  ProfessionView.h
//  Health
//
//  Created by yuntu on 14-4-2.
//  Copyright (c) 2014年 yutu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfessionView : UIView
{
    UILabel *lableTitle;
}

@property (nonatomic, copy) void (^buttonAction)(NSString *string,BOOL);
-(void)initGqView:(UILabel *)lableInit andArray:(NSArray*)choiceArr;
-(void)hideDropDown:(UILabel *)lableHide;
@end
