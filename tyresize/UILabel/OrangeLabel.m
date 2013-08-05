//
//  InnerAndGrowLabel.m
//  tyresize
//
//  Created by mac on 13-8-4.
//  Copyright (c) 2013年 thinktube. All rights reserved.
//

#import "OrangeLabel.h"

@implementation OrangeLabel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.font = FONT_BLACK_15;
        
        //glow gradient fill
        self.shadowColor = ORANGECOLOR;
        self.shadowOffset = CGSizeMake(0.0f, 0.0f);
        self.shadowBlur = 1.5f;
        self.textColor = ORANGECOLOR;
        self.innerShadowBlur = 1.5f;
        self.innerShadowColor = ORANGE_INNERSHADOW_COLOR;
        self.innerShadowOffset = CGSizeMake(0.0f, 0.0f);
        
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
