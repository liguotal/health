//
//  ChoiceViewController.m
//  Health
//
//  Created by yuntu on 14-3-27.
//  Copyright (c) 2014年 yutu. All rights reserved.
//

#import "ChoiceViewController.h"
#import "PersonalViewController.h"
#import "HistoryViewController.h"
#import "LifeTestViewController.h"
#import "MyTextViewController.h"
#import "ProductViewController.h"
#import "ScienceViewController.h"

@interface ChoiceViewController ()

@end

@implementation ChoiceViewController
@synthesize historyBt;
@synthesize ziliaoBt;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    historyBt.frame=CGRectMake(-2, mainscreenhight-108, 110, 45);
    _fristBt.frame=CGRectMake(106, mainscreenhight-108, 109, 45);
    ziliaoBt.frame=CGRectMake(214, mainscreenhight-108, 108, 45);
    
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
    historyBt.frame=CGRectMake(0, mainscreenhight-45, 45, 160);
    ziliaoBt.frame=CGRectMake(160, mainscreenhight-45, 45, 160);
    self.title=@"颈腰同治,通络镇痛";
    [self getnavigation];
    if([User LMData].phone==nil)
    {
        //[self personalVC:nil];
        [User LMData].phone=@"91919191919";
        [User LMData].stringID=@"01";
    }
    //[self personalVC:nil];
}
-(IBAction)personalVC:(id)sender
{
    PersonalViewController *personView=[[PersonalViewController alloc] init];
    [self presentViewController:personView animated:YES completion:nil];
}
-(IBAction)myTextVC:(id)sender
{
    LifeTestViewController *lifeVC=[[LifeTestViewController alloc] init];
    [self.navigationController pushViewController:lifeVC animated:YES];
}
-(IBAction)lifeVC:(id)sender
{
    MyTextViewController *myTextVC=[[MyTextViewController alloc] init];
    [self.navigationController pushViewController:myTextVC animated:YES];
    
}
-(IBAction)scienceVC:(id)sender
{
    ScienceViewController *scienceVC=[[ScienceViewController alloc] init];
    [self.navigationController pushViewController:scienceVC animated:YES];
}
-(IBAction)productVC:(id)sender
{
    ProductViewController *productVC=[[ProductViewController alloc] init];
    [self.navigationController pushViewController:productVC animated:YES];
}
-(IBAction)historyVC:(id)sender
{
    if([[User LMData].phone isEqualToString:@"91919191919"]||[[User LMData].stringID isEqualToString:@"01"])
    {
        [GlobalClass textNoSpace:@"暂时没有您的资料，请先修改资料"];
        return;
    }
    HistoryViewController *historyVC=[[HistoryViewController alloc] init];
    [self.navigationController pushViewController:historyVC animated:YES];
}
-(IBAction)fristMethod:(id)sender
{
    
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
