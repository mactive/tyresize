//
//  AvatarButton.m
//  tyresize
//
//  Created by meng qian on 13-9-3.
//  Copyright (c) 2013年 thinktube. All rights reserved.
//

#import "AvatarButton.h"
#import <QuartzCore/QuartzCore.h>
#import "GradientNormalLabel.h"

@interface AvatarButton()

@property(strong, nonatomic)UIImageView *avatarView;
@property(strong, nonatomic)UIImageView *iconView;
@property(strong, nonatomic)UILabel *nameLabel;
@property(strong, nonatomic)GradientNormalLabel *titleLabel;
@property(strong, nonatomic)UIView *cricleView;
@end


#define BUTTON_RADIUS   53.0f
#define BUTTON_SQUARE   80.0f
#define BUTTON_HEIGHT   20.0f
#define ICON_SQUARE     25.0f

#define CRICLE_SQUARE   90.0f
#define CRICLE_RADIUS   45.0f

@implementation AvatarButton

@synthesize avatarImage, iconImage;
@synthesize name,title;
@synthesize avatarView, iconView;
@synthesize nameLabel, titleLabel;
@synthesize cricleView;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.avatarView = [[UIImageView alloc]initWithFrame:
                           CGRectMake(0, 0, BUTTON_SQUARE, BUTTON_SQUARE)];
        
        self.iconView = [[UIImageView alloc]initWithFrame:
                         CGRectMake(BUTTON_SQUARE-ICON_SQUARE, 0 , ICON_SQUARE, ICON_SQUARE)];
        
        self.nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, BUTTON_SQUARE - BUTTON_HEIGHT-5, BUTTON_SQUARE, BUTTON_HEIGHT)];
        [self.nameLabel setBackgroundColor:[UIColor clearColor]];
        [self.nameLabel setTextColor:[UIColor whiteColor]];
        [self.nameLabel setFont:FONT_BOOK_12];
        [self.nameLabel setTextAlignment:NSTextAlignmentCenter];
        [self.nameLabel setNumberOfLines:0];
        
        self.titleLabel = [[GradientNormalLabel alloc]initWithFrame:
                           CGRectMake(0, BUTTON_SQUARE+10, BUTTON_SQUARE, 20)];
        
        self.cricleView = [[UIView alloc]initWithFrame:CGRectMake(-5.0f, -5.0f, CRICLE_SQUARE, CRICLE_SQUARE)];
                
        
        [self.avatarView setUserInteractionEnabled:NO];
        [self.cricleView setUserInteractionEnabled:NO];
        [self.iconView setUserInteractionEnabled:NO];
        [self.nameLabel setUserInteractionEnabled:NO];
        [self.titleLabel setUserInteractionEnabled:NO];
        
        
        [self addSubview:self.cricleView];
        [self addSubview:self.avatarView];
        [self addSubview:self.iconView];
//        [self addSubview:self.nameLabel];
        [self addSubview:self.titleLabel];

    }
    return self;
}


- (void)willMoveToSuperview:(UIView *)newSuperview
{
//    [self.avatarView setImage:[UIImage imageNamed:@"mactive_avatar.png"]];
//    [self.iconView setImage:[UIImage imageNamed:@"designer_icon.png"]];
//    self.nameLabel.text = T(@"Mactive");
//    self.titleLabel.text = T(@"iOS Developer");
}

- (void)setSelected:(BOOL)selected
{
    if (selected) {
        NSLog(@"selected");
        [self drawCricleWithRadius:CRICLE_RADIUS andColor:ORANGE_LINE_COLOR onView:self.cricleView];
    }else{
        for (CALayer *object in self.cricleView.layer.sublayers) {
            [object removeFromSuperlayer];
        }
    }
}

- (void)setAvatarImage:(UIImage *)_avatarImage
{
    [self.avatarView setImage:_avatarImage];
}

- (void)setIconImage:(UIImage *)_iconImage
{
    [self.iconView setImage:_iconImage];
}

- (void)setName:(NSString *)nameString
{
    self.nameLabel.text = nameString;
}

- (void)setTitle:(NSString *)titleString
{
    self.titleLabel.text = titleString;
}


- (void)drawCricleWithRadius:(CGFloat)radius andColor:(UIColor *)borderColor onView:(UIView *)targetView
{
    // clean all sublayers
    //    targetView.layer.sublayers = nil;
    
    // Draw tyre cricle
    CAShapeLayer *circle = [CAShapeLayer layer];
    circle.path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 2.0*radius, 2.0*radius)
                                             cornerRadius:radius].CGPath;
    // left top point
    circle.position = CGPointMake(CGRectGetWidth(targetView.frame)/2 - radius,
                                  CGRectGetHeight(targetView.frame)/2 - radius);
    // Configure the apperence of the circle
    circle.fillColor = [UIColor clearColor].CGColor;
    circle.strokeColor = borderColor.CGColor;
    circle.lineWidth = 1;
    

    
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation.duration = 0.3f;
    pathAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
    pathAnimation.toValue = [NSNumber numberWithFloat:1.0f];
    pathAnimation.repeatCount = 1;
//    pathAnimation.autoreverses = YES;
    [circle addAnimation:pathAnimation forKey:@"strokeEnd"];
    
    // Add to parent layer
    [targetView.layer addSublayer:circle];
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
