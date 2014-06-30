//
//  ScienceViewController.m
//  Health
//
//  Created by yuntu on 14-4-1.
//  Copyright (c) 2014年 yutu. All rights reserved.
//

#import "ScienceViewController.h"

@interface ScienceViewController ()

@end

@implementation ScienceViewController
@synthesize scrolView;
@synthesize imageView;
@synthesize viewBack;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title=@"颈腰椎疾病科普知识";
        [self getnavigation];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self backButton];
    [self showInfomation];
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
-(void)showInfomation
{
    [self.scrolView addSubview:viewBack];
//    NSString *stringInfo=@"一、脊椎起源人类——因脊椎而高级。\n    人类是动物界最高等分类，脊索动物门（最高等）——脊椎动物亚门 （最高级亚门），只有4%生物有脊椎。脊椎是生物演化史中“质的飞跃”可完成定向运动，且更加准确、迅捷，器官拥有更多保护、神经更发达、拥有头部。\n    脊椎——“人体第二生命线”\n    人体最精密的骨骼、人的“第二生命线”。人寿命预期为120岁，但脊椎疾病会减少寿命1/3。人体43对神经中脊神经占31对，掌控头部以下全身的感觉和运动，有最浅的动脉、唯一骨骼保护的血管、最大的无血管器官、韧带：最长的韧带、保护最重要的器官。一百多种疾病与脊椎有关。\n三、什么是颈椎、腰椎\n    人类脊柱由24块椎骨（颈椎7块，胸椎12块，腰椎5块）、1块骶骨和1块尾骨借韧带、关节及椎间盘连接而成。颈椎是人体。\n四、什么是颈腰椎病\n    颈腰椎病的发病基础均为“椎间盘退行性改变”，从而压迫周围组织和神经，产生相应症状。\n五、什么是椎间盘\n    人体最大无血管器官，位于两节脊椎之间，作用是缓冲压力。\n六、椎间盘为什么会退变\n    20岁以后，椎间盘内血管消失，椎间盘退变就开始了。而且一旦退变会越来越快。\n七、椎间盘退变两大病理改变\n    一是“椎间盘突出”，二是椎体的“骨质增生”\n八、病理改变一：椎间盘突出\n    20岁以后，椎间盘含水量减少，在每天活动压力下，会产生裂纹，椎间盘中央的胶状物质（髓核）突出，甚至脱出，压迫周围的血管和神经。\n九、病理改变二：骨质增生\n    椎间盘退变，会导致椎间盘变薄，活动磨损椎体产生血瘀→血瘀软骨化→骨化。\n十、颈椎病症状、分型\n    一般来说，颈椎上段发病易压迫颈动脉，导致头晕头痛。中段发病易导致颈肩手臂发麻。下段发病易导致手臂、手指发麻。另外，压迫脊髓易导致瘫痪。\n十一、腰椎病症状\n    腰痛、腿痛、跛行\n十二、颈、腰椎病的治疗目标\n    退行性病变不可逆，所以治疗目标是抗炎镇痛，缓解症状，提高生活质量。\n十三、颈、腰椎病的治疗及常见用药\n    物理疗法包括：针灸、按摩、牵引等。\n    常见治疗药物：镇痛药（扑热息痛）、非甾体抗炎药NSAIDs（扶他林、芬必得、英太青）、改变病情药DMARDs（MTX）、中成药（通化卫京药业的颈腰康）\n十四、颈、腰椎病常见药物的不足\n    抗炎镇痛西药——胃肠道刺激、出血、心脑血管病风险中成药——仅针对单一部位（颈椎或腰椎），不能整体治疗";
//    self.textView.text=stringInfo;
//    CGSize size = [stringInfo sizeWithFont:textView.font constrainedToSize:CGSizeMake(textView.frame.size.width, MAXFLOAT) lineBreakMode:NSLineBreakByWordWrapping];
//    //根据计算结果重新设置UILabel的尺寸
//    textView.userInteractionEnabled=NO;
//    [textView setFrame:CGRectMake(0, 170, 290, size.height)];
//    NSLog(@"输出大小%f",size.height);
    viewBack.frame=CGRectMake(0, 0, 320, mainscreenhight);
    self.scrolView.frame=CGRectMake(0, 0, 320, mainscreenhight+100);
    self.scrolView.contentSize = CGSizeMake(320,1616);
}
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
