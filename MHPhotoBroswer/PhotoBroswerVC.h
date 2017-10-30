
#import <UIKit/UIKit.h>
#import "PhotoModel.h"
#import "PhotoBroswerAppearanceConfig.h"

@interface PhotoBroswerVC : UIViewController


+(void)show:(UIViewController *)handleVC andAppConfig:(void (^)(PhotoBroswerAppearanceConfig *config))appConfig photoModelBlock:(NSArray *(^)(void))photoModelBlock;
@end
