//
//  UIImage+KingExtension.h
//  KingFM
//
//  Created by J on 2017/6/1.
//  Copyright © 2017年 J. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (KingExtension)
/**
 得到原图
 */
- (UIImage *)originImage;
/**
 拉伸图片
 */
+ (UIImage *)stretchableImage: (UIImage *)image;
/**
 自定义比例拉伸图片
 
 */
+(UIImage *)stretchableImage: (UIImage *)image leftCap:(CGFloat)leftCap topCap:(CGFloat)topCap;

/**
 圆形图片
 */
- (UIImage *)circle;



/**
 得到图片某像素颜色
 */
- (UIColor *)colorAtPixelPoint:(CGPoint)point;






@end
