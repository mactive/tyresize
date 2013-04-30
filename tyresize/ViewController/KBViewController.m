//
//  KBViewController.m
//  tyresize
//
//  Created by meng qian on 13-3-8.
//  Copyright (c) 2013年 thinktube. All rights reserved.
//

#import "KBViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface KBViewController ()
@property(strong, nonatomic)UIImageView *tempImage;
@property(strong, nonatomic)UIView *detailView;
@property(strong, nonatomic)UILabel *detailTitle;
@property(strong, nonatomic)UILabel *detailContent;
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
@synthesize detailView, detailTitle, detailContent;
@synthesize button1, button2, button3, button4, button5, button6;

#define MAX_WIDTH 220
#define DETAIL_HEIGHT 50.0

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
    CGFloat offsetY;
    if (IS_IPHONE_5) {
        offsetY =  40.0f;
    }else{
        offsetY = 20.0f;
    }
	// Do any additional setup after loading the view.
    self.tempImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"tyresize.png"]];
    self.tempImage.frame = CGRectMake(0, offsetY, 320, 340);
    [self.view addSubview:self.tempImage];
    
    self.backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.backButton setFrame:CGRectMake(15, 15, 60, 28)];
    [self.backButton setTitle:T(@"back") forState:UIControlStateNormal];
    [self.backButton setTitleColor:DARKCOLOR forState:UIControlStateNormal];
    [self.backButton setTitleEdgeInsets:UIEdgeInsetsMake(2, 10, 0, 0)];
    [self.backButton.titleLabel setFont:CUSTOMFONT];
    [self.backButton setBackgroundImage:[UIImage imageNamed:@"back_button_bg.png"] forState:UIControlStateNormal];
    [self.backButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.backButton];
    
    // init alpha button
    [self initButtons];
    // bottom detail view
    [self initDetailView];
    

    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
    [self refreshDetailViewWithIndex:1];
}

- (void)initDetailView
{
    self.detailView = [[UIView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height - DETAIL_HEIGHT, TOTAL_WIDTH, DETAIL_HEIGHT)];
    
    // line
    UIImageView *lineView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 1, TOTAL_WIDTH, 1)];
    [lineView setImage:[UIImage imageNamed:@"green_line.png"]];
    self.detailView.backgroundColor = BGCOLOR;
    
    // detailTitle
    self.detailTitle = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 45, 24)];
    self.detailTitle.backgroundColor = HANDLEBGCOLOR;
    self.detailTitle.layer.borderColor = HANDLEBORDERCOLOR;
    self.detailTitle.layer.borderWidth = 1.0f;
    self.detailTitle.layer.cornerRadius = 5.0f;
    self.detailTitle.textAlignment = NSTextAlignmentCenter;
    self.detailTitle.font = LITTLECUSTOMFONT;
    self.detailTitle.textColor = DARKCOLOR;
    
    // detail content
    self.detailContent = [[UILabel alloc]initWithFrame:CGRectMake(70, 15, MAX_WIDTH, 20)];
    self.detailContent.backgroundColor = [UIColor clearColor];
    self.detailContent.numberOfLines = 0;
    self.detailContent.font = TINYCUSTOMFONT;
    self.detailContent.textAlignment = NSTextAlignmentLeft;
    self.detailContent.textColor = GREENCOLOR;
    
    [self.detailView addSubview:lineView];
    [self.detailView addSubview:self.detailTitle];
    [self.detailView addSubview:self.detailContent];
    
    [self.view addSubview:self.detailView];
}

- (void)refreshDetailViewWithIndex:(NSInteger)index
{
    NSString *title;
    NSString *content;
    switch (index) {
        case 1:
            title       = T(@"195");
            content     = T(@"Nomainal section width \nMeasure Unit: mm");
            break;
        case 2:
            title       = T(@"55");
            content     = T(@"Sidewall Percent\nsidewall = width * 55%");
            break;
        case 3:
            title       = T(@"R");
            content     = T(@"Radial Constration");
            break;
        case 4:
            title       = T(@"16");
            content     = T(@"Radial Constration\nMeasure Unit: inches");
            break;
        case 5:
            title       = T(@"87");
            content     = T(@"Load opacity of one tyre\n89 = 1,279 pounds\n88 = 1,235 pounds\n87 = 1,201 pounds\n86 = 1,168 pounds\n85 = 1,135 pounds\nTypically, the load indexes of the tires used on passenger cars and light trucks range from 70 to 110.\n87 * 4 > car weight + people's weight");
            break;
        case 6:
            title       = T(@"V");
            content     = T(@"Speed symbol maximum speed\n\nL  120KM/h\nQ  160KM/h\nR  170KM/h\nS  180KM/h\nH  210KM/h\nV  240KM/h\nW  270KM/h\nY  300KM/h");
            break;
        default:
            break;
    }
    
    
    CGSize size = [(content ? content : @"") sizeWithFont:TINYCUSTOMFONT
                                        constrainedToSize:CGSizeMake(MAX_WIDTH, 9999)
                                            lineBreakMode:UILineBreakModeWordWrap];

    [self.detailContent setFrame:CGRectMake(70, 15, MAX_WIDTH, size.height)];
    [self.detailTitle setText:title];
    [self.detailContent setText:content];
    CGFloat offsetY = size.height - 20 + DETAIL_HEIGHT ;
    [self moveYPosition:offsetY andDelay:0 withView:self.detailView];
}

- (void)moveYPosition:(CGFloat)position andDelay:(CGFloat)delay withView:(UIView *)targetView
{
    CGRect rect = targetView.frame;
    
    rect.origin.y = self.view.frame.size.height - position ;
    rect.size.height = position;
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.35];
    [UIView setAnimationDelay:delay];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    
    targetView.frame = rect;
    
    [UIView commitAnimations];
}

- (void)initButtons
{
    CGFloat y_button;

    if (IS_IPHONE_5) {
        y_button = 200.0f;
    }else{
        y_button = 180.0f;
    }
    self.button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    self.button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    self.button3 = [UIButton buttonWithType:UIButtonTypeCustom];
    self.button4 = [UIButton buttonWithType:UIButtonTypeCustom];
    self.button5 = [UIButton buttonWithType:UIButtonTypeCustom];
    self.button6 = [UIButton buttonWithType:UIButtonTypeCustom];
//    self.button1.backgroundColor = GRAYCOLOR;
//    self.button2.backgroundColor = GRAYCOLOR;
//    self.button3.backgroundColor = GRAYCOLOR;
//    self.button4.backgroundColor = GRAYCOLOR;
//    self.button5.backgroundColor = GRAYCOLOR;
//    self.button6.backgroundColor = GRAYCOLOR;
    
    [self.button1 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.button2 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.button3 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.button4 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.button5 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.button6 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    self.button1.tag = 1;
    self.button2.tag = 2;
    self.button3.tag = 3;
    self.button4.tag = 4;
    self.button5.tag = 5;
    self.button6.tag = 6;
    
    [self.button1 setFrame:CGRectMake(10, y_button, 50, 40)];
    [self.button2 setFrame:CGRectMake(75, y_button, 45, 40)];
    [self.button3 setFrame:CGRectMake(125, y_button, 35, 40)];
    [self.button4 setFrame:CGRectMake(170, y_button, 45, 40)];
    [self.button5 setFrame:CGRectMake(220, y_button, 45, 40)];
    [self.button6 setFrame:CGRectMake(270, y_button, 45, 40)];

    
    [self.view addSubview:self.button1];
    [self.view addSubview:self.button2];
    [self.view addSubview:self.button3];
    [self.view addSubview:self.button4];
    [self.view addSubview:self.button5];
    [self.view addSubview:self.button6];
}

- (void)buttonAction:(UIButton *)sender
{
    NSLog(@"sender %d",sender.tag);
    [self refreshDetailViewWithIndex:sender.tag];
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
