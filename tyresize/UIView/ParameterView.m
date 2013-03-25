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
@property(strong, nonatomic)NSMutableArray *nowArray;
@property(strong, nonatomic)NSMutableArray *wantArray;
@end

@implementation ParameterView
@synthesize nowArray;
@synthesize wantArray;

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
        
        self.nowArray = [[NSMutableArray alloc]init];
        self.wantArray = [[NSMutableArray alloc]init];
        
    }
    return self;
}

#define LINE_HEIGHT 20
#define PRMT_WIDTH 70
#define PRMT_TITLE 180
// do refresh
- (void)willMoveToSuperview:(UIView *)newSuperview
{
    NSLog(@"willMoveToSuperview title");
    for(int i = 0; i < [PRMTIMPERIAL count]; i++){
        UILabel *label = [[UILabel alloc]init];
        label.font = CUSTOMFONT;
        label.textColor = GREENCOLOR;
        label.text = [PRMTIMPERIAL objectAtIndex:i];
        label.textAlignment = NSTextAlignmentCenter;
        [label setFrame:CGRectMake(PRMT_WIDTH, LINE_HEIGHT * (i+1), PRMT_TITLE, LINE_HEIGHT)];
        [self addSubview:label];
    }
    
    NSLog(@"willMoveToSuperview now para");
    for(int i = 0; i < [PRMTIMPERIAL count]; i++){
        UILabel *label = [[UILabel alloc]init];
        label.font = CUSTOMFONT;
        label.textColor = GRAYCOLOR;
        label.textAlignment = NSTextAlignmentCenter;
        [label setFrame:CGRectMake(0, LINE_HEIGHT *(i+1), PRMT_WIDTH, LINE_HEIGHT)];
        label.text = T(@"---");
        [self.nowArray addObject:label];
        [self addSubview:label];
    }
    
    
}

- (void)changeNowPrmt:(NSArray *)prmtArray
{
    for(int i = 0; i < [self.nowArray count]; i++){
        UILabel *label = (UILabel *)[self.nowArray objectAtIndex:i];
        NSNumber *num = [prmtArray objectAtIndex:i];
        label.text = [NSString stringWithFormat:@"%.2f",num.floatValue];
    }
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
