//
//  MultilineLabel.m
//  tyresize
//
//  Created by mac on 13-8-24.
//  Copyright (c) 2013年 thinktube. All rights reserved.
//

#import "MultilineLabel.h"

@implementation MultilineLabel

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
        self.font = FONT_MEDIUM_12;
        
        [self setTextAlignment:NSTextAlignmentCenter];
        [self setBackgroundColor:[UIColor clearColor]];
    }
    return self;
}

//- (void)setText:(NSString *)text
//{
//    CGSize finalSize = [text sizeWithFont:self.font
//                        constrainedToSize:CGSizeZero
//                            lineBreakMode:NSLineBreakByWordWrapping
//                              lineSpacing:0.0f
//                         characterSpacing:0.0f
//                             kerningTable:nil
//                             allowOrphans:YES];
//    NSLog(NSStringFromCGSize(finalSize));
////    [self setFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y, finalSize.width, finalSize.height)];
//}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
