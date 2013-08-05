//
//  GradientLabel.m
//  tyresize
//
//  Created by mac on 13-8-3.
//  Copyright (c) 2013年 thinktube. All rights reserved.
//

#import "GradientLabel.h"

@implementation GradientLabel



- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.gradientStartColor = kGradientStartColor;
        self.gradientEndColor = kGradientEndColor;
        
        self.shadowColor = [UIColor blackColor];
        self.shadowOffset = CGSizeMake(0.0f, 1.0f);
        self.shadowBlur = 1.0f;
        self.font = FONT_BOLD_15;
        
        [self setTextAlignment:NSTextAlignmentCenter];
        [self setBackgroundColor:[UIColor clearColor]];
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
