//
//  MainViewController.m
//  tyresize
//
//  Created by meng qian on 13-3-8.
//  Copyright (c) 2013年 thinktube. All rights reserved.
//

#import "MainViewController.h"
#import "KBViewController.h"
#import "OtherViewController.h"
#import "AppDelegate.h"
#import "OperationView.h"
#import "ParameterView.h"
#import "TyreView.h"

#import "ColoredButton.h"

@interface MainViewController ()
// tyre view
@property(strong, nonatomic)TyreView *tyreView;
@property(strong, nonatomic)OperationView *operView;
@property(strong, nonatomic)ParameterView *prmtView;
@property(strong, nonatomic)UIView *buttonView;
@property(strong, nonatomic)ColoredButton *switchBtn;
@property(strong, nonatomic)ColoredButton *wikiBtn;
@property(strong, nonatomic)ColoredButton *otherBtn;
//some bg View
@property(strong, nonatomic)UIImageView *tyreBgView;
// main label
@property(strong, nonatomic)UILabel *leftTitle;
@property(strong, nonatomic)UILabel *rightTitle;
//@property(strong, nonatomic)NSString *curSystem;

// value
@property(assign, nonatomic)CGFloat nowWFloat;
@property(assign, nonatomic)CGFloat nowAFloat;
@property(assign, nonatomic)CGFloat nowRFloat;
@property(assign, nonatomic)CGFloat wantWFloat;
@property(assign, nonatomic)CGFloat wantAFloat;
@property(assign, nonatomic)CGFloat wantRFloat;

@property(assign, nonatomic)CGFloat handleTyreRatio;
@property(assign, nonatomic)CGFloat handleHubRatio;

@property(assign, nonatomic)CGFloat nowPrmtD;
@property(assign, nonatomic)CGFloat wantPrmtD;

@property(strong, nonatomic)NSArray *nowArray;
@property(strong, nonatomic)NSArray *wantArray;


// Boolean
@property(assign, nonatomic)BOOL isOffseted;
@property(strong, nonatomic)UISwipeGestureRecognizer *fingerUpSwipeGR;
@property(strong, nonatomic)UISwipeGestureRecognizer *fingerDownSwipeGR;
@property(strong, nonatomic)UITapGestureRecognizer *prmtTapGR;

@end


@implementation MainViewController
@synthesize managedObjectContext = _managedObjectContext;
@synthesize tyreView;
@synthesize operView;
@synthesize prmtView;
@synthesize buttonView;
@synthesize switchBtn, wikiBtn, otherBtn;
//background view
@synthesize tyreBgView;
//value
@synthesize nowWFloat;
@synthesize nowAFloat;
@synthesize nowRFloat;
@synthesize wantWFloat;
@synthesize wantAFloat;
@synthesize wantRFloat;

@synthesize handleTyreRatio;
@synthesize handleHubRatio;

@synthesize nowPrmtD;
@synthesize wantPrmtD;

@synthesize fingerUpSwipeGR, fingerDownSwipeGR, prmtTapGR;
@synthesize nowArray,wantArray;



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}



#define TYRE_X          (320.0f - TYRE_WIDTH)/2
#define TYRE_Y          (IS_IPHONE_5 ? 20.0f : 15.0f)

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self.view setBackgroundColor:BGCOLOR];
    
    //BG View
    self.tyreBgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"tyreView_bg.png"]];
    self.tyreBgView.frame = CGRectMake(0, 0, TOTAL_WIDTH, TYRE_VIEW_HEIGHT+38);
    [self.view addSubview:self.tyreBgView];

    self.tyreView = [[TyreView alloc]initWithFrame:CGRectMake(TYRE_X, TYRE_Y, TYRE_WIDTH, TYRE_HEIGHT)];
    [self.view addSubview:self.tyreView];
    
    self.operView = [[OperationView alloc]initWithFrame:CGRectMake(0, TYRE_VIEW_HEIGHT, TOTAL_WIDTH, OPER_VIEW_HEIGHT)];
    self.operView.delegate = self;
    [self.view addSubview:self.operView];
    
    CGFloat PRMTY_IN_MAINVIEW = IS_IPHONE_5 ? TYRE_VIEW_HEIGHT+OPER_VIEW_HEIGHT : TYRE_VIEW_HEIGHT+OPER_VIEW_HEIGHT-10 ;
    self.prmtView = [[ParameterView alloc]initWithFrame:CGRectMake(0, PRMTY_IN_MAINVIEW, TOTAL_WIDTH, PRMT_VIEW_HEIGHT)];
    [self.view addSubview:self.prmtView];
    
    // swipe up and down
    self.fingerUpSwipeGR = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleFingerSwipe:)];
    self.fingerUpSwipeGR.direction = UISwipeGestureRecognizerDirectionUp;
    self.fingerUpSwipeGR.numberOfTouchesRequired = 1;
    
    self.fingerDownSwipeGR = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleFingerSwipe:)];
    self.fingerDownSwipeGR.direction = UISwipeGestureRecognizerDirectionDown;
    self.fingerDownSwipeGR.numberOfTouchesRequired = 1;
    
    self.prmtTapGR = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(checkAndMoveViews)];
    self.prmtTapGR.numberOfTapsRequired = 1;
    self.prmtTapGR.numberOfTouchesRequired = 1;
    self.isOffseted = NO;
    
    self.nowArray   = [[NSArray alloc]init];
    self.wantArray  = [[NSArray alloc]init];
    

    // three button bottom
//    [self initButtonView];
    
    [self switchAction];

}

/*
// init button view
- (void)initButtonView
{
    self.buttonView = [[UIView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height - NAV_BAR_HEIGHT -BUTTON_VIEW_HEIGHT, TOTAL_WIDTH, BUTTON_VIEW_HEIGHT)];
    UIImageView *bg = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, TOTAL_WIDTH, BUTTON_VIEW_HEIGHT)];
    [bg setImage:[UIImage imageNamed:@"btnView_bg.png"]];

    // switch
    self.switchBtn = [ColoredButton buttonWithType:UIButtonTypeCustom];
    self.switchBtn.frame= CGRectMake(0, 0, TOTAL_WIDTH/3, BUTTON_VIEW_HEIGHT);
    [self.switchBtn setTitle:[self appDelegate].curSystem forState:UIControlStateNormal];
    [self.switchBtn addTarget:self action:@selector(switchAction) forControlEvents:UIControlEventTouchUpInside];
    
    // wiki
    self.wikiBtn = [ColoredButton buttonWithType:UIButtonTypeCustom];
    self.wikiBtn.frame= CGRectMake(TOTAL_WIDTH/3, 0, TOTAL_WIDTH/3, BUTTON_VIEW_HEIGHT);
    [self.wikiBtn setTitle:T(@"WIKI") forState:UIControlStateNormal];
    [self.wikiBtn addTarget:self action:@selector(wikiAction) forControlEvents:UIControlEventTouchUpInside];
    
    // other
    self.otherBtn = [ColoredButton buttonWithType:UIButtonTypeCustom];
    self.otherBtn.frame= CGRectMake(TOTAL_WIDTH/3*2, 0, TOTAL_WIDTH/3, BUTTON_VIEW_HEIGHT);
    [self.otherBtn setTitle:T(@"OTHER") forState:UIControlStateNormal];
    [self.otherBtn addTarget:self action:@selector(otherAction) forControlEvents:UIControlEventTouchUpInside];
    
    //
    [self.buttonView addSubview:bg];
    [self.buttonView addSubview:self.switchBtn];
    [self.buttonView addSubview:self.wikiBtn];
    [self.buttonView addSubview:self.otherBtn];
    [self.view addSubview:self.buttonView];

}
*/
#pragma mark - bottom button actions

- (void)switchAction
{
    // first change now and get now base
    self.wantArray = [self calculationWithW:self.wantWFloat
                                       andA:self.wantAFloat
                                       andR:self.wantRFloat
                                    andType:@"want"];
    
    // calculationWithW 会改变轮胎尺寸 所以需要后设置 now
    self.nowArray = [self calculationWithW:self.nowWFloat
                                      andA:self.nowAFloat
                                      andR:self.nowRFloat
                                   andType:@"now"];
    
    [self.prmtView changeNowPrmt:self.nowArray];
    [self.prmtView changeWantPrmt:self.wantArray];

    [self.prmtView refreshPrmtView:[self appDelegate].curSystem];

}

- (void)wikiAction
{
    KBViewController *controller = [[KBViewController alloc]initWithNibName:nil
                                                                     bundle:nil];
    [self.navigationController pushViewController:controller animated:YES];
    
}

- (void)otherAction
{
    OtherViewController *controller = [[OtherViewController alloc]initWithNibName:nil
                                                                           bundle:nil];
    [self.navigationController pushViewController:controller animated:YES];
}




///////////////////////////
// 滑动参数
- (void)handleFingerSwipe:(UISwipeGestureRecognizer *)sender
{
    if ( sender.direction == UISwipeGestureRecognizerDirectionDown )
    {
        NSLog(@" *** SWIPE DOWN ***");
        if (self.isOffseted == YES) {
            [self checkAndMoveViews];
        }
    }
       
    if ( sender.direction == UISwipeGestureRecognizerDirectionUp )
    {
        NSLog(@" *** SWIPE UP ***");
        if(self.isOffseted == NO){
            [self checkAndMoveViews];
        }
    }
    
}

// 点击参数
//- (void)handlePrmtTap:(UITapGestureRecognizer *)paramSender
- (void)checkAndMoveViews
{
    CGFloat Yoffset;

    if (self.isOffseted) {
        if (IS_IPHONE_5) {
            Yoffset = 120;
        }else{
            Yoffset = 180;
        }
        [self moveYOffest:Yoffset andDelay:0.10 withView:self.tyreView];
        [self moveYOffest:Yoffset andDelay:0.10 withView:self.tyreBgView];
        [self moveYOffest:Yoffset andDelay:0.05 withView:self.operView];
        [self moveYOffest:Yoffset andDelay:0.0 withView:self.prmtView];
        self.isOffseted = NO;
    }else{
        if (IS_IPHONE_5) {
            Yoffset = -120;
        }else{
            Yoffset = -180;
        }
        [self moveYOffest:Yoffset andDelay:0.0 withView:self.tyreView];
        [self moveYOffest:Yoffset andDelay:0.0 withView:self.tyreBgView];
        [self moveYOffest:Yoffset andDelay:0.05 withView:self.operView];
        [self moveYOffest:Yoffset andDelay:0.10 withView:self.prmtView];
        self.isOffseted = YES;
    }
}

- (void)moveYOffest:(CGFloat)offset
           andDelay:(CGFloat)delay
           withView:(UIView *)targetView
{
    CGRect rect = targetView.frame;
    
    rect.origin.y = rect.origin.y + offset ;
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.35];
    [UIView setAnimationDelay:delay];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    
    targetView.frame = rect;
    
    [UIView commitAnimations];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.prmtView addGestureRecognizer:self.prmtTapGR];
    [self.view addGestureRecognizer:self.fingerUpSwipeGR];
    [self.view addGestureRecognizer:self.fingerDownSwipeGR];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//////////////////////////////////////////////////////////////////////
// delegate
//////////////////////////////////////////////////////////////////////

// 锁定当前的轮胎 1.主动锁定时候 2.调整想要的时候
- (void)lockNowTyre
{
    [self.tyreView lockNowTyreRatio:self.handleTyreRatio
                        andHubRatio:self.handleHubRatio];
}
// 解锁当前的轮胎 1.主动解锁
- (void)unlockNowTyre
{
    [self.tyreView unlockNowTyre];
}


///////////////////////////////////////////////////////////////////
// 计算
///////////////////////////////////////////////////////////////////

- (NSArray *)calculationWithW:(CGFloat)wFloat
                         andA:(CGFloat)AFloat
                         andR:(CGFloat)RFloat
                      andType:(NSString *)type
{
    NSMutableArray *resultArray = [[NSMutableArray alloc]init];
    
    // 侧壁
    CGFloat sidewall = wFloat * AFloat / 100 ;
    
    // 直径
    CGFloat diameter = sidewall * 2 + RFloat * IN_MM ;
//    NSLog(@"diameter %.2f",diameter);
    
    // 半径
    CGFloat radius = diameter / 2;
    
    // 周长
    CGFloat circumference = diameter * M_PI;
    
    // 圈数
    CGFloat rotations = 0.f;
    // 速度差距
    CGFloat speedo = 0.f;
    CGFloat speed = 0.f;
    
    NSLog(@"calculationWithW switchAction: %@",[self appDelegate].curSystem );

    if ([[self appDelegate].curSystem isEqualToString:UKSYS]) {
        sidewall    = sidewall / IN_MM;
        radius      = radius / IN_MM;
        diameter    = diameter / IN_MM;
        circumference = circumference / IN_MM;
        rotations   = 63360  / circumference;
        self.handleHubRatio = RFloat / HUB_DIA_BASE * IN_MM;
        self.handleTyreRatio = diameter / TYRE_DIA_BASE *IN_MM;

    }else if ([[self appDelegate].curSystem isEqualToString:USSYS]){
        rotations   = 1000000  / circumference;
        self.handleHubRatio = RFloat * IN_MM / HUB_DIA_BASE;
        self.handleTyreRatio = diameter / TYRE_DIA_BASE;
    }
    
    
    [resultArray addObject:FLOAT(sidewall)];
    [resultArray addObject:FLOAT(radius)];
    [resultArray addObject:FLOAT(diameter)];
    [resultArray addObject:FLOAT(circumference)];
    [resultArray addObject:FLOAT(rotations)];

    
    [self.tyreView changeTyreRatio:self.handleTyreRatio];
    [self.tyreView changeHubRatio:self.handleHubRatio];
//    NSLog(@"==tyre %f, hub %f",self.handleTyreRatio, self.handleHubRatio);

    // action
    if ([type isEqualToString:@"now"]) {
        self.nowPrmtD = circumference;
//        NSLog(@"==tyre %f, hub %f",self.handleTyreRatio, self.handleHubRatio);
        
    }else if ([type isEqualToString:@"want"]){
        self.wantPrmtD = circumference;
    }
    
    if (self.nowPrmtD > 0 && self.wantPrmtD > 0 && [type isEqualToString:@"want"]) {
        NSLog(@"now: %f want: %f", self.nowPrmtD,self.wantPrmtD);

        speedo  = self.wantPrmtD / self.nowPrmtD * 100;
        NSLog(@"==speedo %f",speedo);
        
        if ([[self appDelegate].curSystem isEqualToString:UKSYS]) {
            speed   = 60.0f * self.wantPrmtD / self.nowPrmtD ;
        }else if ([[self appDelegate].curSystem isEqualToString:USSYS]){
            speed   = 100.0f * self.wantPrmtD / self.nowPrmtD ;
        }
    }
    
    [resultArray addObject:FLOAT(speedo)];
    [resultArray addObject:FLOAT(speed)];

    return resultArray;
}

- (void)passStringValue:(NSString *)value andIndex:(NSUInteger)index
{
    switch (index) {
        case NOWW_INDEX:
            self.nowWFloat = value.floatValue;
            break;
        case NOWA_INDEX:
            self.nowAFloat = value.floatValue;
            break;
        case NOWR_INDEX:
            self.nowRFloat = value.floatValue;
            break;
        case WANTW_INDEX:
            self.wantWFloat = value.floatValue;
            break;
        case WANTA_INDEX:
            self.wantAFloat = value.floatValue;
            break;
        case WANTR_INDEX:
            self.wantRFloat = value.floatValue;
            break;
        default:
            break;
    }
    
    NSLog(@"passStringValue %@ %d",value,index);
    
    // which index to refresh prmt data
    if (index == NOWW_INDEX || index == NOWA_INDEX || index == NOWR_INDEX) {
        
        self.nowArray = [self calculationWithW:self.nowWFloat
                                          andA:self.nowAFloat
                                          andR:self.nowRFloat
                                       andType:@"now"];
        
        [self.prmtView changeNowPrmt:self.nowArray];
        
        
    }else if(index == WANTW_INDEX || index == WANTA_INDEX || index == WANTR_INDEX){
        
        self.wantArray = [self calculationWithW:self.wantWFloat
                                           andA:self.wantAFloat
                                           andR:self.wantRFloat
                                        andType:@"want"];
        
        [self.prmtView changeWantPrmt:self.wantArray];
    }
}

- (AppDelegate *)appDelegate
{
	return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}


@end
