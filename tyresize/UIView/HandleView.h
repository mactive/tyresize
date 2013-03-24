//
//  HandleView.h
//  tyresize
//
//  Created by mac on 13-3-21.
//  Copyright (c) 2013年 thinktube. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HandleView : UIView

@property(strong, nonatomic)NSArray *dataArray;
@property(strong, nonatomic)NSNumber *dataNumber;
@property(readwrite, nonatomic)NSInteger index;
@property(readwrite, nonatomic)BOOL isLock;

- (void)setLockStatus:(BOOL)lockStatus;
@end
