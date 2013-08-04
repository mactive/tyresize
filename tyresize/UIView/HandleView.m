//
//  HandleView.m
//  tyresize
//
//  Created by mac on 13-3-21.
//  Copyright (c) 2013年 thinktube. All rights reserved.
//

#import "HandleView.h"
#import <QuartzCore/QuartzCore.h>
#import "OperationView.h"
#import "SettingHelper.h"
#import "OrangeInnerAndGrowLabel.h"

@interface HandleView()

@property(strong, nonatomic)OrangeInnerAndGrowLabel *handleLabel;
@property(strong, nonatomic)UIButton *nextButton;
@property(strong, nonatomic)UIButton *prevButton;
@property(strong, nonatomic)OperationView *sView;
@property(strong, nonatomic)NSArray *bgImageArray;
@property(strong, nonatomic)NSArray *addBtnBgImageArray;
@property(strong, nonatomic)NSArray *minusBtnBgImageArray;
@property(strong, nonatomic)UIImageView *handleBgView;
@end

@implementation HandleView
@synthesize dataArray;
@synthesize dataNumber;
@synthesize bgImageArray,addBtnBgImageArray, minusBtnBgImageArray;
@synthesize handleBgView;

@synthesize handleLabel;
@synthesize nextButton;
@synthesize prevButton;
@synthesize sView;

@synthesize index;
@synthesize posIndex;
@synthesize isLock;
@synthesize delegate;


#define BUTTON_WIDTH    41.0f
#define BUTTON_HEIGHT   35.0f
#define BUTTON_X        2.5f
#define BUTTON_Y        3.5f

#define LABEL_WIDTH     48.0f
#define LABEL_X         BUTTON_X+BUTTON_WIDTH

#define NEXT_BUTTON_X   BUTTON_X+BUTTON_WIDTH+LABEL_WIDTH

#define BGVIEW_HEIGHT 35.0f

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        
        //prevButton
        self.prevButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.prevButton setFrame:CGRectMake(BUTTON_X, BUTTON_Y, BUTTON_WIDTH, BUTTON_HEIGHT)];
        [self.prevButton setTitle:@"" forState:UIControlStateNormal];
        [self.prevButton setBackgroundColor:[UIColor clearColor]];
        [self.prevButton addTarget:self action:@selector(prevAction:) forControlEvents:UIControlEventTouchUpInside];
        
        // label 
        self.handleLabel = [[OrangeInnerAndGrowLabel alloc]initWithFrame:CGRectMake(LABEL_X, 0, LABEL_WIDTH, BUTTON_HEIGHT)];
        [self.handleLabel setTextAlignment:NSTextAlignmentCenter];
        [self.handleLabel setBackgroundColor:[UIColor clearColor]];


        
        //nextButton
        self.nextButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.nextButton setFrame:CGRectMake(NEXT_BUTTON_X, BUTTON_Y, BUTTON_WIDTH, BUTTON_HEIGHT)];
        [self.nextButton setTitle:@"" forState:UIControlStateNormal];
        [self.nextButton setBackgroundColor:[UIColor clearColor]];
        [self.nextButton addTarget:self action:@selector(nextAction:) forControlEvents:UIControlEventTouchUpInside];
        
        // bandle bg view
        self.handleBgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, BGVIEW_HEIGHT)];
        
        [self addSubview:self.handleBgView];
        [self addSubview:self.handleLabel];
        [self addSubview:self.prevButton];
        [self addSubview:self.nextButton];
        
    }
    return self;
}

- (void)willMoveToSuperview:(UIView *)newSuperview
{
    self.dataNumber = [self.dataArray objectAtIndex:self.index];
    [self.handleLabel setText:STR_INT(self.dataNumber.integerValue)];
    self.sView = (OperationView *)newSuperview;
    
    // 一开始让 now的参数起作用
    [self.delegate passStringValue:self.handleLabel.text andIndex:self.posIndex];
//    NSLog(@"index %@ posindex %d ",[self.bgImageArray objectAtIndex:self.posIndex],self.posIndex);
    [self.handleBgView setImage:[UIImage imageNamed:[[SettingHelper handleBG] objectAtIndex:self.posIndex]]];
    
    // 设置按钮的背景图
    [self.prevButton setBackgroundImage:[UIImage imageNamed:[[SettingHelper minusBtnOnBG] objectAtIndex:self.posIndex]]
                               forState:UIControlStateNormal];
    
    [self.prevButton setBackgroundImage:[UIImage imageNamed:[[SettingHelper minusBtnOffBG] objectAtIndex:self.posIndex]]
                               forState:UIControlStateHighlighted];
    
    [self.nextButton setBackgroundImage:[UIImage imageNamed:[[SettingHelper addBtnOnBG] objectAtIndex:self.posIndex]]
                               forState:UIControlStateNormal];
    
    [self.nextButton setBackgroundImage:[UIImage imageNamed:[[SettingHelper addBtnOffBG] objectAtIndex:self.posIndex]]
                               forState:UIControlStateHighlighted];
    

}

- (void)nextAction:(id)sender
{
    if (self.index < ([self.dataArray count]-1)) {
        self.index +=1;
        self.dataNumber = [self.dataArray objectAtIndex:self.index];
        [self.handleLabel setText:STR_INT(self.dataNumber.integerValue)];
    }
    [self.delegate passStringValue:self.handleLabel.text andIndex:self.posIndex];
}

- (void)prevAction:(id)sender
{
    if (self.index > 0) {
        self.index -=1;
        self.dataNumber = [self.dataArray objectAtIndex:self.index];
        [self.handleLabel setText:STR_INT(self.dataNumber.integerValue)];
    }
    [self.delegate passStringValue:self.handleLabel.text andIndex:self.posIndex];
}

- (void)setLockStatus:(BOOL)lockStatus
{
        self.isLock = lockStatus;
        [self.prevButton setHidden:lockStatus];
        [self.nextButton setHidden:lockStatus];
    
    if (lockStatus) {
        [self.handleLabel setTextColor:RGBCOLOR(100, 100, 100)];
    }else{
        [self.handleLabel setTextColor:REDCOLOR];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
