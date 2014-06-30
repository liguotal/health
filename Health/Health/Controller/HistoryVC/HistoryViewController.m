//
//  HistoryViewController.m
//  Health
//
//  Created by yuntu on 14-4-1.
//  Copyright (c) 2014年 yutu. All rights reserved.
//

#import "HistoryViewController.h"
#import "HistoryCellCell.h"
@interface HistoryViewController ()

@end

@implementation HistoryViewController
@synthesize historyTalbeView=_historyTalbeView;
@synthesize mutableArray;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title=@"历史记录";
        [self getnavigation];
        mutableArray =[[NSMutableArray alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self getHistoryData];
    [self tableShow];
    [self backButton];
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
-(void)tableShow
{
    _historyTalbeView=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, mainscreenhight-60) style:UITableViewStylePlain];
    self.historyTalbeView.delegate=self;
    self.historyTalbeView.dataSource=self;
    [self.view addSubview:self.historyTalbeView];
}
-(void)getHistoryData
{
    [NetWork getHistoryData:^(NSDictionary *dic){
        NSLog(@"dic===%@",dic);
        //NSArray *arrayList=[dic objectForKey:@"list"];
        if (1 == [[dic objectForKey:@"success"] intValue])
        {
            //[SVProgressHUD dismissWithSuccess:@"登陆成功"];
            mutableArray=[dic objectForKey:@"data"];
            [self.historyTalbeView reloadData];
        }else
        {
            [SVProgressHUD dismissWithError:@"登陆失败"];
        }
    }];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return mutableArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 57;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIndentify=@"HistoryCellCell";
    HistoryCellCell *cell=(HistoryCellCell *)[tableView dequeueReusableCellWithIdentifier:cellIndentify];
    if (!cell) {
        cell =[[[NSBundle mainBundle] loadNibNamed:@"HistoryCellCell" owner:self options:nil] lastObject];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
    }
    cell.backgroundView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"historyCell"]];
    HistoryModel *history=[mutableArray objectAtIndex:indexPath.row];
    cell.lableTitle.text=history.CeShiLeiXing;
    cell.lableFen.text=[NSString stringWithFormat:@"%@分",history.DeFen];
    cell.lableTime.text=history.TestDate;
    return cell;
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
