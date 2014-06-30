//
//  MyTextResultViewController.m
//  Health
//
//  Created by yuntu on 14-4-4.
//  Copyright (c) 2014年 yutu. All rights reserved.
//

#import "MyTextResultViewController.h"
#import "ProductViewController.h"
#import "ScienceViewController.h"
@interface MyTextResultViewController ()

@end

@implementation MyTextResultViewController
@synthesize mutableDict;
@synthesize backBt;
@synthesize backGroundImage;
@synthesize recoverBt;
@synthesize resultImage;
@synthesize lableMyresult;
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
    resultNum=[SendData myTextLocalData:self.mutableDict];
    NSLog(@"输出最终测试的结果%d",resultNum);
    [self resultShow];
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
-(void)resultShow
{
    myReImageView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"myResultLine"]];
    resultImageView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Resutl"]];
//    myReImageView.frame=CGRectMake(220, 182, 90, 11);
//    resultImageView.frame=CGRectMake(65, 37, 90, 11);
    int myResult=[[User LMData].myResult intValue];
    if (myResult>=0&&myResult<=28) {
        myReImageView.frame=CGRectMake(169, 176, 90, 11);
    }else if (myResult>28&&myResult<=56)
    {
        myReImageView.frame=CGRectMake(169, 144, 90, 11);
    }else if (myResult>56&&myResult<=84)
    {
        myReImageView.frame=CGRectMake(169, 112, 90, 11);
    }else if (myResult>84&&myResult<=112)
    {
        myReImageView.frame=CGRectMake(169, 80, 90, 11);
    }else if (myResult>112&&myResult<=140)
    {
        myReImageView.frame=CGRectMake(169, 48, 90, 11);
    }
    int result=[[User LMData].myTextScores intValue];
    if (result>=0&&result<=28) {
        resultImageView.frame=CGRectMake(62, 176, 90, 11);
    }else if (result>28&&result<=56)
    {
        resultImageView.frame=CGRectMake(62, 144, 90, 11);
    }else if (result>56&&result<=84)
    {
        resultImageView.frame=CGRectMake(62, 112, 90, 11);
    }else if (result>84&&result<=112)
    {
        resultImageView.frame=CGRectMake(62, 80, 90, 11);
    }else if (result>112)
    {
        resultImageView.frame=CGRectMake(62, 48, 90, 11);
    }
    lableResult.text=[NSString stringWithFormat:@"自我评分:%d分",myResult];
    lableMyresult.text=[NSString stringWithFormat:@"您的得分:%d分",result];
    [self.view addSubview:myReImageView];
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
    
    
    //[self.delegate recoverFromFrist];
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
