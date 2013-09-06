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
#import "AvatarButton.h"


@interface OtherViewController ()<UIScrollViewAccessibilityDelegate>
@property(strong, nonatomic)GCPagedScrollView *scrollView;
@property(strong, nonatomic)NSArray *scrollTitleArray;
@property(strong, nonatomic)NSArray *scrollImageArray;

@property(strong, nonatomic)UIView *actionView;
@property(strong, nonatomic)AvatarButton *developerAvatar;
@property(strong, nonatomic)AvatarButton *designerAvatar;
@property(strong, nonatomic)AvatarButton *counselorAvatar;
@property(strong, nonatomic)UIView *detailView;

@end


#define GAP_HEIGHT  18.0f
#define DEVELOPER_TAG 0
#define DESIGNER_TAG 1
#define COUNSELOR_TAG 2

@implementation OtherViewController

@synthesize scrollView;
@synthesize scrollImageArray, scrollTitleArray;
@synthesize actionView;
@synthesize developerAvatar, designerAvatar, counselorAvatar;
@synthesize detailView;

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
                                  initWithFrame:scrollFrame];
        page.title = [self.scrollTitleArray objectAtIndex:i];
        page.bgImage = [UIImage imageNamed:[self.scrollImageArray objectAtIndex:i]];
        
        [self.scrollView addContentSubview:page];
        
//        [self.scrollView addSubview:page];
    }

    [self.view addSubview:self.scrollView];
    
}


#define AVATAR_X 15.0f
#define AVATAR_Y 50.0f
#define AVATAR_WIDTH 100.0f
#define AVATAR_HEIGHT 120.0f

- (void)initActionView
{
    self.actionView = [[UIView alloc]initWithFrame:CGRectMake(0, TYRE_VIEW_HEIGHT- GAP_HEIGHT*2, TOTAL_WIDTH, OPER_VIEW_HEIGHT)];
    
    //BG View
    UIImageView *activeBGView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"operView_bg.png"]];
    activeBGView.frame = CGRectMake(0, 0 , TOTAL_WIDTH, OPER_VIEW_HEIGHT);
    [self.actionView addSubview:activeBGView];
    
    // custom button
    // button button slected slect
    // button.iconImage
    // button action
    
    self.developerAvatar = [AvatarButton buttonWithType:UIButtonTypeCustom];
    [self.developerAvatar setFrame:CGRectMake(AVATAR_X, AVATAR_Y, AVATAR_WIDTH, AVATAR_HEIGHT)];
    [self.developerAvatar addTarget:self action:@selector(actionAvatar:) forControlEvents:UIControlEventTouchUpInside];

    [self.developerAvatar setAvatarImage:[UIImage imageNamed:@"mactive_avatar.png"]];
    [self.developerAvatar setIconImage:[UIImage imageNamed:@"developer_icon.png"]];
    [self.developerAvatar setName:T(@"Mactive")];
    [self.developerAvatar setTitle:T(@"Developer")];
    self.developerAvatar.tag = DEVELOPER_TAG;
    
    
    self.designerAvatar = [AvatarButton buttonWithType:UIButtonTypeCustom];
    [self.designerAvatar setFrame:CGRectMake(AVATAR_X+AVATAR_WIDTH, AVATAR_Y, AVATAR_WIDTH, AVATAR_HEIGHT)];
    [self.designerAvatar addTarget:self action:@selector(actionAvatar:) forControlEvents:UIControlEventTouchUpInside];
    [self.designerAvatar setName:T(@"Leon Qin")];
    [self.designerAvatar setTitle:T(@" Designer")];
    [self.designerAvatar setAvatarImage:[UIImage imageNamed:@"leno_avatar.png"]];
    [self.designerAvatar setIconImage:[UIImage imageNamed:@"designer_icon.png"]];
    self.designerAvatar.tag = DESIGNER_TAG;
    
    self.counselorAvatar = [AvatarButton buttonWithType:UIButtonTypeCustom];
    [self.counselorAvatar setFrame:CGRectMake(AVATAR_X+AVATAR_WIDTH*2, AVATAR_Y, AVATAR_WIDTH, AVATAR_HEIGHT)];
    [self.counselorAvatar addTarget:self action:@selector(actionAvatar:) forControlEvents:UIControlEventTouchUpInside];
    [self.counselorAvatar setName:T(@"laofozhu")];
    [self.counselorAvatar setTitle:T(@"Counselor")];
    [self.counselorAvatar setAvatarImage:[UIImage imageNamed:@"kuangwenjun_avatar.png"]];
    [self.counselorAvatar setIconImage:[UIImage imageNamed:@"counselor_icon.png"]];
    self.counselorAvatar.tag = COUNSELOR_TAG;
    
    
    [self.actionView addSubview:self.developerAvatar];
    [self.actionView addSubview:self.designerAvatar];
    [self.actionView addSubview:self.counselorAvatar];
    
    [self.view addSubview:self.actionView];

}

#pragma mark -- init and refresh detail view

- (void)initDetailView
{

}

- (void)refreshDetailViewWithTag:(NSInteger)tag
{
    
}

#pragma mark -- set avatar and set selected

- (void)actionAvatar:(AvatarButton *)sender
{
    [self cancelAllButtonSelection];
    [sender setSelected:YES];
    [self refreshDetailViewWithTag:sender.tag];
}

- (void)cancelAllButtonSelection
{
    [self.developerAvatar setSelected:NO];
    [self.designerAvatar setSelected:NO];
    [self.counselorAvatar setSelected:NO];
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
