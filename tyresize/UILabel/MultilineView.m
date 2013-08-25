//
//  MultilineView.m
//  tyresize
//
//  Created by mac on 13-8-25.
//  Copyright (c) 2013年 thinktube. All rights reserved.
//

#import "MultilineView.h"
#import "GradientNormalLabel.h"

@interface MultilineView()
@property(assign, nonatomic)CGRect viewFrame;

@end

@implementation MultilineView
@synthesize multiLineText;
@synthesize viewFrame;
@synthesize textAlign;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.viewFrame = frame;
    }
    return self;
}

- (void)setMultiLineText:(NSString *)multiLineText
{
    NSArray *array = [multiLineText componentsSeparatedByString:@"\n"]; //从字符\n中分隔成2个元素的数组
    CGFloat cellHeight = self.viewFrame.size.height / array.count;
    
    for (int i = 0; i < array.count ; i++) {
        GradientNormalLabel *label = [[GradientNormalLabel alloc]initWithFrame:
                                       CGRectMake(0, cellHeight * i , self.viewFrame.size.width, cellHeight )];
        [label setFont:FONT_MEDIUM_9];
        label.text = [array objectAtIndex:i];
        label.textAlignment = self.textAlign;
        [self addSubview:label];
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
