//
//  MyTextViewController.h
//  Health
//
//  Created by yuntu on 14-4-1.
//  Copyright (c) 2014年 yutu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyTextResultViewController.h"
#import "PersonalViewController.h"
@interface MyTextViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate,RecoverMethod,ResultDelegeta>
{
    NSMutableDictionary *mutableDict;
    NSArray *localData;
    float IoskeyHeight;
}
@property (nonatomic,strong) UITableView *myTextTableView;
@end
