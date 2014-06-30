//
//  ProductViewController.m
//  Health
//
//  Created by yuntu on 14-4-1.
//  Copyright (c) 2014年 yutu. All rights reserved.
//

#import "ProductViewController.h"

@interface ProductViewController ()

@end

@implementation ProductViewController
@synthesize scrolView;
@synthesize imageView;
@synthesize viewBack;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title=@"颈腰康产品介绍";
        [self getnavigation];
    }
    return self;
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"1");
}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSLog(@"2");
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    NSLog(@"4");
}
-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    NSLog(@"5");
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"3");
    [self showInfomation];
    [self backButton];
    
}
-(void)showInfomation
{
    [self.scrolView addSubview:viewBack];
    viewBack.frame=CGRectMake(0, 0, 320, mainscreenhight);
    self.scrolView.frame=CGRectMake(0, 0, 320, mainscreenhight+100);
    self.scrolView.contentSize = CGSizeMake(320,1757);
}
-(void)backButton
{
    self.navigationItem.hidesBackButton=YES;
    UIButton* backbutton=[LMBackBt LMbackButton];
    [backbutton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem* goback=[[UIBarButtonItem alloc]initWithCustomView:backbutton];
    self.navigationItem.leftBarButtonItem=goback;
}
-(void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}
//-(void)getHttpData
//{
//    //[SVProgressHUD showSuccessWithStatus:@"正在登陆"];
//    [NetWork getProductData:^(NSDictionary *dic){
//        NSLog(@"dic===%@",dic);
//        //NSArray *arrayList=[dic objectForKey:@"list"];
//        if (1 == [[dic objectForKey:@"success"] intValue])
//        {
//            //[SVProgressHUD dismissWithSuccess:@"登陆成功"];
//            ScienceModel *science=[dic objectForKey:@"data"];
//            NSLog(@"输出内容%@",[dic objectForKey:@"dataKit"]);
//            //NSString *tempText=@"<H1>Hell World!</H1><p>大家好！我是云途！</p>";
//            [_webView loadHTMLString:science.content baseURL:nil];
//        }else
//        {
//            [SVProgressHUD dismissWithError:@"登陆失败"];
//        }
//    }];
//}

-(void)getnavigation
{
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],UITextAttributeTextColor,[UIColor whiteColor],UITextAttributeTextShadowColor,[NSValue valueWithUIOffset:UIOffsetMake(0, -1)],UITextAttributeTextShadowOffset,[UIFont fontWithName:@"Arial-Bold" size:10.0],UITextAttributeFont,nil]];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
