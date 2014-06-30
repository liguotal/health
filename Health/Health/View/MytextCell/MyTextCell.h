//
//  MyTextCell.h
//  Health
//
//  Created by yuntu on 14-4-1.
//  Copyright (c) 2014年 yutu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyTextCell : UITableViewCell
@property (nonatomic, copy) void (^buttonAction)(MyTextCell *cell,NSInteger,UITouch *touch);
-(void)choiceWhitch:(NSNumber*)num;
-(void)sendDictionary:(NSDictionary *)dict;
@property (nonatomic,strong) IBOutlet UILabel *lableTitle;
@property (nonatomic,strong) IBOutlet UILabel *lableOne;
@property (nonatomic,strong) IBOutlet UILabel *lableTwo;
@property (nonatomic,strong) IBOutlet UILabel *lableThree;
@property (nonatomic,strong) IBOutlet UILabel *lableFour;
@property (nonatomic,strong) IBOutlet UILabel *lableFive;
@property (nonatomic,strong) IBOutlet UIButton *buttonOne;
@property (nonatomic,strong) IBOutlet UIButton *buttonTwo;
@property (nonatomic,strong) IBOutlet UIButton *buttonThree;
@property (nonatomic,strong) IBOutlet UIButton *buttonFour;
@property (nonatomic,strong) IBOutlet UIButton *buttonFive;
@end
