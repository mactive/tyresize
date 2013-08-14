//
//  KBButton.m
//  tyresize
//
//  Created by mac on 13-8-14.
//  Copyright (c) 2013年 thinktube. All rights reserved.
//

#import "KBButton.h"
#import "GradientLabel.h"

@interface KBButton()

@property(strong, nonatomic)GradientLabel *onLabel;

@end

@implementation KBButton
@synthesize onLabel;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setBackgroundImage:[UIImage imageNamed:@"wiki_btn_off.png"] forState:UIControlStateHighlighted];
        [self setBackgroundImage:[UIImage imageNamed:@"wiki_btn_on.png"] forState:UIControlStateNormal];
        
        self.onLabel = [[GradientLabel alloc]init];       
        
        [self addSubview:self.onLabel];
    }
    return self;
}

- (void)willMoveToSuperview:(UIView *)newSuperview
{
    [self.onLabel setFrame:CGRectMake(0, 10, self.frame.size.width, 20)];
    
}


- (void)setTitle:(NSString *)title forState:(UIControlState)state
{
    if (state == UIControlStateNormal) {
//        [self.onLabel setHidden:NO];
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
