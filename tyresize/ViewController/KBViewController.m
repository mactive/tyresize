//
//  KBViewController.m
//  tyresize
//
//  Created by meng qian on 13-3-8.
//  Copyright (c) 2013年 thinktube. All rights reserved.
//

#import "KBViewController.h"
#import "GradientLabel.h"
#import <QuartzCore/QuartzCore.h>
#import "KBButton.h"
#import "GradientNormalLabel.h"

@interface KBViewController ()
@property(strong, nonatomic)UIImageView *tempImage;
@property(strong, nonatomic)UIImageView *manualView;
@property(strong, nonatomic)UIView *actionView;
@property(strong, nonatomic)UIView *detailView;
@property(strong, nonatomic)GradientLabel *detailTitle;
@property(strong, nonatomic)GradientLabel *detailContent;
@property(strong, nonatomic)UIImageView *tyreBgView;
@property(strong, nonatomic)KBButton *button1;
@property(strong, nonatomic)KBButton *button2;
@property(strong, nonatomic)KBButton *button3;
@property(strong, nonatomic)KBButton *button4;
@property(strong, nonatomic)KBButton *button5;
@property(strong, nonatomic)KBButton *button6;
@end

@implementation KBViewController
@synthesize manualView;
@synthesize tyreBgView;
@synthesize tempImage;
@synthesize actionView;
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
        offsetY =  20.0f;
    }else{
        offsetY = 10.0f;
    }
    
    //BG View
    self.tyreBgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"tyreView_bg.png"]];
    self.tyreBgView.frame = CGRectMake(0, 0, TOTAL_WIDTH, TYRE_VIEW_HEIGHT+38);
    [self.view addSubview:self.tyreBgView];
    
	// Do any additional setup after loading the view.
    self.tempImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"big_tyre.png"]];
    self.tempImage.frame = CGRectMake(0, offsetY, 304, 304);
    [self.view addSubview:self.tempImage];
    
    // init alpha button
    [self initButtons];
    // bottom detail view
    [self initDetailView];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
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
    self.detailTitle = [[GradientLabel alloc]initWithFrame:CGRectMake(10, 10, 45, 24)];
    self.detailTitle.backgroundColor = HANDLEBGCOLOR;
    self.detailTitle.layer.borderColor = HANDLEBORDERCOLOR;
    self.detailTitle.layer.borderWidth = 1.0f;
    self.detailTitle.layer.cornerRadius = 5.0f;
    self.detailTitle.textAlignment = NSTextAlignmentCenter;
    self.detailTitle.font = LITTLECUSTOMFONT;
    self.detailTitle.textColor = DARKCOLOR;
    
    // detail content
    self.detailContent = [[GradientLabel alloc]initWithFrame:CGRectMake(70, 15, MAX_WIDTH, 20)];
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
            title       = T(@"直径");
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
    CGFloat offsetY = size.height + DETAIL_HEIGHT ;
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

#define BTN_WIDTH   45.0f
#define BTN_HEIGHT  60.0f
#define Y_OFFSET    25.0f
#define X_OFFSET    10.0f
#define X_I         51.0f

- (void)initButtons
{
    CGFloat y_button;
    
    if (IS_IPHONE_5) {
        y_button = 200.0f;
    }else{
        y_button = 180.0f;
    }
    
    self.actionView = [[UIView alloc]initWithFrame:CGRectMake(0, TYRE_VIEW_HEIGHT, TOTAL_WIDTH, PRMT_VIEW_HEIGHT)];
    
    [self initManualView];

    self.button1 = [KBButton buttonWithType:UIButtonTypeCustom];
    self.button2 = [KBButton buttonWithType:UIButtonTypeCustom];
    self.button3 = [KBButton buttonWithType:UIButtonTypeCustom];
    self.button4 = [KBButton buttonWithType:UIButtonTypeCustom];
    self.button5 = [KBButton buttonWithType:UIButtonTypeCustom];
    self.button6 = [KBButton buttonWithType:UIButtonTypeCustom];
    
    [self.button1 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.button2 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.button3 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.button4 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.button5 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.button6 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.button1 setTitle:T(@"195") forState:UIControlStateNormal];
    [self.button2 setTitle:T(@"55") forState:UIControlStateNormal];
    [self.button3 setTitle:T(@"R") forState:UIControlStateNormal];
    [self.button4 setTitle:T(@"16") forState:UIControlStateNormal];
    [self.button5 setTitle:T(@"87") forState:UIControlStateNormal];
    [self.button6 setTitle:T(@"V") forState:UIControlStateNormal];
    
    self.button1.tag = 1;
    self.button2.tag = 2;
    self.button3.tag = 3;
    self.button4.tag = 4;
    self.button5.tag = 5;
    self.button6.tag = 6;
    
    [self.button1 setFrame:CGRectMake(X_OFFSET, Y_OFFSET, BTN_WIDTH, BTN_HEIGHT)];
    [self.button2 setFrame:CGRectMake(X_OFFSET + X_I, Y_OFFSET, BTN_WIDTH, BTN_HEIGHT)];
    [self.button3 setFrame:CGRectMake(X_OFFSET + X_I*2, Y_OFFSET, BTN_WIDTH, BTN_HEIGHT)];
    [self.button4 setFrame:CGRectMake(X_OFFSET + X_I*3, Y_OFFSET, BTN_WIDTH, BTN_HEIGHT)];
    [self.button5 setFrame:CGRectMake(X_OFFSET + X_I*4, Y_OFFSET, BTN_WIDTH, BTN_HEIGHT)];
    [self.button6 setFrame:CGRectMake(X_OFFSET + X_I*5, Y_OFFSET, BTN_WIDTH, BTN_HEIGHT)];
    
    [self.actionView addSubview:self.button1];
    [self.actionView addSubview:self.button2];
    [self.actionView addSubview:self.button3];
    [self.actionView addSubview:self.button4];
    [self.actionView addSubview:self.button5];
    [self.actionView addSubview:self.button6];
    
    [self.view addSubview:self.actionView];
    
}

- (void)initManualView{
    
    //BG View
    self.manualView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"operView_bg.png"]];
    self.manualView.frame = CGRectMake(0, 0 , TOTAL_WIDTH, PRMT_VIEW_HEIGHT);
    
    // Note View
    UIImageView *noteView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Wiki_note.png"]];
    noteView.frame = CGRectMake(0, 96.0f , TOTAL_WIDTH, 77.0f);
    
    [self.manualView addSubview:noteView];
    
    
    // GradientNormalLabel    
    GradientNormalLabel *label1 = [[GradientNormalLabel alloc]initWithFrame:CGRectMake(10, 180, 50, 10)];
    label1.text = T(@"195 mm /n 195 mm /n 195 mm");
    [label1 setFont:FONT_MEDIUM_9];
    
    [self.manualView addSubview:label1];
    
    
    
    // add to parent view
    [self.actionView addSubview:self.manualView];
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
