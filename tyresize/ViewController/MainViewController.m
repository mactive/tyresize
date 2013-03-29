//
//  MainViewController.m
//  tyresize
//
//  Created by meng qian on 13-3-8.
//  Copyright (c) 2013年 thinktube. All rights reserved.
//

#import "MainViewController.h"
#import "KBViewController.h"
#import "AppDelegate.h"
#import "OperationView.h"
#import "ParameterView.h"
#import "TyreView.h"

@interface MainViewController ()
// tyre view
@property(strong, nonatomic)TyreView *tyreView;
@property(strong, nonatomic)OperationView *operView;
@property(strong, nonatomic)ParameterView *prmtView;
@property(strong, nonatomic)UIView *buttonView;
@property(strong, nonatomic)UIButton *switchBtn;
@property(strong, nonatomic)UIButton *wikiBtn;
@property(strong, nonatomic)UIButton *otherBtn;
// main label
@property(strong, nonatomic)UILabel *leftTitle;
@property(strong, nonatomic)UILabel *rightTitle;

// value
@property(assign, nonatomic)CGFloat nowWFloat;
@property(assign, nonatomic)CGFloat nowAFloat;
@property(assign, nonatomic)CGFloat nowRFloat;
@property(assign, nonatomic)CGFloat wantWFloat;
@property(assign, nonatomic)CGFloat wantAFloat;
@property(assign, nonatomic)CGFloat wantRFloat;

@property(assign, nonatomic)CGFloat handleTyreRatio;
@property(assign, nonatomic)CGFloat handleHubRatio;

@property(assign, nonatomic)CGFloat nowPrmtA;
@property(assign, nonatomic)CGFloat nowPrmtB;
@property(assign, nonatomic)CGFloat nowPrmtC;
@property(assign, nonatomic)CGFloat nowPrmtD;
@property(assign, nonatomic)CGFloat nowPrmtE;
@property(assign, nonatomic)CGFloat nowPrmtF;

@property(assign, nonatomic)CGFloat wantPrmtA;
@property(assign, nonatomic)CGFloat wantPrmtB;
@property(assign, nonatomic)CGFloat wantPrmtC;
@property(assign, nonatomic)CGFloat wantPrmtD;
@property(assign, nonatomic)CGFloat wantPrmtE;
@property(assign, nonatomic)CGFloat wantPrmtF;

// Boolean
@property(assign, nonatomic)BOOL isOffseted;
@property(strong, nonatomic)UISwipeGestureRecognizer *tyreSwipeGR;
@property(strong, nonatomic)UISwipeGestureRecognizer *prmtSwipeGR;
@property(strong, nonatomic)UITapGestureRecognizer *prmtTapGR;

@end


@implementation MainViewController
@synthesize managedObjectContext = _managedObjectContext;
@synthesize tyreView;
@synthesize operView;
@synthesize prmtView;
@synthesize buttonView;
@synthesize switchBtn, wikiBtn, otherBtn;
//value
@synthesize nowWFloat;
@synthesize nowAFloat;
@synthesize nowRFloat;
@synthesize wantWFloat;
@synthesize wantAFloat;
@synthesize wantRFloat;

@synthesize handleTyreRatio;
@synthesize handleHubRatio;

@synthesize nowPrmtA;
@synthesize nowPrmtB;
@synthesize nowPrmtC;
@synthesize nowPrmtD;
@synthesize nowPrmtE;
@synthesize nowPrmtF;

@synthesize wantPrmtA;
@synthesize wantPrmtB;
@synthesize wantPrmtC;
@synthesize wantPrmtD;
@synthesize wantPrmtE;
@synthesize wantPrmtF;

@synthesize tyreSwipeGR, prmtSwipeGR, prmtTapGR;



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

#define TYRE_X            (320.0f - TYRE_WIDTH)/2
#define TYRE_Y            20.0f

#define OPER_HEIGHT         160.0f

#define PRMT_HEIGHT         230.0f
#define PRMT_LITE_HEIGHT    50.0f
#define BUTTON_VIEW_HEIGHT  44.0f

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.title = T(@"tyresize");
    
    self.tyreView = [[TyreView alloc]initWithFrame:CGRectMake(TYRE_X, TYRE_Y, TYRE_WIDTH, TYRE_HEIGHT)];
    [self.view addSubview:self.tyreView];
    
    self.prmtView = [[ParameterView alloc]initWithFrame:CGRectMake(0, TYRE_Y+TYRE_HEIGHT+OPER_HEIGHT, TOTAL_WIDTH, PRMT_HEIGHT)];
    [self.view addSubview:self.prmtView];
    
    self.operView = [[OperationView alloc]initWithFrame:CGRectMake(0, TYRE_Y+TYRE_HEIGHT, TOTAL_WIDTH, OPER_HEIGHT)];
    self.operView.delegate = self;
    [self.view addSubview:self.operView];
    
    [self initButtonView];
    
    self.tyreSwipeGR = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleTyreSwipe:)];
    self.tyreSwipeGR.direction = UISwipeGestureRecognizerDirectionDown;
    self.tyreSwipeGR.numberOfTouchesRequired = 1;
    
    self.prmtTapGR = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handlePrmtTap:)];
    self.prmtTapGR.numberOfTapsRequired = 1;
    self.prmtTapGR.numberOfTouchesRequired = 1;
    self.isOffseted = NO;
    
}

// init button view
- (void)initButtonView
{
    self.buttonView = [[UIView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height-BUTTON_VIEW_HEIGHT, TOTAL_WIDTH, BUTTON_VIEW_HEIGHT)];
    UIImageView *bg = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, TOTAL_WIDTH, BUTTON_VIEW_HEIGHT)];
    [bg setImage:[UIImage imageNamed:@"bottom_bg.png"]];

    // switch
    self.switchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.switchBtn.frame= CGRectMake(0, 0, TOTAL_WIDTH/3, BUTTON_VIEW_HEIGHT);
    self.switchBtn.titleLabel.font = CUSTOMFONT;
    [self.switchBtn setTitle:T(@"Metric") forState:UIControlStateNormal];
    [self.switchBtn setTitleColor:GRAYCOLOR forState:UIControlStateNormal];
    [self.switchBtn setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    [self.switchBtn setBackgroundColor:[UIColor clearColor]];
    [self.switchBtn addTarget:self action:@selector(switchAction) forControlEvents:UIControlEventTouchUpInside];
    
    // wiki
    self.wikiBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.wikiBtn.frame= CGRectMake(TOTAL_WIDTH/3, 0, TOTAL_WIDTH/3, BUTTON_VIEW_HEIGHT);
    self.wikiBtn.titleLabel.font = CUSTOMFONT;
    [self.wikiBtn setTitle:T(@"Wiki") forState:UIControlStateNormal];
    [self.wikiBtn setTitleColor:GRAYCOLOR forState:UIControlStateNormal];
    [self.wikiBtn setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    [self.wikiBtn setBackgroundColor:[UIColor clearColor]];
    [self.wikiBtn addTarget:self action:@selector(wikiAction) forControlEvents:UIControlEventTouchUpInside];
    
    // other
    self.otherBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.otherBtn.frame= CGRectMake(TOTAL_WIDTH/3*2, 0, TOTAL_WIDTH/3, BUTTON_VIEW_HEIGHT);
    self.otherBtn.titleLabel.font = CUSTOMFONT;
    [self.otherBtn setTitle:T(@"Other") forState:UIControlStateNormal];
    [self.otherBtn setTitleColor:GRAYCOLOR forState:UIControlStateNormal];
    [self.otherBtn setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    [self.otherBtn setBackgroundColor:[UIColor clearColor]];
    [self.otherBtn addTarget:self action:@selector(otherAction) forControlEvents:UIControlEventTouchUpInside];
    
    //
    [self.buttonView addSubview:bg];
    [self.buttonView addSubview:self.switchBtn];
    [self.buttonView addSubview:self.wikiBtn];
    [self.buttonView addSubview:self.otherBtn];
    [self.view addSubview:self.buttonView];

}
#pragma mark - bottom button actions
- (void)switchAction
{
    NSLog(@"switchAction");
}

- (void)wikiAction
{
    KBViewController *controller = [[KBViewController alloc]initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:controller animated:YES];
    
}

- (void)otherAction
{
    NSLog(@"otherAction");
}



///////////////////////////
// 点击参数
- (void)handlePrmtTap:(UITapGestureRecognizer *)paramSender
{
    if (self.isOffseted) {
        CGFloat Yoffset = 150;
        [self moveYOffest:Yoffset andDelay:0.10 withView:self.tyreView];
        [self moveYOffest:Yoffset andDelay:0.05 withView:self.operView];
        [self moveYOffest:Yoffset andDelay:0.0 withView:self.prmtView];
        self.isOffseted = NO;
    }else{
        CGFloat Yoffset = -150;
        [self moveYOffest:Yoffset andDelay:0.0 withView:self.tyreView];
        [self moveYOffest:Yoffset andDelay:0.05 withView:self.operView];
        [self moveYOffest:Yoffset andDelay:0.10 withView:self.prmtView];
        self.isOffseted = YES;
    }
    
    
}

- (void)moveYOffest:(CGFloat)offset andDelay:(CGFloat)delay withView:(UIView *)targetView
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
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    
    [self.prmtView addGestureRecognizer:self.prmtTapGR];
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];

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
    [self.tyreView lockNowTyreRatio:self.handleTyreRatio andHubRatio:self.handleHubRatio];
}
// 解锁当前的轮胎 1.主动解锁
- (void)unlockNowTyre
{
    [self.tyreView unlockNowTyre];
}


///////////////////////////////////////////////////////////////////
// 计算
///////////////////////////////////////////////////////////////////

- (NSArray *)calculationWithW:(CGFloat)wFloat andA:(CGFloat)AFloat andR:(CGFloat)RFloat andType:(NSString *)type
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
    CGFloat rotations = 1000000  / circumference;
    
#warning 这里需要存两边的值然后比较
    // 速度差距
    CGFloat speedo = 0.f;
    CGFloat speed = 0.f;
    
    [resultArray addObject:FLOAT(sidewall)];
    [resultArray addObject:FLOAT(radius)];
    [resultArray addObject:FLOAT(diameter)];
    [resultArray addObject:FLOAT(circumference)];
    [resultArray addObject:FLOAT(rotations)];
    [resultArray addObject:FLOAT(speedo)];
    [resultArray addObject:FLOAT(speed)];
    
    self.handleTyreRatio = diameter / TYRE_DIA_BASE;
    self.handleHubRatio = RFloat * IN_MM / HUB_DIA_BASE;
    
    // action
    if ([type isEqualToString:@"now"]) {
        
        [self.tyreView changeTyreRatio:self.handleTyreRatio];
        [self.tyreView changeHubRatio:self.handleHubRatio];
        
        NSLog(@"==tyre %f, hub %f",self.handleTyreRatio, self.handleHubRatio);
                
    }else if ([type isEqualToString:@"want"]){
        
        [self.tyreView changeTyreRatio:self.handleTyreRatio];
        [self.tyreView changeHubRatio:self.handleHubRatio];
        
        NSLog(@"==tyre %f, hub %f",self.handleTyreRatio, self.handleHubRatio);
    }

    
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
        [self.prmtView changeNowPrmt:[self calculationWithW:self.nowWFloat andA:self.nowAFloat andR:self.nowRFloat andType:@"now"]];
    }else if(index == WANTW_INDEX || index == WANTA_INDEX || index == WANTR_INDEX){
        [self.prmtView changeWantPrmt:[self calculationWithW:self.wantWFloat andA:self.wantAFloat andR:self.wantRFloat andType:@"want"]];
    }
}

- (AppDelegate *)appDelegate
{
	return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}


@end
