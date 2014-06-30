//
//  MyTextCell.m
//  Health
//
//  Created by yuntu on 14-4-1.
//  Copyright (c) 2014年 yutu. All rights reserved.
//

#import "MyTextCell.h"

@implementation MyTextCell
@synthesize lableTitle;
@synthesize lableOne;
@synthesize lableTwo;
@synthesize lableThree;
@synthesize lableFour;
@synthesize lableFive;
@synthesize buttonOne;
@synthesize buttonTwo;
@synthesize buttonThree;
@synthesize buttonFour;
@synthesize buttonFive;

- (void)awakeFromNib
{
    // Initialization code
}
-(IBAction)buttonSelectWhitch:(id)sender event:(id)event
{
    buttonFive.selected=NO;
    buttonFour.selected=NO;
    buttonThree.selected=NO;
    buttonTwo.selected=NO;
    buttonOne.selected=NO;
    UIButton *btn = (UIButton *)sender;
    btn.selected = YES;
    NSSet *touches = [event allTouches];
    UITouch *touch = [touches anyObject];
    MyTextCell *cellt=(MyTextCell *)[[btn superview] superview];
    if (_buttonAction)
    {
        _buttonAction(cellt,btn.tag,touch);
    }
}
-(void)choiceWhitch:(NSNumber*)num
{
    int number=[num intValue];
    switch (number) {
        case 101:
            buttonOne.selected=YES;
            break;
        case 102:
            buttonTwo.selected=YES;
            break;
        case 103:
            buttonThree.selected=YES;
            break;
        case 104:
            buttonFour.selected=YES;
            break;
        case 105:
            buttonFive.selected=YES;
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
    self.lableFour.text=[array objectAtIndex:3];
    self.lableFive.text=[array objectAtIndex:4];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
