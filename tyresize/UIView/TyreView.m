//
//  TyreView.m
//  tyresize
//
//  Created by mac on 13-3-21.
//  Copyright (c) 2013年 thinktube. All rights reserved.
//

#import "TyreView.h"

@interface TyreView()
@property(strong, nonatomic)UIImageView *tyreImage;
@property(strong, nonatomic)UIImageView *hubImage;

@end


@implementation TyreView

@synthesize tyreImage;
@synthesize hubImage;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.tyreImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"tyre_outer.png"]];
        self.tyreImage.frame = CGRectMake(0, 0, TYRE_WIDTH, TYRE_HEIGHT);
        self.hubImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"tyre_inner.png"]];
        self.hubImage.frame = CGRectMake(0, 0, TYRE_WIDTH, TYRE_HEIGHT);
        
        [self addSubview:self.tyreImage];
        [self addSubview:self.hubImage];
    }
    return self;
}

- (void)changeTyreRatio:(CGFloat)ratio
{
    CGFloat _x = TYRE_WIDTH * (1 - ratio) / 2;
    CGFloat _y = TYRE_HEIGHT * (1 - ratio) / 2;
    
    self.tyreImage.frame = CGRectMake(_x, _y, TYRE_WIDTH*ratio, TYRE_HEIGHT*ratio);
}

- (void)changeHubRatio:(CGFloat)ratio
{
    CGFloat _x = TYRE_WIDTH * (1 - ratio) / 2;
    CGFloat _y = TYRE_HEIGHT * (1 - ratio) / 2;
    
    self.hubImage.frame = CGRectMake(_x, _y, TYRE_WIDTH*ratio, TYRE_HEIGHT*ratio);
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
