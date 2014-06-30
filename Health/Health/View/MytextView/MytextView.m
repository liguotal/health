//
//  MytextView.m
//  Health
//
//  Created by yuntu on 14-4-2.
//  Copyright (c) 2014年 yutu. All rights reserved.
//

#import "MytextView.h"

@implementation MytextView
@synthesize textField;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(void)showView
{
    NSLog(@"输出view");
}
-(IBAction)finishMytextSend:(id)sender
{
    if (_finishedAction)
    {
        _finishedAction();
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
