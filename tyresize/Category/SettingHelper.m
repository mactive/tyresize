//
//  SettingHelper.m
//  tyresize
//
//  Created by mac on 13-8-4.
//  Copyright (c) 2013年 thinktube. All rights reserved.
//

#import "SettingHelper.h"

@implementation SettingHelper



+ (NSArray *)handleBG {
    static NSArray *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[NSArray alloc]initWithObjects:@"empty",
                         @"handle_lt_bg.png", @"handle_lm_bg.png", @"handle_lb_bg.png",
                         @"handle_rt_bg.png", @"handle_rm_bg.png", @"handle_rb_bg.png",
                         nil];
    });
    
    return _sharedClient;
}

// add button normal status background

+ (NSArray *)addBtnOnBG{
    static NSArray *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[NSArray alloc]initWithObjects:@"empty",
                         @"add_left_on.png", @"add_left_on.png", @"add_left_on.png",
                         @"add_right_on.png", @"add_right_on.png", @"add_right_on.png",
                         nil];
    });
    
    return _sharedClient;
}

// add button touchup inside status background

+ (NSArray *)addBtnOffBG{
    static NSArray *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[NSArray alloc]initWithObjects:@"empty",
                         @"add_left_off.png", @"add_left_off.png", @"add_left_off.png",
                         @"add_right_off.png", @"add_right_off.png", @"add_right_off.png",
                         nil];
    });
    
    return _sharedClient;
}

// minus button normal status background

+ (NSArray *)minusBtnOnBG{
    static NSArray *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[NSArray alloc]initWithObjects:@"empty",
                         @"minus_left_on.png", @"minus_left_on.png", @"minus_left_on.png",
                         @"minus_right_on.png", @"minus_right_on.png", @"minus_right_on.png",
                         nil];
    });
    
    return _sharedClient;
}

// minus button touchup inside status background

+ (NSArray *)minusBtnOffBG{
    static NSArray *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[NSArray alloc]initWithObjects:@"empty",
                         @"minus_left_off.png", @"minus_left_off.png", @"minus_left_off.png",
                         @"miuns_right_off.png", @"minus_right_off.png", @"minus_right_off.png",
                         nil];
    });
    
    return _sharedClient;
}

@end
