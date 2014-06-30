//
//  LifeResultViewController.m
//  Health
//
//  Created by yuntu on 14-4-4.
//  Copyright (c) 2014年 yutu. All rights reserved.
//

#import "LifeResultViewController.h"
#import "ProductViewController.h"
#import "ScienceViewController.h"
@interface LifeResultViewController ()

@end

@implementation LifeResultViewController
@synthesize mutableDict;
@synthesize backBt;
@synthesize recoverBt;
@synthesize resultImage;
@synthesize backGroundImage;
@synthesize lableResult;
@synthesize delegate;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title=@"测试结果";
        [self getnavigation];
    }
    return self;
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    backGroundImage.frame=CGRectMake(0, -50, 320, mainscreenhight);
    recoverBt.frame=CGRectMake(180, mainscreenhight-120, 133, 38);
    backBt.frame=CGRectMake(20, mainscreenhight-120, 133, 38);
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    if( ([[[UIDevice currentDevice] systemVersion] doubleValue]>=7.0))
    {
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.extendedLayoutIncludesOpaqueBars = NO;
        self.modalPresentationCapturesStatusBarAppearance = NO;
    }
    
    resultNum=[SendData myTextLocalData:self.mutableDict];
    [self showResulet];
    NSLog(@"输出最终测试的结果%d",resultNum);
    [self backButton];
    [self buttonTitle];
}
-(void)backButton
{
    self.navigationItem.hidesBackButton=YES;
    UIButton* backbutton=[LMBackBt LMHomeButton];
    [backbutton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem* goback=[[UIBarButtonItem alloc]initWithCustomView:backbutton];
    self.navigationItem.leftBarButtonItem=goback;
}
-(void)back
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}
-(void)buttonTitle
{
    UILabel *lableDisease=[LMBackBt LMLable:@"疾病解读" andFond:20 andColor:(UIColor *)[UIColor whiteColor] andXing:@"Helvetica" andFrame:CGRectMake(25, 4, 130, 30)];
    [self.backBt addSubview:lableDisease];
    UILabel *lableInfo=[LMBackBt LMLable:@"颈腰康简介" andFond:20 andColor:(UIColor *)[UIColor whiteColor] andXing:@"Helvetica" andFrame:CGRectMake(17, 4, 130, 30)];
    [self.recoverBt addSubview:lableInfo];
}
-(void)showResulet
{
    resultImageView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Resutl"]];
    //resultImageView.frame=CGRectMake(210, 183, 90, 11);
    int result=[[User LMData].lifeTextScores intValue];
    if (result>=0&&result<=50) {
        resultImageView.frame=CGRectMake(62, 160, 90, 11);
    }else if (result>50&&result<=80)
    {
        resultImageView.frame=CGRectMake(62, 128, 90, 11);
    }else if (result>80&&result<=90)
    {
        resultImageView.frame=CGRectMake(62, 94, 90, 11);
    }else if (result>90&&result<=100)
    {
        resultImageView.frame=CGRectMake(62, 64, 90, 11);
    }
    lableResult.text=[NSString stringWithFormat:@"您的分数:%d分",result];
    [self.view addSubview:resultImageView];
}
-(IBAction)goBackFrist:(id)sender
{
    ScienceViewController *scienceVC=[[ScienceViewController alloc] init];
    [self.navigationController pushViewController:scienceVC animated:YES];
    //[self.navigationController popToRootViewControllerAnimated:YES];
}
-(IBAction)recoverMethod:(id)sender
{
    ProductViewController *productVC=[[ProductViewController alloc] init];
    [self.navigationController pushViewController:productVC animated:YES];
    
    
    //[self.delegate recoverLifeFromFrist];
    //[self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)getnavigation
{
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],UITextAttributeTextColor,[UIColor whiteColor],UITextAttributeTextShadowColor,[NSValue valueWithUIOffset:UIOffsetMake(0, -1)],UITextAttributeTextShadowOffset,[UIFont fontWithName:@"Arial-Bold" size:10.0],UITextAttributeFont,nil]];
}
@end
