//
//  UITabBar+CustomTab.m
//  tyresize
//
//  Created by mac on 13-8-12.
//  Copyright (c) 2013年 thinktube. All rights reserved.
//

#import "UITabBar+CustomTab.h"

@implementation UITabBar (CustomTab)

- (CGSize)sizeThatFits:(CGSize)size {
    CGSize newSize = CGSizeMake(TOTAL_WIDTH,44);
    [self setBackgroundImage:[UIImage imageNamed:@"btnView_bg.png"]];
    return newSize;
}


@end
