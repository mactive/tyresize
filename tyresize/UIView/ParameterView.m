//
//  ParameterView.m
//  tyresize
//
//  Created by mac on 13-3-20.
//  Copyright (c) 2013年 thinktube. All rights reserved.
//

#import "ParameterView.h"

@interface ParameterView()
@property(strong, nonatomic)NSArray *PRMTIMPERIAL;
@property(strong, nonatomic)NSArray *PRMTMETIC;

@end

@implementation ParameterView

@synthesize PRMTMETIC;
@synthesize PRMTIMPERIAL;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        self.PRMTIMPERIAL = [NSArray arrayWithObjects:
                             T(@"Sidewall(in)"),
                             T(@"Radius(in)"),
                             T(@"Diamter(in)"),
                             T(@"Circumference(in)"),
                             T(@"Rotations/Mile"),
                             T(@"Speedo Diff(%)"),
                             T(@"Speed@60mph"),nil];
        
        self.PRMTMETIC = [[NSArray alloc]initWithObjects:
                          T(@"Sidewall(mm)"),
                          T(@"Radius(mm)"),
                          T(@"Diamter(mm)"),
                          T(@"Circumference(mm)"),
                          T(@"Rotations/KM"),
                          T(@"Speedo Diff(%)"),
                          T(@"Speed@100kph"), nil];

        
    }
    return self;
}

// do refresh
- (void)willMoveToSuperview:(UIView *)newSuperview
{
    NSLog(@"willMoveToSuperview");
    for(int i = 0; i < [PRMTIMPERIAL count]; i++){
        UILabel *label = [[UILabel alloc]init];
        label.font = CUSTOMFONT;
        label.textColor = GREENCOLOR;
        label.text = [PRMTIMPERIAL objectAtIndex:i];
        [label setFrame:CGRectMake(20, 20 *i +20, 200, 20)];
        [self addSubview:label];
    }
    NSLog(@"init");

}

- (void)didMoveToSuperview
{
    NSLog(@"didMoveToSuperview");
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
