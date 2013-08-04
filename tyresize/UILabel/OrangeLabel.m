//
//  OrangeLabel.m
//  Pods
//
//  Created by mac on 13-8-4.
//
//

#import "OrangeLabel.h"
#import "FXLabel.h"

@interface OrangeLabel()
@property(strong, nonatomic)FXLabel *shadowLabel;
@property(strong, nonatomic)FXLabel *innerLabel;
@end

@implementation OrangeLabel

@synthesize shadowLabel, innerLabel;
@synthesize font;
@synthesize text;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        //glow gradient fill
        self.innerLabel = [[FXLabel alloc]initWithFrame:frame];
        self.innerLabel.shadowColor = ORANGE_GLOW_COLOR;
        self.innerLabel.shadowOffset = CGSizeMake(0.0f, 0.0f);
        self.innerLabel.shadowBlur = 3.0f;
        self.innerLabel.textColor = ORANGECOLOR;
        self.innerLabel.innerShadowBlur = 1.5f;
        self.innerLabel.innerShadowColor = ORANGE_INNERSHADOW_COLOR;
        self.innerLabel.innerShadowOffset = CGSizeMake(0.0f, 0.0f);
        self.innerLabel.
        
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
