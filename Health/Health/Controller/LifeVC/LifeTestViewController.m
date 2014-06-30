//
//  LifeTestViewController.m
//  Health
//
//  Created by yuntu on 14-4-2.
//  Copyright (c) 2014年 yutu. All rights reserved.
//

#import "LifeTestViewController.h"
#import "LifeCell.h"
#import "LifeView.h"

@interface LifeTestViewController ()

@end

@implementation LifeTestViewController
@synthesize lifeTableView=_lifeTableView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title=@"颈腰椎病自我测试题";
        [self getnavigation];
        mutableDict=[[NSMutableDictionary alloc] init];
        localLifeData = [[NSArray alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Lifetext.plist" ofType:nil]];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initTableView];
    [self backButton];
}
-(void)initTableView
{
    _lifeTableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, mainscreenhight) style:UITableViewStyleGrouped];
    self.lifeTableView.delegate=self;
    self.lifeTableView.dataSource=self;
    self.lifeTableView.showsVerticalScrollIndicator=NO;
    self.lifeTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    if( ([[[UIDevice currentDevice] systemVersion] doubleValue]<7.0))
    {
        self.lifeTableView.frame=CGRectMake(-10, 0, 340, mainscreenhight);
    }
    [self.view addSubview:self.lifeTableView];
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
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return localLifeData.count;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 158;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    LifeView *lifeView= [[[NSBundle mainBundle] loadNibNamed:@"LifeView" owner:self options:nil] objectAtIndex:0];
    //[mytextView showView];
    __weak id bSelf = self;
    [lifeView setFinishedAction:^{
        [bSelf finishAction];
    }];
    [lifeView setBackgroundColor:[UIColor clearColor]];
    return lifeView;
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        NSLog(@"输入个人信息");
        PersonalViewController *personVC=[[PersonalViewController alloc] init];
        personVC.delegate=self;
        [self presentViewController:personVC animated:YES completion:nil];
    }
}
-(void)personalFinish
{
    [self finishAction];
}
-(void)finishAction
{
    [User LMData].lifeTextScores=[NSString stringWithFormat:@"%d",[SendData lifeLocalData:mutableDict]];
    [User LMData].lifeTextResult=[NSString stringWithFormat:@"%@",[SendData lifeSendDataToSenver:mutableDict]];
    [User LMData].myResult=@"";
    NSLog(@"输出提交的内容%@",[User LMData].lifeTextResult);
    if (mutableDict.count<20) {
       [GlobalClass textNoSpace:@"还有没做完的题，请答完"];
       return;
    }
    if([[User LMData].phone isEqualToString:@"91919191919"])
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"没有您的个人信息，请输入" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"输入", nil];
        [alertView show];
        return;
    }
    [NetWork sendLifetextResultData:^(NSDictionary *dic){
        NSLog(@"dic===%@",dic);
        //NSArray *arrayList=[dic objectForKey:@"list"];
        if (1 == [[dic objectForKey:@"success"] intValue])
        {
            //[SVProgressHUD dismissWithSuccess:@"登陆成功"];
           
        }else
        {
//            NSString *string=[dic objectForKey:@"message"];
//            [GlobalClass textNoSpace:string];
//            [SVProgressHUD dismissWithError:@"登陆失败"];
        }
    }];
    LifeResultViewController *resultVC=[[LifeResultViewController alloc] init];
    resultVC.mutableDict=mutableDict;
    resultVC.delegate=self;
    [self.navigationController pushViewController:resultVC animated:YES];
}
-(void)recoverLifeFromFrist
{
    [mutableDict removeAllObjects];
    self.lifeTableView.contentOffset=CGPointMake(0.0, 0.0);
    [self.lifeTableView reloadData];
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 160;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIndentify=@"LifeCell";
    LifeCell *cell=(LifeCell *)[tableView dequeueReusableCellWithIdentifier:cellIndentify];
    if (!cell) {
        cell =[[[NSBundle mainBundle] loadNibNamed:@"LifeCell" owner:self options:nil] lastObject];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
    }
    __weak id bSelf = self;
    [cell setButtonAction:^(LifeCell *cell,NSInteger status,UITouch *touch){
        [bSelf buttonAction:cell andStatus:status andtouch:touch];
    }];
    NSString *key = [@"Row" stringByAppendingFormat:@"%d",indexPath.row];
    NSNumber *checked = [mutableDict objectForKey:key];
    [cell choiceWhitch:checked];
    NSDictionary *dict=[localLifeData objectAtIndex:indexPath.row];
    [cell sendDictionary:dict];
    return cell;
}

-(void)buttonAction:(LifeCell*)cell andStatus:(NSInteger)status andtouch:(UITouch *)touch
{
    CGPoint currentTouchPosition = [touch locationInView:self.lifeTableView];
    NSIndexPath *indexPath = [self.lifeTableView indexPathForRowAtPoint:currentTouchPosition];
    //NSLog(@"输出点击哪个cell%d",indexPath.row);
    //=======设定标志位==========================
    NSString *key = [@"Row" stringByAppendingFormat:@"%d",indexPath.row];
    NSNumber *checked = [NSNumber numberWithInt:status];
    [mutableDict setObject:checked forKey:key];
    //[Answer lifeTestAnswer:mutableDict];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"输出点击了%d",indexPath.row);
    
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
