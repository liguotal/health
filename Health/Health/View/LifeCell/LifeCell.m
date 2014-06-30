//
//  LifeCell.m
//  Health
//
//  Created by yuntu on 14-4-1.
//  Copyright (c) 2014年 yutu. All rights reserved.
//

#import "LifeCell.h"

@implementation LifeCell
@synthesize lableTitle;
@synthesize lableOne;
@synthesize lableTwo;
@synthesize lableThree;
@synthesize buttonOne;
@synthesize buttonTwo;
@synthesize buttonThree;

- (void)awakeFromNib
{
    // Initialization code
}
-(IBAction)buttonSelectWhitch:(id)sender event:(id)event
{
    buttonThree.selected=NO;
    buttonTwo.selected=NO;
    buttonOne.selected=NO;
    UIButton *btn = (UIButton *)sender;
    btn.selected = YES;
    NSSet *touches = [event allTouches];
    UITouch *touch = [touches anyObject];
    LifeCell *cellt=(LifeCell *)[[btn superview] superview];
    if (_buttonAction)
    {
        _buttonAction(cellt,btn.tag,touch);
    }
}
-(void)choiceWhitch:(NSNumber*)num
{
    int number=[num intValue];
    switch (number) {
        case 201:
            buttonOne.selected=YES;
            break;
        case 202:
            buttonTwo.selected=YES;
            break;
        case 203:
            buttonThree.selected=YES;
            break;
        default:
            break;
    }
}
-(void)sendDictionary:(NSDictionary *)dict
{
    //NSLog(@"输出字典%@",dict);
    NSString *titleStr=[dict objectForKey:@"Title"];
    self.lableTitle.text=titleStr;
    NSArray *array=[dict objectForKey:@"Answer"];
    self.lableOne.text=[array objectAtIndex:0];
    self.lableTwo.text=[array objectAtIndex:1];
    self.lableThree.text=[array objectAtIndex:2];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
