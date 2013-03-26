//
//  TyreView.m
//  tyresize
//
//  Created by mac on 13-3-21.
//  Copyright (c) 2013年 thinktube. All rights reserved.
//

#import "TyreView.h"
#import <QuartzCore/QuartzCore.h>

@interface TyreView()
@property(strong, nonatomic)UIImageView *tyreImage;
@property(strong, nonatomic)UIImageView *hubImage;
@property(strong, nonatomic)UIView *nowTyreCricle;
@property(strong, nonatomic)UIView *nowHubCricle;
@property(strong, nonatomic)UIView *wantTyreCricle;
@property(strong, nonatomic)UIView *wantHubCricle;
@end


@implementation TyreView

@synthesize tyreImage;
@synthesize hubImage;
@synthesize nowTyreCricle;
@synthesize nowHubCricle;
@synthesize wantTyreCricle;
@synthesize wantHubCricle;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.tyreImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"tyre_outer.png"]];
        self.tyreImage.frame = CGRectMake(0, 0, TYRE_WIDTH, TYRE_HEIGHT);
        self.hubImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"tyre_inner.png"]];
        self.hubImage.frame = CGRectMake(0, 0, TYRE_WIDTH, TYRE_HEIGHT);
        
        self.nowTyreCricle = [[UIView alloc]initWithFrame:CGRectMake(0, 0, TYRE_WIDTH, TYRE_HEIGHT)];
        self.wantTyreCricle = [[UIView alloc]initWithFrame:CGRectMake(0, 0, TYRE_WIDTH, TYRE_HEIGHT)];
        self.nowHubCricle = [[UIView alloc]initWithFrame:CGRectMake(0, 0, TYRE_WIDTH, TYRE_HEIGHT)];
        self.wantHubCricle = [[UIView alloc]initWithFrame:CGRectMake(0, 0, TYRE_WIDTH, TYRE_HEIGHT)];
        
        [self addSubview:self.tyreImage];
        [self addSubview:self.hubImage];
        [self addSubview:self.nowTyreCricle];
        [self addSubview:self.nowHubCricle];
        [self addSubview:self.wantTyreCricle];
        [self addSubview:self.wantHubCricle];
    }
    return self;
}

- (void)changeTyreRatio:(CGFloat)ratio
{
    CGFloat _x = TYRE_WIDTH * (1 - ratio) / 2;
    CGFloat _y = TYRE_HEIGHT * (1 - ratio) / 2;
    
    self.tyreImage.frame = CGRectMake(_x, _y, TYRE_WIDTH*ratio, TYRE_HEIGHT*ratio);
    [self drawCricleWithRadius:TYRE_WIDTH*ratio/2 andColor:REDCOLOR onView:self.nowTyreCricle];
}

- (void)changeHubRatio:(CGFloat)ratio
{
    CGFloat _x = TYRE_WIDTH * (1 - ratio) / 2;
    CGFloat _y = TYRE_HEIGHT * (1 - ratio) / 2;
    
    self.hubImage.frame = CGRectMake(_x, _y, TYRE_WIDTH*ratio, TYRE_HEIGHT*ratio);
    [self drawCricleWithRadius:TYRE_WIDTH*ratio/2 * HUB_DIA_BASE/TYRE_DIA_BASE andColor:[UIColor blueColor] onView:self.nowHubCricle];
}

- (void)drawCricleWithRadius:(CGFloat)radius andColor:(UIColor *)borderColor onView:(UIView *)targetView
{
    // clean all sublayers
    targetView.layer.sublayers = nil;
    
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
