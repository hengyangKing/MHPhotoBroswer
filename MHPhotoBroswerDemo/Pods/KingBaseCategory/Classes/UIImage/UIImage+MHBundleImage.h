//
//  UIImage+MHBundleImage.h
//  MHPhotoBroswerDemo
//
//  Created by J on 2017/6/6.
//  Copyright © 2017年 J. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (MHBundleImage)
+(UIImage *)getBundleImageWithName:(NSString *)imageName andBundleName:(NSString *)bundleName;
@end
