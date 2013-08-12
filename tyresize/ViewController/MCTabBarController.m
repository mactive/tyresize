//
//  MCTabBarController.m
//  tyresize
//
//  Created by mac on 13-8-12.
//  Copyright (c) 2013年 thinktube. All rights reserved.
//

#import "MCTabBarController.h"
#import "ColoredButton.h"
@interface MCTabBarController ()

@property(strong, nonatomic)UIImageView *tabBarView;
@property(strong, nonatomic)ColoredButton *switchBtn;
@property(strong, nonatomic)ColoredButton *wikiBtn;
@property(strong, nonatomic)ColoredButton *otherBtn;

@end

@implementation MCTabBarController

@synthesize tabBarView;
@synthesize switchBtn, wikiBtn, otherBtn;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.tabBar.hidden = YES;

//        [self.tabBar setBackgroundImage:[UIImage imageNamed:@"btnView_bg.png"]];
//        [self.tabBar setFrame:CGRectMake(0, TOTAL_HEIGHT-44, TOTAL_WIDTH, 44)];
//        [self.tabBar setSelectionIndicatorImage:[UIImage imageNamed:@"btnOn_bg.png"]];
        
    }
    return self;
}

- (void)initButtons
{
    self.tabBarView = [[UIImageView alloc]initWithFrame:CGRectMake(0, TOTAL_HEIGHT-44, TOTAL_WIDTH, 44)];
    [self.tabBarView setImage:[UIImage imageNamed:@"btnView_bg.png"]];
    self.tabBarView.userInteractionEnabled = YES;

    [self.view addSubview:self.tabBarView];

    // switch
    self.switchBtn = [ColoredButton buttonWithType:UIButtonTypeCustom];
    self.switchBtn.frame= CGRectMake(0, 0, TOTAL_WIDTH/3, BUTTON_VIEW_HEIGHT);
    [self.switchBtn setTitle:@"dd" forState:UIControlStateNormal];
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
    
    self.switchBtn.tag = 0;
    self.wikiBtn.tag = 0;
    self.otherBtn.tag = 0;
    //
    
    [self.tabBarView addSubview:self.switchBtn];
    [self.tabBarView addSubview:self.wikiBtn];
    [self.tabBarView addSubview:self.otherBtn];
    
}

- (void)changeViewController:(id) sender
{
    UIButton *button = (UIButton *) sender;
    self.selectedIndex = button.tag;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self initButtons];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
