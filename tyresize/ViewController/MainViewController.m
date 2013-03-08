//
//  MainViewController.m
//  tyresize
//
//  Created by meng qian on 13-3-8.
//  Copyright (c) 2013年 thinktube. All rights reserved.
//

#import "MainViewController.h"
#import "KBViewController.h"
@interface MainViewController ()
@property(strong,nonatomic)UIImageView *tempImage;
@property (nonatomic, strong) UIButton *button1;

@end

@implementation MainViewController
@synthesize managedObjectContext = _managedObjectContext;
@synthesize tempImage;

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
	// Do any additional setup after loading the view.
    self.title = @"轮胎计算器";
    self.tempImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"tyresize2_zh.png"]];
    self.tempImage.frame = self.view.bounds;
    [self.view addSubview:self.tempImage];
    
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
    self.tempImage.frame = CGRectMake(0, 0, 320, 480);
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

@end
