//
//  AppDelegate.h
//  tyresize
//
//  Created by meng qian on 13-3-8.
//  Copyright (c) 2013年 thinktube. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MainViewController;
@class KBViewController;
@class OtherViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (strong, nonatomic) MainViewController *mainViewController;
@property (strong, nonatomic) KBViewController *kbViewController;
@property (strong, nonatomic) OtherViewController *otherViewController;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
