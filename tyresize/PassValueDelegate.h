//
//  PassValueDelegate.h
//  tyresize
//
//  Created by mac on 13-3-24.
//  Copyright (c) 2013年 thinktube. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PassValueDelegate <NSObject>

@optional
-(void)passStringValue:(NSString *)value andIndex:(NSUInteger )index;
-(void)passNumberValue:(NSNumber *)value andIndex:(NSUInteger )index;
-(void)passNSDateValue:(NSDate *)value andIndex:(NSUInteger)index;

@end
