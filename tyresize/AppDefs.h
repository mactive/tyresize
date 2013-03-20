//
//  AppDefs.h
//  tyresize
//
//  Created by mac on 13-3-20.
//  Copyright (c) 2013年 thinktube. All rights reserved.
//

#ifndef tyresize_AppDefs_h
#define tyresize_AppDefs_h

#define M_APPLEID 623336978



#pragma mark - mactive

#define T(a)    NSLocalizedString((a), nil)

#define INT(a)  [NSNumber numberWithInt:(a)]
#define STR(a)  [NSString stringWithFormat:@"%@", (a)]
#define STR_INT(a)  [NSString stringWithFormat:@"%d", (a)]

#define NUMBER_OR_NIL(a)	\
(((a) && [(a) isKindOfClass:[NSNumber class]]) ? (a) : nil)

#define STRING_OR_NIL(a)	\
(((a) && [(a) isKindOfClass:[NSString class]]) ? (a) : nil)

#define STRING_OR_EMPTY(a)	\
(((a) && [(a) isKindOfClass:[NSString class]]) ? (a) : @"")

#define kDateFormat  @"yyyy'-'MM'-'dd'T'HH':'mm':'ss'Z"

// font
#define CUSTOMFONT [UIFont fontWithName:@"Museo" size:20.0f]

// NSARRAY


// Color helpers

#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f \
alpha:(a)]

#define HSVCOLOR(h,s,v) [UIColor colorWithHue:(h) saturation:(s) value:(v) alpha:1]
#define HSVACOLOR(h,s,v,a) [UIColor colorWithHue:(h) saturation:(s) value:(v) alpha:(a)]

#define RGBA(r,g,b,a) (r)/255.0f, (g)/255.0f, (b)/255.0f, (a)
#define BGCOLOR [UIColor colorWithRed:255.0f/255.0 green:255.0/255.0 blue:253.0/255.0 alpha:1.0]
#define GREENCOLOR [UIColor colorWithRed:57.0f/255.0f green:181.0f/255.0f blue:74.0f/255.0f alpha:1]
#define SEPCOLOR [UIColor colorWithRed:225.0f/255.0f green:225.0f/255.0f blue:225.0f/255.0f alpha:1]
#define TEXTFIELD_BGCOLOR [UIColor colorWithRed:238.0f/255.0f green:238.0f/255.0f blue:238.0f/255.0f alpha:1]
#define TEXTFIELD_BORDERCOLOR [UIColor colorWithRed:147.0f/255.0f green:150.0f/255.0f blue:157.0f/245.0f alpha:1]
#define BIGBOSS_BLUE [UIColor colorWithRed:50.0f/255.0f green:135.0f/255.0f blue:193.0f/245.0f alpha:1]
#define LIVID_COLOR [UIColor colorWithRed:76.0f/255.0f green:84.0f/255.0f blue:94.0f/245.0f alpha:1]
#define SEPCOLOR1 [UIColor colorWithRed:182.0/255.0 green:192.0/255.0 blue:200.0/255.0 alpha:1.0]
#define SEPCOLOR2 [UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:1.0]



#pragma mark - Core Data

#define MOCSave(managedObjectContext) { \
NSError __autoreleasing *error = nil; \
NSAssert([managedObjectContext save:&error], @"-[NSManagedObjectContext save] error:\n\n%@", error); }

#define MOCCount(managedObjectContext, fetchRequest) \
NSManagedObjectContextCount(self, _cmd, managedObjectContext, fetchRequest)

#define MOCCountAll(managedObjectContext, entityName) \
MOCCount(_managedObjectContext, [NSFetchRequest fetchRequestWithEntityName:entityName])

NS_INLINE NSUInteger NSManagedObjectContextCount(id self, SEL _cmd, NSManagedObjectContext *managedObjectContext, NSFetchRequest *fetchRequest) {
    NSError __autoreleasing *error = nil;
    NSUInteger objectsCount = [managedObjectContext countForFetchRequest:fetchRequest error:&error];
    NSAssert(objectsCount != NSNotFound, @"-[NSManagedObjectContext countForFetchRequest:error:] error:\n\n%@", error);
    return objectsCount;
}

NS_INLINE BOOL StringHasValue(NSString * str) {
    return (str != nil) && (![str isEqualToString:@""]);
}


#endif
