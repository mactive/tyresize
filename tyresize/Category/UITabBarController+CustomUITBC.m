//
//  UITabBarController+CustomUITBC.m
//  tyresize
//
//  Created by mac on 13-8-12.
//  Copyright (c) 2013年 thinktube. All rights reserved.
//

#import "UITabBarController+CustomUITBC.h"
#import "ColoredButton.h"


@implementation UITabBarController (CustomUITBC)


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self.tabBar setBackgroundImage:[UIImage imageNamed:@"btnView_bg.png"]];
        [self.tabBar setFrame:CGRectMake(0, TOTAL_HEIGHT-44, TOTAL_WIDTH, 44)];
        [self.tabBar setSelectionIndicatorImage:[UIImage imageNamed:@"btnOn_bg.png"]];

    }
    return self;
}

- (void)changeViewController:(id) sender
{
    UIButton *button = (UIButton *) sender;
    self.selectedIndex = button.tag;
}


@end
