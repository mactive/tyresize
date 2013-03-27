//
//  LockNowTyreDelegate.h
//  tyresize
//
//  Created by mac on 13-3-28.
//  Copyright (c) 2013年 thinktube. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol LockNowTyreDelegate <NSObject>

@optional

-(void)lockNowTyre;
-(void)unlockNowTyre;

@end
