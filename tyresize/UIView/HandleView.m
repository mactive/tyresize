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

@interface HandleView()

@property(strong, nonatomic)UILabel *handleLabel;
@property(strong, nonatomic)UIButton *nextButton;
@property(strong, nonatomic)UIButton *prevButton;
@property(strong, nonatomic)OperationView *sView;

@end

@implementation HandleView
@synthesize dataArray;
@synthesize dataNumber;

@synthesize handleLabel;
@synthesize nextButton;
@synthesize prevButton;
@synthesize sView;

@synthesize index;
@synthesize posIndex;
@synthesize isLock;
@synthesize delegate;


#define OFFSET_WIDTH    5.0f
#define BUTTON_WIDTH    40.0f
#define BUTTON_HEIGHT   30.0f
#define LABEL_WIDTH     60.0f
#define LABEL_X         BUTTON_WIDTH+OFFSET_WIDTH
#define NEXT_BUTTON_X   BUTTON_WIDTH+OFFSET_WIDTH*2+LABEL_WIDTH


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        
        //prevButton
        self.prevButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.prevButton setFrame:CGRectMake(0, 0, BUTTON_WIDTH, BUTTON_HEIGHT)];
        [self.prevButton setTitle:@"" forState:UIControlStateNormal];
        [self.prevButton setBackgroundImage:[UIImage imageNamed:@"sub_button.png"] forState:UIControlStateNormal];
        [self.prevButton setBackgroundColor:[UIColor clearColor]];
        [self.prevButton addTarget:self action:@selector(prevAction:) forControlEvents:UIControlEventTouchUpInside];
        
        // label 
        self.handleLabel = [[UILabel alloc]initWithFrame:CGRectMake(LABEL_X, 0, LABEL_WIDTH, BUTTON_HEIGHT)];
        [self.handleLabel setFont:CUSTOMFONT];
        [self.handleLabel setTextAlignment:NSTextAlignmentCenter];
        [self.handleLabel setTextColor:REDCOLOR];
        [self.handleLabel setBackgroundColor:HANDLEBGCOLOR];
        [self.handleLabel.layer setMasksToBounds:YES];
        [self.handleLabel.layer setCornerRadius:5.0f];
        [self.handleLabel.layer setBorderColor:HANDLEBORDERCOLOR];
        [self.handleLabel.layer setBorderWidth:1.0f];

        
        //nextButton
        self.nextButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.nextButton setFrame:CGRectMake(NEXT_BUTTON_X, 0, BUTTON_WIDTH, BUTTON_HEIGHT)];
        [self.nextButton setTitle:@"" forState:UIControlStateNormal];
        [self.nextButton setBackgroundImage:[UIImage imageNamed:@"add_button.png"] forState:UIControlStateNormal];
        [self.nextButton setBackgroundColor:[UIColor clearColor]];
        [self.nextButton addTarget:self action:@selector(nextAction:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:self.handleLabel];
        [self addSubview:self.prevButton];
        [self addSubview:self.nextButton];
        
    }
    return self;
}

- (void)willMoveToSuperview:(UIView *)newSuperview
{
    self.dataNumber = [self.dataArray objectAtIndex:0];
    [self.handleLabel setText:STR_INT(self.dataNumber.integerValue)];
    self.sView = (OperationView *)newSuperview;
    
    [self.delegate passStringValue:self.handleLabel.text andIndex:self.posIndex];

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
