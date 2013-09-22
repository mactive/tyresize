//
//  SocialButton.m
//  tyresize
//
//  Created by meng qian on 13-9-22.
//  Copyright (c) 2013年 thinktube. All rights reserved.
//

#import "SocialButton.h"
#import <QuartzCore/QuartzCore.h>

@interface SocialButton()

@property(nonatomic, strong)UIView *bgView;

@end

@implementation SocialButton
@synthesize urlString;
@synthesize bgView;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        self.backgroundColor = [UIColor clearColor];
        [self setTitleColor:DARKCOLOR forState:UIControlStateNormal];
        [self.titleLabel setFont:FONT_AWESOME_15];
        
        [[self layer]setCornerRadius:SOCIAL_BTN_HEIGHT/2];
        [[self layer]setBackgroundColor:ORANGECOLOR.CGColor];
        
        
    }
    return self;
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
