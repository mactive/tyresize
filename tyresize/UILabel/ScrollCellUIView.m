//
//  ScrollCellUIView.m
//  tyresize
//
//  Created by meng qian on 13-8-30.
//  Copyright (c) 2013年 thinktube. All rights reserved.
//

#import "ScrollCellUIView.h"
#import <QuartzCore/QuartzCore.h>

@interface ScrollCellUIView ()
@property(strong, nonatomic)UIImageView *bgImageView;
@property(strong, nonatomic)UILabel *titleLabel;

@end

#define SCROLL_Y    115.0f
#define SCROLL_HEIGHT    40.0f


@implementation ScrollCellUIView

@synthesize bgImage;
@synthesize title;
@synthesize bgImageView;
@synthesize titleLabel;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.bgImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        [self.bgImageView setContentMode:UIViewContentModeScaleAspectFit];
        [self addSubview:self.bgImageView];
        
        self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, SCROLL_Y, frame.size.width, SCROLL_HEIGHT)];
        self.titleLabel.font = FONT_BOOK_12;
        self.titleLabel.textColor = [UIColor whiteColor];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4];
        [self addSubview:self.titleLabel];
    }
    return self;
}

- (void)setBgImage:(UIImage *)bgImage
{
    [self.bgImageView setImage:bgImage];
}

- (void)setTitle:(NSString *)title
{
    [self.titleLabel setText:title];
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
