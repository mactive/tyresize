//
//  OtherViewController.m
//  tyresize
//
//  Created by mac on 13-4-29.
//  Copyright (c) 2013年 thinktube. All rights reserved.
//

#import "OtherViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface OtherViewController ()
@property(strong, nonatomic)UIButton *backButton;
@property(strong, nonatomic)UIView *detailView;
@property(strong, nonatomic)UILabel *detailTitle;
@property(strong, nonatomic)UILabel *detailContent;

@end

@implementation OtherViewController

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
    self.backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.backButton setFrame:CGRectMake(15, 15, 60, 28)];
    [self.backButton setTitle:T(@"back") forState:UIControlStateNormal];
    [self.backButton setTitleColor:DARKCOLOR forState:UIControlStateNormal];
    [self.backButton setTitleEdgeInsets:UIEdgeInsetsMake(2, 10, 0, 0)];
    [self.backButton.titleLabel setFont:CUSTOMFONT];
    [self.backButton setBackgroundImage:[UIImage imageNamed:@"back_button_bg.png"] forState:UIControlStateNormal];
    [self.backButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.backButton];
    
    // line
    UIImageView *lineView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 80, TOTAL_WIDTH, 1)];
    [lineView setImage:[UIImage imageNamed:@"green_line.png"]];
    [self.view addSubview:lineView];
    
    [self initDetailView];
}

#define DETAIL_WIDTH    280.0f
#define DETAIL_HEIGHT   260.0f
#define DETAIL_X        20.0f
#define SLIDER_NOTE_HEIGHT 40.0f

- (void)initDetailView
{
    self.detailView = [[UIView alloc]initWithFrame:
                       CGRectMake(DETAIL_X, (self.view.frame.size.height - DETAIL_HEIGHT)/2, DETAIL_WIDTH, DETAIL_HEIGHT)];
    self.detailView.backgroundColor = BGCOLOR;

    
    // detailTitle
    self.detailTitle = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, DETAIL_WIDTH, 80)];
    self.detailTitle.backgroundColor = [UIColor clearColor];
    self.detailTitle.textAlignment = NSTextAlignmentLeft;
    self.detailTitle.font = LITTLECUSTOMFONT;
    self.detailTitle.textColor = GREENCOLOR;
    self.detailTitle.numberOfLines = 0;
    self.detailTitle.text = T(@"We are a interactive Team in Beijing, China.\nFocus on iOS App and Web App");
    
//    T(@"With tyre wiki you can know the detail of parameter.");
//    T(@"Click list data to view more 5 lines.");
//    T(@"Lock your tyre first and change you want.");
//    T(@"Metric and Imperial system switch.");
//    T(@"The most Easy-to-use tyre calculator,and UI friendly.");
    
    
    
    // detail content
    UIImageView *imageA = [[UIImageView alloc]initWithFrame:CGRectMake(0, 100, 40, 40)];
    [imageA setImage:[UIImage imageNamed:@"mactive.png"]];
    
    UILabel *labelA = [[UILabel alloc]initWithFrame:CGRectMake(70, 100, 200, 40)];
    labelA.textColor = GREENCOLOR;
    labelA.font = TINYCUSTOMFONT;
    labelA.numberOfLines = 0;
    labelA.backgroundColor = [UIColor clearColor];
    labelA.text = T(@"Mactive Meng\nhttp://about.me/mactive");
    
    UIImageView *imageB = [[UIImageView alloc]initWithFrame:CGRectMake(0, 200, 40, 40)];
    [imageB setImage:[UIImage imageNamed:@"leonqin.png"]];
    
    UILabel *labelB = [[UILabel alloc]initWithFrame:CGRectMake(70, 200, 200, 40)];
    labelB.textColor = GREENCOLOR;
    labelB.font = TINYCUSTOMFONT;
    labelB.numberOfLines = 0;
    labelB.backgroundColor = [UIColor clearColor];
    labelB.text = T(@"Leon Qin\nhttp://dribbble.com/Leonqin");
    
    UILabel *titleA = [[UILabel alloc]initWithFrame:CGRectMake(0, 75, 200, 20)];
    titleA.textColor = GREENCOLOR;
    titleA.font = TINYCUSTOMFONT;
    titleA.backgroundColor = [UIColor clearColor];
    titleA.text = T(@"Developer");
    
    UILabel *titleB = [[UILabel alloc]initWithFrame:CGRectMake(0, 175, 200, 20)];
    titleB.textColor = GREENCOLOR;
    titleB.font = TINYCUSTOMFONT;
    titleB.backgroundColor = [UIColor clearColor];
    titleB.text = T(@"Designer");
    
    
    [self.detailView addSubview:self.detailTitle];
    [self.detailView addSubview:imageA];
    [self.detailView addSubview:labelA];
    [self.detailView addSubview:imageB];
    [self.detailView addSubview:labelB];
    [self.detailView addSubview:titleA];
    [self.detailView addSubview:titleB];
    
    [self.view addSubview:self.detailView];
}

- (void)backAction
{
    [self.navigationController popViewControllerAnimated:YES];
}




- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
