//
//  LifeView.h
//  Health
//
//  Created by yuntu on 14-4-2.
//  Copyright (c) 2014年 yutu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LifeView : UIView
@property (nonatomic, copy) void (^finishedAction)(void);
@end
