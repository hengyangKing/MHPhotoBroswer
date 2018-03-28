#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "MHBase.h"
#import "MHConst.h"
#import "MHSington.h"

FOUNDATION_EXPORT double MHBaseConstVersionNumber;
FOUNDATION_EXPORT const unsigned char MHBaseConstVersionString[];

