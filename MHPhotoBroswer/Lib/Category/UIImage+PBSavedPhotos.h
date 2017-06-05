//
//  UIImage+PBSavedPhotos.h
//  musichome
//
//  Created by J on 2017/6/5.
//  Copyright © 2017年 J. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (PBSavedPhotos)
/**
 *  保存相册
 *
 *  @param completeBlock 成功回调
 *  @param completeBlock 出错回调
 */
-(void)savedPhotosAlbum:(void(^)())completeBlock failBlock:(void(^)())failBlock;

@end
