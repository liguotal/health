//
//  PersonalViewController.m
//  Health
//
//  Created by yuntu on 14-3-27.
//  Copyright (c) 2014年 yutu. All rights reserved.
//

#import "PersonalViewController.h"
#import "NSObject+UIViewCate.h"
@interface PersonalViewController ()

@end

@implementation PersonalViewController
@synthesize lableBrithday;
@synthesize remarkText;
@synthesize phoneText;
@synthesize dateView;
@synthesize lableEdu;
@synthesize lableProfession;
@synthesize lableMerriage;
@synthesize viewBackGround;
@synthesize scrollview;
@synthesize manBt;
@synthesize wemanBt;
@synthesize diseaseBtYes;
@synthesize diseaseBtNo;
@synthesize eduBt;
@synthesize marriageBt;
@synthesize professionBt;
@synthesize lableNongli;
@synthesize map;
@synthesize lng;
@synthesize lat;
@synthesize geocoder;
@synthesize city;
@synthesize local;
@synthesize delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
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
    [self showPerson];
    [self setUpForDismissKeyboard];
    [self backButton];
    self.remarkText.autoresizingMask = UIViewAutoresizingFlexibleHeight;//自适应高度
    self.remarkText.delegate=self;
    //self.remarkText.placeholder = @"您好，我是Andy—清风";
    [self getlocation];
}
-(void)getlocation
{
    MKMapView* smap=[[MKMapView alloc]init];
    
    smap.showsUserLocation=YES;
    smap.delegate=self;
    self.map=smap;
    lat=map.userLocation.coordinate.latitude;
    lng=map.userLocation.coordinate.longitude;
    //[self mapView:self.map didUpdateUserLocation:self.map.userLocation];
}

-(void)getLocalShow
{
    CLLocation *mycurLocaton=[[CLLocation alloc]initWithLatitude:self.lat longitude:self.lng];
    //反解析
    if (geocoder==nil) {
        geocoder =[[CLGeocoder alloc]init];
    }
    [geocoder reverseGeocodeLocation:mycurLocaton completionHandler:^(NSArray *places,NSError *error){
        CLPlacemark *aPlace=[places objectAtIndex:0];
        if (aPlace.name==nil) {
            //[lab_Area setText:@"无法获取信息"];
            NSLog(@"输出地址01%@",aPlace.name);
        }else
        {
            NSLog(@"输出地址01%@",aPlace.name);
            NSLog(@"输出地址22%@",aPlace.thoroughfare);
            NSLog(@"输出地址33%@",aPlace.subThoroughfare);
            NSLog(@"输出地址44%@",aPlace.locality);
            NSLog(@"输出地址55%@",aPlace.subLocality);
            NSLog(@"输出地址66%@",aPlace.administrativeArea);
            NSLog(@"输出地址77%@",aPlace.postalCode);
            NSLog(@"输出地址88%@",aPlace.ISOcountryCode);
            NSLog(@"输出地址99%@",aPlace.country);
            NSLog(@"输出地址10%@",aPlace.inlandWater);
            NSLog(@"输出地址11%@",aPlace.ocean);
            [User LMData].province=aPlace.administrativeArea;
            [User LMData].city=aPlace.subLocality;
            [User LMData].street=aPlace.name;
        }
        
    }];
}
//==================地图代理==========================
-(void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    self.lat=newLocation.coordinate.latitude;
    self.lng=newLocation.coordinate.longitude;
}
-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    if (((int)self.lat==0)&&((int)self.lng==0)) {
        self.lat=map.userLocation.coordinate.latitude;
        self.lng=map.userLocation.coordinate.longitude;
        NSLog(@"输出经纬度%f,,%f",self.lat,self.lng);
        [self getLocalShow];
    }
    else
    {
        self.lat=map.userLocation.coordinate.latitude;
        self.lng=map.userLocation.coordinate.longitude;
        
    }
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
-(void)showPerson
{
    if(IPhone5)
    {
        self.scrollview.frame=CGRectMake(0, 65, 320, mainscreenhight-65);
    }else
    {
        self.scrollview.frame=CGRectMake(0, 145, 320, mainscreenhight-65);
    }
    
    self.scrollview.contentSize = CGSizeMake(320, 800);
    [self.scrollview addSubview:viewBackGround];
}
#pragma mark - 选择相关的分类
-(IBAction)eduButton:(id)sender
{
    if (eduView==nil) {
        eduView=[[EduView alloc] init];
         NSArray *arr=[NSArray arrayWithObjects:@"小学及以下",@"初中",@"高中或中专",@"大专",@"本科",@"研究生",@"博士及以上", nil];
        [eduView initGqView:lableEdu andArray:arr];
        __weak id bSelf = self;
        [eduView setButtonAction:^(NSString *str,BOOL status)
         {
             [bSelf buttonAction:str andStatus:status];
         }];
    }else
    {
        [eduView hideDropDown:lableEdu];
        eduView=nil;
    }
}
-(IBAction)professionButton:(id)sender
{
    if (professionView==nil) {
        professionView=[[ProfessionView alloc] init];
        NSArray *arr=[NSArray arrayWithObjects:@"退休",@"教育",@"营销",@"工人",@"公务员",@"事业单位",@"司机",@"白领",@"学生", nil];
        [professionView initGqView:lableProfession andArray:arr];
        __weak id bSelf = self;
        [professionView setButtonAction:^(NSString *str,BOOL status)
         {
             [bSelf profession:str andSta:status];
         }];
    }else
    {
        [professionView hideDropDown:lableEdu];
        professionView=nil;
    }

}
-(IBAction)merriageButton:(id)sender
{
    if (merriageView==nil) {
        merriageView=[[MerriageView alloc] init];
        NSArray *arr=[NSArray arrayWithObjects:@"已婚",@"未婚", nil];
        [merriageView initGqView:lableMerriage andArray:arr];
        __weak id bSelf = self;
        [merriageView setButtonAction:^(NSString *str,BOOL status)
         {
             [bSelf merriage:str andStatu:status];
         }];
    }else
    {
        [merriageView hideDropDown:lableEdu];
        merriageView=nil;
    }
}
#pragma mark - 按钮相关方法
-(void)buttonAction:(NSString *)str andStatus:(BOOL)status
{
    lableEdu.text=str;
    eduView=nil;
}
-(void)profession:(NSString *)str andSta:(BOOL)sta
{
    lableProfession.text=str;
    professionBt=nil;
}
-(void)merriage:(NSString *)str andStatu:(BOOL)statu
{
    merriageView=nil;
    lableMerriage.text=str;
}
-(IBAction)downPersonDetail:(id)sender
{
    
    if (phoneText.text==nil||lableBrithday.text==nil||lableEdu.text==nil||lableProfession.text==nil||lableMerriage.text==nil||stringSex==nil) {
        NSLog(@"填写完整信息");
        [GlobalClass textNoSpace:@"请填写完整信息"];
        return;
    }
    [User LMData].phone=self.phoneText.text;
    [User LMData].remark=self.remarkText.text;
    [User LMData].education=self.lableEdu.text;
    [User LMData].profession=self.lableProfession.text;
    [User LMData].marriage=self.lableMerriage.text;
    [User LMData].brithday=self.lableBrithday.text;
    [User LMData].stringID=@"01";
    if ([User LMData].province==nil) {
        [User LMData].province=@"";
    }
    if ([User LMData].city==nil) {
        [User LMData].city=@"";
    }
    if ([User LMData].street==nil) {
        [User LMData].street=@"";
    }
    [NetWork sendUserData:^(NSDictionary *dic){
        NSLog(@"dic===%@",dic);
        //NSArray *arrayList=[dic objectForKey:@"list"];
        if (1 == [[dic objectForKey:@"success"] intValue])
        {
            //[SVProgressHUD dismissWithSuccess:@"登陆成功"];
            NSDictionary *dicId=[dic objectForKey:@"data"];
            [User LMData].stringID=[dicId objectForKey:@"userid"];
            NSLog(@"输出id%@",[User LMData].stringID);
            [GlobalClass storeUserData];
            [LM_USER_DEFAULT synchronize];
            [self dismissViewControllerAnimated:YES completion:nil];
            [self.delegate personalFinish];
        }else
        {
            [SVProgressHUD dismissWithError:@"登陆失败"];
        }
    }];
    
}
- (IBAction)sexSelect:(id)sender
{
    UIButton *but=(UIButton *)sender;
    NSLog(@"输出tag%d",but.tag);
    if (but.tag==1001) {
        [User LMData].sex=@"男";
        stringSex=@"男";
        manBt.selected=YES;
        wemanBt.selected=NO;
    }else
    {
        [User LMData].sex=@"女";
        stringSex=@"nv";
        manBt.selected=NO;
        wemanBt.selected=YES;
    }
}
- (IBAction)diseaseSelect:(id)sender
{
    UIButton *but=(UIButton *)sender;
    NSLog(@"输出tag%d",but.tag);
    if (but.tag==1003) {
        [User LMData].disease=@"是";
        diseaseBtYes.selected=YES;
        diseaseBtNo.selected=NO;
    }else
    {
        [User LMData].disease=@"否";
        diseaseBtNo.selected=YES;
        diseaseBtYes.selected=NO;
    }
}
-(IBAction)cancleButton:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark - 弹出时间农历和公历
- (IBAction)showSelectView:(id)sender
{
    [phoneText resignFirstResponder];
    if (self.dateView&&self.dateView.superview) {
        
        if (self.dateView.frame.origin.y<mainscreenhight-200-20) {
            
            [self downAtView:dateView];
        }
        
    }else{
        self.dateView = [[[NSBundle mainBundle] loadNibNamed:@"DateSelect" owner:self options:nil] objectAtIndex:0];
        dateView.delegate = self;
        self.dateView.frame = CGRectMake(0, mainscreenhight-270, 320, 261);
        //[self loadAnimationForView:dateView];
        [self.view addSubview:dateView];
    }
    
}

- (void)downAtView:(UIView *)tempView{//消失动画
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    tempView.frame = CGRectMake(0, mainscreenhight-20, 320, 261);
    [UIView commitAnimations];
    
    
    [self performSelector:@selector(removePicker:) withObject:tempView afterDelay:0.5];
}

- (void)loadAnimationForView:(UIView *)tempView{//弹出动画
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.01];
    
    tempView.frame = CGRectMake(0,  mainscreenhight-270, 320, 261);
    [UIView commitAnimations];
}

- (void)removePicker:(UIView *)tempView{
    
    [tempView removeFromSuperview];
}

#pragma mark- SelectDate Delegate
- (void)updataNewDate:(NSString *)str andType:(NSInteger)type//公历
{
    //birthText.text = str;
    NSLog(@"输出时间%@",str);
    self.lableBrithday.text=str;
    //NSString *stringDate = @"Mar 13, 2013 05:30pm";
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *date=[dateFormatter dateFromString:str];
    NSString *nongli=[GlobalClass LunarForSolar:date];
    NSLog(@"输出时间%@",nongli);
    self.lableNongli.text=nongli;
}

- (void)passlunarStrWithStr:(NSMutableArray *)arr//农历
{
    
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
- (void)tapAnywhereToDismissKeyboard:(UIGestureRecognizer *)gestureRecognizer {
    //此method会将self.view里所有的subview的first responder都resign掉
    [self.view endEditing:YES];
}
-(void)textViewDidBeginEditing:(UITextView *)textView
{
    //[self.view animateView:YES withMovement:100-IoskeyHeight];
    self.remarkText.text=@"";
}

-(void)textViewDidEndEditing:(UITextView *)textView
{
    //[self.view animateView:NO withMovement:0+IoskeyHeight];
}
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (textField.tag==101) {
        
    }else
    {
        [self.view animateView:YES withMovement:100-IoskeyHeight];
    }
    
    
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    [self.view animateView:NO withMovement:0+IoskeyHeight];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)dealloc
{
    
}

@end
