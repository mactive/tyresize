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
#define IS_IPHONE_5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )

// unit transfrom
#define IN_MM 25.4f
#define FT_CM 30.48f
#define MI_KM 1.609f

#define MM_IN 0.0394f
#define CM_FT 0.0328f
#define KM_MI 0.621f

//#define DEFAULT_SYSTEM  METRIC
#define UKSYS           T(@"IMPERIAL")
#define USSYS           T(@"METRIC")


#define NOWW_INDEX 1
#define NOWA_INDEX 2
#define NOWR_INDEX 3
#define WANTW_INDEX 4
#define WANTA_INDEX 5
#define WANTR_INDEX 6

// base
#define TYRE_DIA_BASE 595.8f
#define HUB_DIA_BASE 406.4

// 默认值和做的图片关系很大 如果tyre的图 hub的图不是特别标准按照 真实尺寸来的话 default index就需要往图片上靠一靠了
// default
#define DEFAULT_NOWW_INDEX  7
#define DEFAULT_NOWA_INDEX  5
#define DEFAULT_NOWR_INDEX  6

#define DEFAULT_WANTW_INDEX  8
#define DEFAULT_WANTA_INDEX  2
#define DEFAULT_WANTR_INDEX  7

#define SPEED_LABEL_INDEX   5

#pragma mark - mactive

#define T(a)    NSLocalizedString((a), nil)

#define INT(a)  [NSNumber numberWithInt:(a)]
#define FLOAT(a)  [NSNumber numberWithFloat:(a)]
#define STR(a)  [NSString stringWithFormat:@"%@", (a)]
#define STR_INT(a)  [NSString stringWithFormat:@"%d", (a)]
#define STR_NUM(a)  [NSString stringWithFormat:@"%.0f", (a)]

#define NUMBER_OR_NIL(a)	\
(((a) && [(a) isKindOfClass:[NSNumber class]]) ? (a) : nil)

#define STRING_OR_NIL(a)	\
(((a) && [(a) isKindOfClass:[NSString class]]) ? (a) : nil)

#define STRING_OR_EMPTY(a)	\
(((a) && [(a) isKindOfClass:[NSString class]]) ? (a) : @"")

#define kDateFormat  @"yyyy'-'MM'-'dd'T'HH':'mm':'ss'Z"

// font
#define CUSTOMFONT [UIFont fontWithName:@"Museo" size:16.0f]
#define LITTLECUSTOMFONT [UIFont fontWithName:@"Museo" size:13.0f]
#define TINYCUSTOMFONT [UIFont fontWithName:@"Museo" size:11.0f]

// NSARRAY
#define TYRE_HEIGHT 160.0f
#define TYRE_WIDTH  160.0f
#define TOTAL_WIDTH 320.0f
#define TYRE_VIEW_HEIGHT 215.0f
#define NAV_BAR_HEIGHT 26.0f

#define P_W tyreWidth
#define P_A aspectRatio
#define P_R innerDiameter


// Color helpers

#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f \
alpha:(a)]

#define HSVCOLOR(h,s,v) [UIColor colorWithHue:(h) saturation:(s) value:(v) alpha:1]
#define HSVACOLOR(h,s,v,a) [UIColor colorWithHue:(h) saturation:(s) value:(v) alpha:(a)]

#define RGBA(r,g,b,a) (r)/255.0f, (g)/255.0f, (b)/255.0f, (a)
#define BGCOLOR [UIColor colorWithRed:255.0f/255.0 green:255.0/255.0 blue:253.0/255.0 alpha:1.0]
#define GREENCOLOR [UIColor colorWithRed:57.0f/255.0f green:181.0f/255.0f blue:74.0f/255.0f alpha:1]
#define REDCOLOR [UIColor colorWithRed:237.0f/255.0f green:28.0f/255.0f blue:36.0f/255.0f alpha:1]
#define GRAYCOLOR [UIColor colorWithRed:158.0f/255.0f green:158.0f/255.0f blue:158.0f/255.0f alpha:1]
#define HANDLEBORDERCOLOR [UIColor colorWithRed:228.0f/255.0f green:228.0f/255.0f blue:228.0f/255.0f alpha:1].CGColor
#define HANDLEBGCOLOR [UIColor colorWithRed:248.0f/255.0f green:248.0f/255.0f blue:248.0f/255.0f alpha:1]
#define DARKCOLOR [UIColor colorWithRed:57.0f/255.0f green:57.0f/255.0f blue:57.0f/255.0f alpha:1]



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
