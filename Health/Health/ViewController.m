//
//  ViewController.m
//  Health
//
//  Created by yuntu on 14-3-27.
//  Copyright (c) 2014年 yutu. All rights reserved.
//

#import "ViewController.h"
#import "ChoiceViewController.h"
@interface ViewController ()

@end

@implementation ViewController
@synthesize navigation;
- (void)viewDidLoad
{
    [super viewDidLoad];
    if( ([[[UIDevice currentDevice] systemVersion] doubleValue]>=7.0))
    {
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.extendedLayoutIncludesOpaqueBars = NO;
        self.modalPresentationCapturesStatusBarAppearance = NO;
    }
	ChoiceViewController *choiceView=[[ChoiceViewController alloc] init];
    self.navigation=[[UINavigationController alloc]initWithRootViewController:choiceView];
    self.navigation.view.frame=CGRectMake(0, 0, mainscreenwidth, mainscreenhight);
    [self.view addSubview:self.navigation.view];
    if( ([[[UIDevice currentDevice] systemVersion] doubleValue]>=7.0))//naviga
    {
        [self.navigation.navigationBar setBackgroundImage:[UIImage imageNamed:@"naviga"] forBarMetrics:UIBarMetricsDefault];
    }else
    {
        [self.navigation.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigation"] forBarMetrics:UIBarMetricsDefault];
    }
    //[self.navigation setNavigationBarHidden:YES animated:NO];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
