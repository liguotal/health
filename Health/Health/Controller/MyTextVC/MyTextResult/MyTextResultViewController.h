//
//  MyTextResultViewController.h
//  Health
//
//  Created by yuntu on 14-4-4.
//  Copyright (c) 2014年 yutu. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol RecoverMethod
-(void)recoverFromFrist;
@end
@interface MyTextResultViewController : UIViewController
{
    int resultNum;
    UIImageView *myReImageView;
    UIImageView *resultImageView;
}
@property (nonatomic, strong) id <RecoverMethod> delegate;
@property (nonatomic,strong) IBOutlet UILabel *lableMyresult;
@property (nonatomic,strong) IBOutlet UILabel *lableResult;
@property (nonatomic,strong) IBOutlet UIButton *backBt;
@property (nonatomic,strong) IBOutlet UIButton *recoverBt;
@property (nonatomic,strong) IBOutlet UIImageView *backGroundImage;
@property (nonatomic,strong) IBOutlet UIImageView *resultImage;
@property (nonatomic,strong) NSMutableDictionary *mutableDict;
@end
