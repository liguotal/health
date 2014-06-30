//
//  LifeTestViewController.h
//  Health
//
//  Created by yuntu on 14-4-2.
//  Copyright (c) 2014年 yutu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LifeResultViewController.h"
#import "PersonalViewController.h"
@interface LifeTestViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,RecoverLifeMethod,ResultDelegeta>
{
    NSMutableDictionary *mutableDict;
    NSArray *localLifeData;
    
}

@property (nonatomic,strong) UITableView *lifeTableView;

@end
