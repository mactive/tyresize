//
//  HandleView.h
//  tyresize
//
//  Created by mac on 13-3-21.
//  Copyright (c) 2013年 thinktube. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PassValueDelegate.h"

@interface HandleView : UIView

@property(strong, nonatomic)NSArray *dataArray;
@property(strong, nonatomic)NSNumber *dataNumber;
@property(assign, nonatomic)NSInteger index;
@property(assign, nonatomic)NSUInteger posIndex;
@property(readwrite, nonatomic)BOOL isLock;
@property(nonatomic,assign) NSObject<PassValueDelegate> *delegate;

- (void)setLockStatus:(BOOL)lockStatus;
@end
