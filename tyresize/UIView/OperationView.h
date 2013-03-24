//
//  OperationView.h
//  tyresize
//
//  Created by mac on 13-3-20.
//  Copyright (c) 2013年 thinktube. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PassValueDelegate.h"


@interface OperationView : UIView<PassValueDelegate>

- (NSNumber *)calculation;

@end
