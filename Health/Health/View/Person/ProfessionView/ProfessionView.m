//
//  ProfessionView.m
//  Health
//
//  Created by yuntu on 14-4-2.
//  Copyright (c) 2014年 yutu. All rights reserved.
//

#import "ProfessionView.h"

@implementation ProfessionView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(void)initGqView:(UILabel *)lableInit andArray:(NSArray*)choiceArr
{
    lableTitle=lableInit;
    self.backgroundColor=[UIColor darkGrayColor];
    CGRect rect=lableInit.frame;
    self.frame=CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, 0);
    self.layer.masksToBounds = NO;
    self.layer.cornerRadius = 8;
    self.layer.shadowOffset = CGSizeMake(-5, 5);
    self.layer.shadowRadius = 5;
    self.layer.shadowOpacity = 0.5;
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    self.frame = CGRectMake(rect.origin.x, rect.origin.y+rect.size.height, rect.size.width,30*choiceArr.count);
    for (int i=0; i<choiceArr.count; i++) {
        UIButton *oneBt=[UIButton buttonWithType:UIButtonTypeCustom];
        NSString *stringTitle=[choiceArr objectAtIndex:i];
        [oneBt setTitle:stringTitle forState:UIControlStateNormal];
        oneBt.frame=CGRectMake(0, i*30, rect.size.width, 30);
        //oneBt setBackgroundImage:<#(UIImage *)#> forState:<#(UIControlState)#>
        //oneBt.backgroundColor=[UIColor redColor];
        [oneBt addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:oneBt];
    }
    [lableInit.superview addSubview:self];
}
-(void)buttonClick:(id)sender
{
    UIButton *bt=(UIButton *)sender;
    if (_buttonAction)
    {
        _buttonAction(bt.titleLabel.text,bt.selected);
    }
    [self hideDropDown:lableTitle];
}
-(void)hideDropDown:(UILabel *)lableHide
{
    CGRect btn = lableHide.frame;
    for (UIView *view in self.subviews) {
        [view removeFromSuperview];
    }
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    self.frame = CGRectMake(btn.origin.x, btn.origin.y+btn.size.height, btn.size.width, 0);
    [UIView commitAnimations];
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
