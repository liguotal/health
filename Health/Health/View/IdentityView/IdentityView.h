//
//  IdentityView.h
//  Health
//
//  Created by yuntu on 14-3-27.
//  Copyright (c) 2014年 yutu. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface IdentityView : UIView
{
    UILabel *lableTitle;
}

@property (nonatomic, copy) void (^buttonAction)(NSString *string,BOOL);
-(void)initGqView:(UILabel *)lableInit andArray:(NSArray*)choiceArr;
-(void)hideDropDown:(UILabel *)lableHide;
@end
