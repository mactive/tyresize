//
//  KBViewController.m
//  tyresize
//
//  Created by meng qian on 13-3-8.
//  Copyright (c) 2013年 thinktube. All rights reserved.
//

#import "KBViewController.h"

@interface KBViewController ()
@property(strong, nonatomic)UIImageView *tempImage;
@property(strong, nonatomic)UIButton *backButton;
@property(strong, nonatomic)UIButton *button1;
@property(strong, nonatomic)UIButton *button2;
@property(strong, nonatomic)UIButton *button3;
@property(strong, nonatomic)UIButton *button4;
@property(strong, nonatomic)UIButton *button5;
@property(strong, nonatomic)UIButton *button6;
@end

@implementation KBViewController
@synthesize tempImage;
@synthesize backButton;
@synthesize button1, button2, button3, button4, button5, button6;

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
    self.title = @"轮胎知识";
    self.tempImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"tyresize.png"]];
    self.tempImage.frame = CGRectMake(0, 0, 320, 416);
    [self.view addSubview:self.tempImage];
    
    self.backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.backButton setFrame:CGRectMake(15, 15, 60, 28)];
    [self.backButton setTitle:T(@"back") forState:UIControlStateNormal];
    [self.backButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.backButton setTitleEdgeInsets:UIEdgeInsetsMake(2, 10, 0, 0)];
    [self.backButton.titleLabel setFont:CUSTOMFONT];
    [self.backButton setBackgroundImage:[UIImage imageNamed:@"back_button_bg.png"] forState:UIControlStateNormal];
    [self.backButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.backButton];
    
    
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)backAction
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
