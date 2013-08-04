//
//  ColoredButton.m
//  tyresize
//
//  Created by mac on 13-8-4.
//  Copyright (c) 2013年 thinktube. All rights reserved.
//

#import "ColoredButton.h"
#import "ColoredLabel.h"
#import "GradientLabel.h"

@interface ColoredButton()
@property(strong, nonatomic)GradientLabel *onLabel;

@end
@implementation ColoredButton
@synthesize onLabel;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code


        [self setBackgroundImage:[UIImage imageNamed:@"btnOn_bg.png"] forState:UIControlStateHighlighted];
        self.onLabel = [[GradientLabel alloc]init];

        [self addSubview:self.onLabel];
        [self.onLabel setHidden:YES];


    }
    return self;
}

- (void)willMoveToSuperview:(UIView *)newSuperview
{
    [self.onLabel setFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];

}

-(void)setTitle:(NSString *)title forState:(UIControlState)state
{
    if (state == UIControlStateNormal) {
        [self.onLabel setHidden:NO];
        self.onLabel.text = title;
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
