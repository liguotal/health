//
//  HistoryViewController.h
//  Health
//
//  Created by yuntu on 14-4-1.
//  Copyright (c) 2014年 yutu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HistoryViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    
}
@property (nonatomic,strong) UITableView *historyTalbeView;
@property (nonatomic,strong) NSMutableArray *mutableArray;
@end
