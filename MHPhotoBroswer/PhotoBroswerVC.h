
#import <UIKit/UIKit.h>
#import "PhotoModel.h"
#import "PhotoBroswerType.h"

@interface PhotoBroswerVC : UIViewController
//    ../MHPhotoBroswer/MHPhotoBroswer.framework/PB.bundle/

+(void)show:(UIViewController *)handleVC type:(PhotoBroswerVCType)type index:(NSUInteger)index  photoModelBlock:(NSArray *(^)())photoModelBlock andBGColorIsBlackColor:(BOOL )isBlackColor;

@end
