//
//  ParameterView.m
//  tyresize
//
//  Created by mac on 13-3-20.
//  Copyright (c) 2013年 thinktube. All rights reserved.
//

#import "ParameterView.h"
#import "GradientNormalLabel.h"
#import "ColoredLabel.h"

@interface ParameterView()
@property(strong, nonatomic)NSArray *PRMTIMPERIAL;
@property(strong, nonatomic)NSArray *PRMTMETIC;
@property(strong, nonatomic)NSMutableArray *sysTitleArray;
@property(strong, nonatomic)NSMutableArray *nowArray;
@property(strong, nonatomic)NSMutableArray *wantArray;
@property(strong, nonatomic)UIImageView *bgView;
@end

@implementation ParameterView
@synthesize nowArray;
@synthesize wantArray;
@synthesize sysTitleArray;

@synthesize PRMTMETIC;
@synthesize PRMTIMPERIAL;
@synthesize bgView;

#define LINE_HEIGHT 30.0f
#define PRMT_WIDTH  70.0f
#define PRMT_TITLE  180.0f
#define OFFSET_Y    12.0f
#define OFFSET_X    20.0f
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
        
        self.sysTitleArray  = [[NSMutableArray alloc]init];
        self.nowArray       = [[NSMutableArray alloc]init];
        self.wantArray      = [[NSMutableArray alloc]init];
        
        self.bgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, TOTAL_WIDTH, PRMT_VIEW_HEIGHT)];
        [self.bgView setImage:[UIImage imageNamed:@"prmtView_bg.png"]];
        
    }
    return self;
}


// do refresh
- (void)willMoveToSuperview:(UIView *)newSuperview
{
    [self addSubview:self.bgView];

//    NSLog(@"willMoveToSuperview title");
    for(int i = 0; i < [self.PRMTMETIC count]; i++){
        GradientNormalLabel *label = [[GradientNormalLabel alloc]init];
        [label setFrame:CGRectMake(PRMT_WIDTH, LINE_HEIGHT *i +OFFSET_Y, PRMT_TITLE, LINE_HEIGHT)];
        label.text = [self.PRMTMETIC objectAtIndex:i];
        [self.sysTitleArray addObject:label];
        [self addSubview:label];
    }
    
//    NSLog(@"willMoveToSuperview now para");
    for(int i = 0; i < [self.PRMTMETIC count]; i++){
        ColoredLabel *label = [[ColoredLabel alloc]init];
        [label setFrame:CGRectMake(OFFSET_X, LINE_HEIGHT * i +OFFSET_Y, PRMT_WIDTH, LINE_HEIGHT)];
        [label setFont:FONT_MEDIUM_12];
        label.text = T(@"---");
        [self.nowArray addObject:label];
        [self addSubview:label];
    }
    
//    NSLog(@"willMoveToSuperview want para");
    for(int i = 0; i < [self.PRMTMETIC count]; i++){
        ColoredLabel *label = [[ColoredLabel alloc]init];
        [label setFont:FONT_MEDIUM_12];
        [label changeColor:@"BLUE"];
        [label setFrame:CGRectMake(TOTAL_WIDTH-OFFSET_X-PRMT_WIDTH, LINE_HEIGHT *i + OFFSET_Y, PRMT_WIDTH, LINE_HEIGHT)];
        label.text = T(@"---");
        [self.wantArray addObject:label];
        [self addSubview:label];
    }
    

}

-(void)refreshPrmtView:(NSString *)system
{
    if ([system isEqualToString:UKSYS]) {
        for(int i = 0; i < [self.sysTitleArray count]; i++){
            UILabel *label = (UILabel *)[self.sysTitleArray objectAtIndex:i];
            label.text = [self.PRMTIMPERIAL objectAtIndex:i];
        }
    }else if ([system isEqualToString:USSYS]){
        for(int i = 0; i < [self.sysTitleArray count]; i++){
            UILabel *label = (UILabel *)[self.sysTitleArray objectAtIndex:i];
            label.text = [self.PRMTMETIC objectAtIndex:i];
        }
    }
}

- (void)changeNowPrmt:(NSArray *)prmtArray
{
    for(int i = 0; i < [self.nowArray count]; i++){
        UILabel *label = (UILabel *)[self.nowArray objectAtIndex:i];
        NSNumber *num = [prmtArray objectAtIndex:i];
        if (i >= SPEED_LABEL_INDEX) {
            label.text = T(@"---");
        }else{
            label.text = [NSString stringWithFormat:@"%.2f",num.floatValue];
        }
    }
}

- (void)changeWantPrmt:(NSArray *)prmtArray
{
    for(int i = 0; i < [self.wantArray count]; i++){
        UILabel *label = (UILabel *)[self.wantArray objectAtIndex:i];
        NSNumber *num = [prmtArray objectAtIndex:i];
        if (i == SPEED_LABEL_INDEX) {
            label.text = [NSString stringWithFormat:@"%.1f%%",num.floatValue];
        }else{
            label.text = [NSString stringWithFormat:@"%.2f",num.floatValue];
        }
    }
}

- (void)didMoveToSuperview
{
//    NSLog(@"didMoveToSuperview");
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
