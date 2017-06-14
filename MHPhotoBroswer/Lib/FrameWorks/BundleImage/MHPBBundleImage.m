//
//  MHPBBundleImage.m
//  Pods
//
//  Created by J on 2017/6/6.
//
//

#import "MHPBBundleImage.h"

@implementation MHPBBundleImage
+(UIImage *)getBundleImageWithName:(NSString *)imageName andBundleName:(NSString *)bundleName
{
    if (!bundleName.length) {
        bundleName=NSStringFromClass(self);
    }
    NSBundle *bundle = [NSBundle bundleForClass:self];
    NSURL *url = [bundle URLForResource:bundleName withExtension:@"bundle"];
    if (!url) {
        return nil;
    }
    NSBundle *imageBundle = [NSBundle bundleWithURL:url];
    
    return [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@.png",imageBundle.bundlePath,imageName]];
    
}
@end
