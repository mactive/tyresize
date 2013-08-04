//
//  InnerAndGrowLabel.m
//  tyresize
//
//  Created by mac on 13-8-4.
//  Copyright (c) 2013年 thinktube. All rights reserved.
//

#import "OrangeInnerAndGrowLabel.h"

@interface OrangeInnerAndGrowLabel()
@property(strong, nonatomic)FXLabel *shadowLabel;
@end

@implementation OrangeInnerAndGrowLabel
@synthesize shadowLabel;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.font = FONT_BLACK_15;
        
        //glow gradient fill
        self.shadowColor = ORANGE_GLOW_COLOR;
        self.shadowOffset = CGSizeMake(0.0f, 0.0f);
        self.shadowBlur = 3.0f;
        self.textColor = ORANGECOLOR;
        self.innerShadowBlur = 1.5f;
        self.innerShadowColor = ORANGE_INNERSHADOW_COLOR;
        self.innerShadowOffset = CGSizeMake(0.0f, 0.0f);
        
        //demonstrate inner shadow
        self.shadowLabel.shadowColor = [UIColor blackColor];
        self.shadowLabel.shadowOffset = CGSizeMake(0.0f, 1.5f);
        self.shadowLabel.shadowBlur = 1.5f;
        self.shadowLabel.textColor = REDCOLOR;
        self.shadowLabel.backgroundColor = [UIColor redColor];
        
        [self addSubview:self.shadowLabel];
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
