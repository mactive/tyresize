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

@interface MainViewController ()
@property(nonatomic, strong) UIButton *button1;

// tyre view
@property(strong, nonatomic)OperationView *tyreView;

@property(strong, nonatomic)ParameterView *prmtView;

// main label
@property(strong, nonatomic)UILabel *leftTitle;
@property(strong, nonatomic)UILabel *rightTitle;


@end


@implementation MainViewController
@synthesize managedObjectContext = _managedObjectContext;
@synthesize button1;
@synthesize tyreView;
@synthesize prmtView;



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
#define OFFSET_X    (320.0f - TYRE_WIDTH)/2
#define OFFSET_Y    20.0f
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.title = T(@"tyresize");
    
    self.tyreView = [[OperationView alloc]initWithFrame:CGRectMake(OFFSET_X, OFFSET_Y, TYRE_WIDTH, TYRE_HEIGHT)];
    [self.view addSubview:self.tyreView];
    
    self.prmtView = [[ParameterView alloc]initWithFrame:CGRectMake(0, OFFSET_Y+TYRE_HEIGHT, 320, 320)];
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

- (AppDelegate *)appDelegate
{
	return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}


@end
