//
//  MainViewController.h
//  tyresize
//
//  Created by meng qian on 13-3-8.
//  Copyright (c) 2013年 thinktube. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PassValueDelegate.h"

@interface MainViewController : UIViewController<PassValueDelegate>
@property(strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
