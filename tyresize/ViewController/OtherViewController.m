//
//  OtherViewController.m
//  tyresize
//
//  Created by mac on 13-4-29.
//  Copyright (c) 2013年 thinktube. All rights reserved.
//

#import "OtherViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "REPagedScrollView.h"
#import "ScrollCellUIView.h"

@interface OtherViewController ()
@property(strong, nonatomic)REPagedScrollView *scrollView;
@property(strong, nonatomic)NSArray *scrollTitleArray;
@property(strong, nonatomic)NSArray *scrollImageArray;

@property(strong, nonatomic)UIView *actionView;

@end


#define GAP_HEIGHT  0.0f


@implementation OtherViewController

@synthesize scrollView;
@synthesize scrollImageArray, scrollTitleArray;
@synthesize actionView;

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
    
    [self initScrollView];
    
    // line
    UIImageView *lineView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 80, TOTAL_WIDTH, 1)];
    [lineView setImage:[UIImage imageNamed:@"green_line.png"]];
    [self.view addSubview:lineView];
    
    [self initActionView];
    [self initDetailView];
}

- (void)initScrollView{
    
    self.scrollTitleArray = [[NSArray alloc]initWithObjects:
                             T(@"With tyre wiki you can know the detail of parameter."),
                             T(@"Click list data to view more 5 lines."),
                             T(@"Lock your tyre first and change you want."),
                             T(@"Metric and Imperial system switch."),
                             T(@"The most Easy-to-use tyre calculator,and UI friendly."),
                             nil];
    
    self.scrollImageArray = [[NSArray alloc]initWithObjects:
                             @"slider_1.png",
                             @"slider_2.png",
                             @"slider_3.png",
                             @"slider_4.png",
                             @"slider_5.png",
                             nil];
    
    CGRect scrollFrame = CGRectMake(0, 0, TOTAL_WIDTH, TYRE_VIEW_HEIGHT-GAP_HEIGHT);
    self.scrollView = [[REPagedScrollView alloc] initWithFrame:scrollFrame];
    [self.view addSubview:self.scrollView];
    
    for (int i = 0 ; i < [self.scrollImageArray count]; i++) {
        ScrollCellUIView *page = [[ScrollCellUIView alloc] initWithFrame:scrollFrame];
        page.title = [self.scrollTitleArray objectAtIndex:i];
        page.bgImage = [UIImage imageNamed:[self.scrollImageArray objectAtIndex:i]];
        
        [self.scrollView addPage:page];

    }
}


- (void)initActionView
{
    
}

- (void)initDetailView
{

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
