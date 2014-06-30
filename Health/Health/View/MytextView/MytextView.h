//
//  MytextView.h
//  Health
//
//  Created by yuntu on 14-4-2.
//  Copyright (c) 2014年 yutu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MytextView : UIView
-(void)showView;
@property (nonatomic, copy) void (^finishedAction)(void);
@property (nonatomic,strong) IBOutlet UITextField *textField;
@end
