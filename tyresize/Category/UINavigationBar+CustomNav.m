//
//  UINavigationBar+CustomNav.m
//  tyresize
//
//  Created by mac on 13-8-2.
//  Copyright (c) 2013年 thinktube. All rights reserved.
//

#import "UINavigationBar+CustomNav.h"

@implementation UINavigationBar (CustomNav)

- (CGSize)sizeThatFits:(CGSize)size {
    CGSize newSize = CGSizeMake(TOTAL_WIDTH,NAV_BAR_HEIGHT);
    self.topItem.title = @"";
    return newSize;
}



@end
