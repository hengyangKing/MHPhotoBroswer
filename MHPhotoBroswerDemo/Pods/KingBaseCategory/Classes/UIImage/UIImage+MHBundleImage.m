//
//  UIImage+MHBundleImage.m
//  MHPhotoBroswerDemo
//
//  Created by J on 2017/6/6.
//  Copyright © 2017年 J. All rights reserved.
//

#import "UIImage+MHBundleImage.h"

@implementation UIImage (MHBundleImage)

+(UIImage *)getBundleImageWithName:(NSString *)imageName
{
    NSBundle *bundle = [NSBundle bundleForClass:self];
    NSURL *url = [bundle URLForResource:@"CoreSVP" withExtension:@"bundle"];
    NSBundle *imageBundle = [NSBundle bundleWithURL:url];
    UIImage *image=[UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@.png",imageBundle.bundlePath,imageName]];
    if (image) {
        return image;
    }else{
        return nil;
    }
}
@end
