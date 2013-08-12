//
//  MainViewController.h
//  tyresize
//
//  Created by meng qian on 13-3-8.
//  Copyright (c) 2013年 thinktube. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PassValueDelegate.h"
#import "LockNowTyreDelegate.h"

@interface MainViewController : UIViewController<PassValueDelegate,LockNowTyreDelegate>
@property(strong, nonatomic) NSManagedObjectContext *managedObjectContext;

-(void)switchAction;

@end
