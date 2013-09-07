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
#import "ColoredLabel.h"
#import "MultilineView.h"

@interface OtherViewController ()<UIScrollViewAccessibilityDelegate>
@property(strong, nonatomic)GCPagedScrollView *scrollView;
@property(strong, nonatomic)NSArray *scrollTitleArray;
@property(strong, nonatomic)NSArray *scrollImageArray;

@property(strong, nonatomic)UIView *actionView;
@property(strong, nonatomic)AvatarButton *developerAvatar;
@property(strong, nonatomic)AvatarButton *designerAvatar;
@property(strong, nonatomic)AvatarButton *counselorAvatar;
@property(strong, nonatomic)UIView *detailView;
@property(strong, nonatomic)ColoredLabel *detailTitle;
@property(strong, nonatomic)MultilineView *detailContent;
@property(strong, nonatomic)UIScrollView *detailScrollView;

@end


#define GAP_HEIGHT  18.0f
#define DEVELOPER_TAG   1
#define DESIGNER_TAG    2
#define COUNSELOR_TAG   3

@implementation OtherViewController

@synthesize scrollView;
@synthesize scrollImageArray, scrollTitleArray;
@synthesize actionView;
@synthesize developerAvatar, designerAvatar, counselorAvatar;
@synthesize detailView;
@synthesize detailTitle;
@synthesize detailContent;
@synthesize detailScrollView;

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
                             T(@"Click list data to view more 7 lines."),
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
#define AVATAR_Y (IS_IPHONE_5 ? 50.0f : 40.0f )
#define AVATAR_WIDTH 100.0f
#define AVATAR_HEIGHT 120.0f
#define DETAIL_HEIGHT 100.0f
#define DETAIL_Y 40.0f
#define DETAIL_X 20.0f
#define MAX_WIDTH   280.0f


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
//    self.developerAvatar = [[AvatarButton alloc ]initWithFrame:CGRectMake(AVATAR_X, AVATAR_Y, AVATAR_WIDTH, AVATAR_HEIGHT)];
    
    [self.developerAvatar addTarget:self action:@selector(actionAvatar:) forControlEvents:UIControlEventTouchUpInside];
    [self.developerAvatar setAvatarImage:[UIImage imageNamed:@"mactive_avatar.png"]];
    [self.developerAvatar setIconImage:[UIImage imageNamed:@"developer_icon.png"]];
    [self.developerAvatar setName:T(@"Mactive")];
    [self.developerAvatar setTitle:T(@"Developer")];
    self.developerAvatar.tag = DEVELOPER_TAG;
    
    
    self.designerAvatar = [AvatarButton buttonWithType:UIButtonTypeCustom];
    [self.designerAvatar setFrame:CGRectMake(AVATAR_X+AVATAR_WIDTH, AVATAR_Y, AVATAR_WIDTH, AVATAR_HEIGHT)];
//    self.designerAvatar = [[AvatarButton alloc ]initWithFrame:CGRectMake(AVATAR_X+AVATAR_WIDTH, AVATAR_Y, AVATAR_WIDTH, AVATAR_HEIGHT)];

    [self.designerAvatar addTarget:self action:@selector(actionAvatar:) forControlEvents:UIControlEventTouchUpInside];
    [self.designerAvatar setName:T(@"Leon Qin")];
    [self.designerAvatar setTitle:T(@" Designer")];
    [self.designerAvatar setAvatarImage:[UIImage imageNamed:@"leno_avatar.png"]];
    [self.designerAvatar setIconImage:[UIImage imageNamed:@"designer_icon.png"]];
    self.designerAvatar.tag = DESIGNER_TAG;
    
    self.counselorAvatar = [AvatarButton buttonWithType:UIButtonTypeCustom];
    [self.counselorAvatar setFrame:CGRectMake(AVATAR_X+AVATAR_WIDTH*2, AVATAR_Y, AVATAR_WIDTH, AVATAR_HEIGHT)];
//    self.counselorAvatar = [[AvatarButton alloc ]initWithFrame:CGRectMake(AVATAR_X+AVATAR_WIDTH*2, AVATAR_Y, AVATAR_WIDTH, AVATAR_HEIGHT)];

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
    self.detailView = [[UIView alloc]initWithFrame:
                       CGRectMake(0, TYRE_VIEW_HEIGHT+ OPER_VIEW_HEIGHT - GAP_HEIGHT*4, TOTAL_WIDTH, DETAIL_HEIGHT)];
    // bgview
    UIImageView *bgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, TOTAL_WIDTH, 250)];
    [bgView setImage:[UIImage imageNamed:@"wiki_detail_bg.png"]];
    
    self.detailScrollView = [[UIScrollView alloc]initWithFrame:
                             CGRectMake(0, 7, TOTAL_WIDTH, TOTAL_HEIGHT - TYRE_VIEW_HEIGHT - OPER_VIEW_HEIGHT - GAP_HEIGHT )];
    self.detailScrollView.contentOffset = CGPointMake(0, GAP_HEIGHT);
    // detailTitle
    self.detailTitle = [[ColoredLabel alloc]init];
    [self.detailTitle setFrame:CGRectMake(DETAIL_X, 5, 240, DETAIL_Y)];
    [self.detailTitle setFont:FONT_BOLD_15];
    [self.detailTitle setTextAlignment:NSTextAlignmentLeft];
    // detail content
    self.detailContent = [[MultilineView alloc] initWithFrame:CGRectZero];
    self.detailContent.textAlign = NSTextAlignmentLeft;
    
    // view inherit
    [self.detailScrollView addSubview:self.detailTitle];
    [self.detailScrollView addSubview:self.detailContent];
    [self.detailView addSubview:bgView];
    [self.detailView addSubview:self.detailScrollView];
    
    [self.view addSubview:self.detailView];
}

- (void)refreshDetailViewWithIndex:(NSInteger)index
{
    NSString *title;
    NSString *content;
    switch (index) {
        case 1:
            title       = T(@"Mactive");
            content     = T(@"Thinktube.Inc Founder, The Tyresize App &\nBabyDraw App Maker.\nCraftman and Interactive Developer,\nBig fan of Blizzard");
            break;
        case 2:
            title       = T(@"Leon Qin");
            content     = T(@"Leon Qin Summary");
            break;
        case 3:
            title       = T(@"Laofozhu");
            content     = T(@"Laofozhu Summary");
            break;
        default:
            break;
    }
    
    
    CGSize size = [(content ? content : @"") sizeWithFont:FONT_BOOK_12
                                        constrainedToSize:CGSizeMake(MAX_WIDTH, 9999)
                                            lineBreakMode:NSLineBreakByWordWrapping];
    
    [self.detailContent setFrame:CGRectMake(DETAIL_X, DETAIL_Y, MAX_WIDTH, size.height )];
    [self.detailContent setFont:FONT_BOOK_12];
    [self.detailContent setMultiLineText:content];
    [self.detailTitle setText:title];
    
    CGFloat contentHeight = size.height + DETAIL_Y * 2;
    [self.detailScrollView setContentSize:CGSizeMake(TOTAL_WIDTH, contentHeight )];
    
    //    CGFloat offsetY = size.height + DETAIL_HEIGHT ;
    //    [self moveYPosition:offsetY andDelay:0 withView:self.detailView];
}

#pragma mark -- set avatar and set selected

- (void)actionAvatar:(AvatarButton *)sender
{
    [self cancelAllButtonSelection];
    [sender setSelected:YES];
    [self refreshDetailViewWithIndex:sender.tag];
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

    //three avatarButton tag 1 2 3
    int r = arc4random() % 3;
    r = r+1;
    
    [self actionAvatar:(AvatarButton *)[self.actionView viewWithTag:r]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
