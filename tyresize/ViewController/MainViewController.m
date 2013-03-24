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
@property(strong, nonatomic) UIButton *button1;
// tyre view
@property(strong, nonatomic)TyreView *tyreView;
@property(strong, nonatomic)OperationView *operView;
@property(strong, nonatomic)ParameterView *prmtView;
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

@property(assign, nonatomic)CGFloat nowTyreRatio;
@property(assign, nonatomic)CGFloat nowHubRatio;
@property(assign, nonatomic)CGFloat wantTyreRatio;
@property(assign, nonatomic)CGFloat wantHubRatio;

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

@end


@implementation MainViewController
@synthesize managedObjectContext = _managedObjectContext;
@synthesize button1;
@synthesize tyreView;
@synthesize operView;
@synthesize prmtView;
//value
@synthesize nowWFloat;
@synthesize nowAFloat;
@synthesize nowRFloat;
@synthesize wantWFloat;
@synthesize wantAFloat;
@synthesize wantRFloat;

@synthesize nowTyreRatio;
@synthesize nowHubRatio;
@synthesize wantTyreRatio;
@synthesize wantHubRatio;

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
#define PRMT_LITE_HEIGHT    75.0f

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.title = T(@"tyresize");
    
    self.tyreView = [[TyreView alloc]initWithFrame:CGRectMake(TYRE_X, TYRE_Y, TYRE_WIDTH, TYRE_HEIGHT)];
    [self.view addSubview:self.tyreView];
    
    self.operView = [[OperationView alloc]initWithFrame:CGRectMake(0, TYRE_Y+TYRE_HEIGHT, TOTAL_WIDTH, OPER_HEIGHT)];
    [self.view addSubview:self.operView];
    
    self.prmtView = [[ParameterView alloc]initWithFrame:CGRectMake(0, TYRE_Y+TYRE_HEIGHT+OPER_HEIGHT, TOTAL_WIDTH, PRMT_LITE_HEIGHT)];
    [self.view addSubview:self.prmtView];
    
    //button1
    self.button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    self.button1.frame = CGRectZero;
    [self.button1 setTitle:@"" forState:UIControlStateNormal];
    self.button1.alpha = 1;
    self.button1.tag = 0;
    [self.view addSubview:self.button1];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [self.button1 setFrame:CGRectMake(90, 50, 135, 160)];
    [self.button1 addTarget:self action:@selector(linkAction:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];

}

- (void)linkAction:(UIButton *)sender
{
    KBViewController *controller = [[KBViewController alloc]initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:controller animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//////////////////////////////////////////////////////////////////////
// delegate
//////////////////////////////////////////////////////////////////////

- (NSNumber *)calculation
{
    CGFloat nowW = self.nowWFloat;
    CGFloat nowA = self.nowAFloat;
    CGFloat nowR = self.nowRFloat;
    
    CGFloat tyreHeightMM = nowW * nowA / 100 * 2 + nowR * IN_MM ;
    NSLog(@"%.2f",tyreHeightMM);
    return FLOAT(tyreHeightMM);
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
    NSLog(@"%@ %d",value,index);
    [self calculation];
    
}

- (AppDelegate *)appDelegate
{
	return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}


@end
