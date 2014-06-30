//
//  MyTextViewController.m
//  Health
//
//  Created by yuntu on 14-4-1.
//  Copyright (c) 2014年 yutu. All rights reserved.
//

#import "MyTextViewController.h"
#import "MyTextCell.h"
#import "MytextView.h"
#import "NSObject+UIViewCate.h"
@interface MyTextViewController ()

@end

@implementation MyTextViewController
@synthesize myTextTableView=_myTextTableView;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title=@"WHO生存质量测试";
        [self getnavigation];
        mutableDict=[[NSMutableDictionary alloc] init];
        localData = [[NSArray alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Mytext.plist" ofType:nil]];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    IoskeyHeight=0.0;
    if( ([[[UIDevice currentDevice] systemVersion] doubleValue]>=7.0))
    {
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.extendedLayoutIncludesOpaqueBars = NO;
        self.modalPresentationCapturesStatusBarAppearance = NO;
        IoskeyHeight=64.0;
    }
    [self initTableView];
    [self setUpForDismissKeyboard];
    [self backButton];
    [User LMData].myResult=nil;
}
-(void)initTableView
{
    _myTextTableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, mainscreenhight) style:UITableViewStyleGrouped];
    if( ([[[UIDevice currentDevice] systemVersion] doubleValue]<7.0))
    {
        self.myTextTableView.frame=CGRectMake(-10, 0, 340, mainscreenhight);
    }
    self.myTextTableView.delegate=self;
    self.myTextTableView.dataSource=self;
    self.myTextTableView.showsVerticalScrollIndicator=NO;
    self.myTextTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    //self.myTextTableView.backgroundView=nil;
    //self.myTextTableView.backgroundColor=[UIColor colorWithRed:237.0/255 green:237.0/255 blue:237.0/255 alpha:1];
    [self.view addSubview:self.myTextTableView];
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
    return localData.count;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView

{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 229;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    MytextView *mytextView= [[[NSBundle mainBundle] loadNibNamed:@"MytextView" owner:self options:nil] objectAtIndex:0];
    mytextView.textField.delegate=self;
    [mytextView showView];
    __weak id bSelf = self;
    [mytextView setFinishedAction:^{
        [bSelf finishAction];
    }];
    [mytextView setBackgroundColor:[UIColor clearColor]];
    return mytextView;
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
    [User LMData].myTextScores=[NSString stringWithFormat:@"%d",[SendData myTextLocalData:mutableDict]];
    [User LMData].myTextResult=[NSString stringWithFormat:@"%@",[SendData myTextSendDataToSenver:mutableDict]];
    NSLog(@"输出提交的内容%@",[User LMData].myTextResult);
    if ([User LMData].myResult==nil) {
        [GlobalClass textNoSpace:@"请为自己打个分"];
        return;
    }
    if ([[User LMData].myResult intValue]>140||[[User LMData].myResult intValue]<0) {
        [GlobalClass textNoSpace:@"您输入的数值不对"];
        return;
    }
    if (mutableDict.count<28) {
        [GlobalClass textNoSpace:@"还有没做完的题，请答完"];
        return;
    }
    if([[User LMData].phone isEqualToString:@"91919191919"])
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"没有您的个人信息，请输入" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"输入", nil];
        [alertView show];
        return;
    }
    [NetWork sendMytextResultData:^(NSDictionary *dic){
        NSLog(@"dic===%@",dic);
        //NSArray *arrayList=[dic objectForKey:@"list"];
        if (1 == [[dic objectForKey:@"success"] intValue])
        {
            //[SVProgressHUD dismissWithSuccess:@"登陆成功"];
            
        }else
        {
            [SVProgressHUD dismissWithError:@"登陆失败"];
        }
    }];
    
    MyTextResultViewController *resultVC=[[MyTextResultViewController alloc] init];
    resultVC.mutableDict=mutableDict;
    resultVC.delegate=self;
    [self.navigationController pushViewController:resultVC animated:YES];
}
-(void)recoverFromFrist
{
    [mutableDict removeAllObjects];
    self.myTextTableView.contentOffset=CGPointMake(0.0, 0.0);
    [self.myTextTableView reloadData];
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 260;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIndentify=@"MyTextCell";
    MyTextCell *cell=(MyTextCell *)[tableView dequeueReusableCellWithIdentifier:cellIndentify];
    if (!cell) {
        cell =[[[NSBundle mainBundle] loadNibNamed:@"MyTextCell" owner:self options:nil] lastObject];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
    }
    __weak id bSelf = self;
    [cell setButtonAction:^(MyTextCell *cell,NSInteger status,UITouch *touch){
        [bSelf buttonAction:cell andStatus:status andtouch:touch];
    }];
    NSString *key = [@"Row" stringByAppendingFormat:@"%d",indexPath.row];
    NSNumber *checked = [mutableDict objectForKey:key];
    [cell choiceWhitch:checked];
    NSDictionary *dict=[localData objectAtIndex:indexPath.row];
    [cell sendDictionary:dict];
    return cell;
}

-(void)buttonAction:(MyTextCell*)cell andStatus:(NSInteger)status andtouch:(UITouch *)touch
{
    CGPoint currentTouchPosition = [touch locationInView:self.myTextTableView];
    NSIndexPath *indexPath = [self.myTextTableView indexPathForRowAtPoint:currentTouchPosition];
    NSLog(@"输出点击哪个cell%d",indexPath.row);
    //=======设定标志位==========================
    NSString *key = [@"Row" stringByAppendingFormat:@"%d",indexPath.row];
    NSNumber *checked = [NSNumber numberWithInt:status];
    [mutableDict setObject:checked forKey:key];
    //NSLog(@"输出字典%@",mutableDict);
//    [Answer myTestAnswer:mutableDict];
//    [SendData myTextLocalData:mutableDict];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //NSLog(@"输出点击了%d",indexPath.row);
}
#pragma mark- 弹下键盘
- (void)setUpForDismissKeyboard {
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    UITapGestureRecognizer *singleTapGR =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(tapAnywhereToDismissKeyboard:)];
    NSOperationQueue *mainQuene =[NSOperationQueue mainQueue];
    [nc addObserverForName:UIKeyboardWillShowNotification
                    object:nil
                     queue:mainQuene
                usingBlock:^(NSNotification *note){
                    [self.view addGestureRecognizer:singleTapGR];
                }];
    [nc addObserverForName:UIKeyboardWillHideNotification
                    object:nil
                     queue:mainQuene
                usingBlock:^(NSNotification *note){
                    [self.view removeGestureRecognizer:singleTapGR];
                }];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}
- (void)tapAnywhereToDismissKeyboard:(UIGestureRecognizer *)gestureRecognizer {
    //此method会将self.view里所有的subview的first responder都resign掉
    [self.view endEditing:YES];
}
-(void)textViewDidBeginEditing:(UITextView *)textView
{
    [self.view animateView:YES withMovement:120-IoskeyHeight];
}

-(void)textViewDidEndEditing:(UITextView *)textView
{
    [self.view animateView:NO withMovement:0+IoskeyHeight];
}
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    [self.view animateView:YES withMovement:140-IoskeyHeight];
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    [self.view animateView:NO withMovement:0+IoskeyHeight];
    [User LMData].myResult=textField.text;
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
