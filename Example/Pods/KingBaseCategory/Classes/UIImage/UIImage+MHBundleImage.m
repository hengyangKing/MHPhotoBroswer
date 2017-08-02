//
//  UIImage+MHBundleImage.m
//  MHPhotoBroswerDemo
//
//  Created by J on 2017/6/6.
//  Copyright © 2017年 J. All rights reserved.
//

#import "UIImage+MHBundleImage.h"

@implementation UIImage (MHBundleImage)

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
