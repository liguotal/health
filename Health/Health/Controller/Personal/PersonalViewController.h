//
//  PersonalViewController.h
//  Health
//
//  Created by yuntu on 14-3-27.
//  Copyright (c) 2014年 yutu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IdentityView.h"
#import "EduView.h"
#import "ProfessionView.h"
#import "MerriageView.h"
#import "DateSelect.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
@protocol ResultDelegeta
-(void)personalFinish;
@end

@interface PersonalViewController : UIViewController<dateSelectDelegate,UITextViewDelegate,CLLocationManagerDelegate,MKMapViewDelegate>
{
    EduView *eduView;
    ProfessionView *professionView;
    MerriageView *merriageView;
    float IoskeyHeight;
    CLGeocoder* geocoder;
    NSString *stringSex;
    NSString *stringDisease;
}
@property (nonatomic, strong) id <ResultDelegeta> delegate;
@property (strong,nonatomic) NSMutableString* city;
@property (strong,nonatomic) NSMutableString* local;
@property CGFloat lat,lng;
@property (strong,nonatomic) CLGeocoder* geocoder;
@property (strong,nonatomic) MKMapView* map;
@property (nonatomic,strong) DateSelect * dateView;
@property (nonatomic,strong) IBOutlet UITextField *phoneText;
@property (nonatomic,strong) IBOutlet UITextView *remarkText;
@property (nonatomic,strong) IBOutlet UILabel *lableBrithday;
@property (nonatomic,strong) IBOutlet UILabel *lableEdu;
@property (nonatomic,strong) IBOutlet UILabel *lableProfession;
@property (nonatomic,strong) IBOutlet UILabel *lableMerriage;
@property (nonatomic,strong) IBOutlet UILabel *lableNongli;
@property (nonatomic,strong) IBOutlet UIView *viewBackGround;
@property (nonatomic,strong) IBOutlet UIScrollView *scrollview;
@property (nonatomic,strong) IBOutlet UIButton *manBt;
@property (nonatomic,strong) IBOutlet UIButton *wemanBt;
@property (nonatomic,strong) IBOutlet UIButton *diseaseBtYes;
@property (nonatomic,strong) IBOutlet UIButton *diseaseBtNo;
@property (nonatomic,strong) IBOutlet UIButton *eduBt;
@property (nonatomic,strong) IBOutlet UIButton *marriageBt;
@property (nonatomic,strong) IBOutlet UIButton *professionBt;


@end
