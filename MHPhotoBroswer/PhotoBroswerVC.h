
#import <UIKit/UIKit.h>
#import "PhotoModel.h"
#import "PhotoBroswerAppearanceConfig.h"
@interface PhotoBroswerVC : UIViewController

+(void)show:(UIViewController *)handleVC withAppearanceConfig:(void (^)(PhotoBroswerAppearanceConfig *config))config andPhotoModelBlock:(NSArray *(^)(void))photoModelBlock;

@end
