//
//  MultilineView.h
//  tyresize
//
//  Created by mac on 13-8-25.
//  Copyright (c) 2013年 thinktube. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MultilineView : UIView

@property(nonatomic, strong)NSString *multiLineText;
@property(nonatomic, assign)NSTextAlignment textAlign;
@property(nonatomic, assign)UIFont *font;

@end
