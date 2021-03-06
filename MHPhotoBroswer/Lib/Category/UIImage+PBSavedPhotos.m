//
//  UIImage+PBSavedPhotos.m
//  musichome
//
//  Created by J on 2017/6/5.
//  Copyright © 2017年 J. All rights reserved.
//

#import "UIImage+PBSavedPhotos.h"
#import <objc/runtime.h>

static const void *CompleteBlockKey = &CompleteBlockKey;
static const void *FailBlockKey = &FailBlockKey;

@interface UIImage ()

@property (nonatomic,copy)  void(^CompleteBlock)(void);

@property (nonatomic,copy)  void(^FailBlock)(void);

@end

@implementation UIImage (PBSavedPhotos)
/**
 *  保存相册
 *
 *  @param completeBlock 成功回调
 *  @param failBlock 出错回调
 */
-(void)savedPhotosAlbum:(void(^)(void))completeBlock failBlock:(void(^)(void))failBlock{
    
    UIImageWriteToSavedPhotosAlbum(self, self, @selector(image:didFinishSavingWithError:contextInfo:),NULL);
    
    self.CompleteBlock = completeBlock;
    self.FailBlock = failBlock;
}




- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo{
    
    if(error == nil){
        if(self.CompleteBlock != nil) self.CompleteBlock();
    }else{
        if(self.FailBlock !=nil) self.FailBlock();
    }
    
}
/*
 *  模拟成员变量
 */
-(void (^)(void))FailBlock{
    return objc_getAssociatedObject(self, FailBlockKey);
}
-(void)setFailBlock:(void (^)(void))FailBlock{
    objc_setAssociatedObject(self, FailBlockKey, FailBlock, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(void (^)(void))CompleteBlock{
    return objc_getAssociatedObject(self, CompleteBlockKey);
}

-(void)setCompleteBlock:(void (^)(void))CompleteBlock{
    objc_setAssociatedObject(self, CompleteBlockKey, CompleteBlock, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
