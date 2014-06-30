//
//  LifeResultViewController.h
//  Health
//
//  Created by yuntu on 14-4-4.
//  Copyright (c) 2014年 yutu. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol RecoverLifeMethod
-(void)recoverLifeFromFrist;
@end
@interface LifeResultViewController : UIViewController
{
    int resultNum;
    UIImageView *resultImageView;
}
@property (nonatomic, strong) id <RecoverLifeMethod> delegate;
@property (nonatomic,strong) IBOutlet UILabel *lableResult;
@property (nonatomic,strong) IBOutlet UIButton *backBt;
@property (nonatomic,strong) IBOutlet UIButton *recoverBt;
@property (nonatomic,strong) IBOutlet UIImageView *backGroundImage;
@property (nonatomic,strong) IBOutlet UIImageView *resultImage;
@property (nonatomic,strong) NSMutableDictionary *mutableDict;
@end
