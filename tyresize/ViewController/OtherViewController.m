//
//  OtherViewController.m
//  tyresize
//
//  Created by mac on 13-4-29.
//  Copyright (c) 2013年 thinktube. All rights reserved.
//

#import "OtherViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "GCPagedScrollView.h"
#import "ScrollCellUIView.h"


@interface OtherViewController ()<UIScrollViewAccessibilityDelegate>
@property(strong, nonatomic)GCPagedScrollView *scrollView;
@property(strong, nonatomic)NSArray *scrollTitleArray;
@property(strong, nonatomic)NSArray *scrollImageArray;

@property(strong, nonatomic)UIView *actionView;

@end


#define GAP_HEIGHT  18.0f


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
    
    CGRect scrollFrame = CGRectMake(0, 0, TOTAL_WIDTH, TYRE_VIEW_HEIGHT + GAP_HEIGHT*2 );
    self.scrollView = [[GCPagedScrollView alloc] initWithFrame:scrollFrame];
    self.scrollView.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
    self.scrollView.backgroundColor = BGCOLOR;
    self.scrollView.minimumZoomScale = 1; //最小到0.3倍
    self.scrollView.maximumZoomScale = 3.0; //最大到3倍
    self.scrollView.clipsToBounds = YES;
    self.scrollView.scrollEnabled = YES;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.delegate = self;
    [self.scrollView removeAllContentSubviews];
    
    NSLog(@"scrollFrame: %@",NSStringFromCGRect(scrollFrame));

    
    for (int i = 0 ; i < [self.scrollImageArray count]; i++) {
        ScrollCellUIView *page = [[ScrollCellUIView alloc]
                                  initWithFrame:CGRectMake(0, 0, 320, scrollFrame.size.height)];
        page.title = [self.scrollTitleArray objectAtIndex:i];
        page.bgImage = [UIImage imageNamed:[self.scrollImageArray objectAtIndex:i]];
//        CGFloat red = i * 50.0f;
//        NSLog(@"red %f",red);
//        page.backgroundColor = [UIColor colorWithRed:red green:100 blue:100 alpha:1];
        
        [self.scrollView addContentSubview:page];
        
//        [self.scrollView addSubview:page];
    }

    [self.view addSubview:self.scrollView];

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
