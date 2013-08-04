//
//  ColoredLabel.m
//  tyresize
//
//  Created by mac on 13-8-4.
//  Copyright (c) 2013年 thinktube. All rights reserved.
//

#import "ColoredLabel.h"

@implementation ColoredLabel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.font = FONT_BLACK_15;
        
        //glow gradient fill
        self.shadowColor = ORANGE_GLOW_COLOR;
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

- (void)changeColor:(NSString *)colorString
{
    if ([colorString isEqualToString:@"ORANGE"]) {
        self.shadowColor = ORANGE_GLOW_COLOR;
        self.textColor = ORANGECOLOR;
        self.innerShadowColor = ORANGE_INNERSHADOW_COLOR;
    }else if ([colorString isEqualToString:@"BLUE"]){
        self.shadowColor = BLUE_GLOW_COLOR;
        self.textColor = BLUECOLOR;
        self.innerShadowColor = BLUE_INNERSHADOW_COLOR;
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
