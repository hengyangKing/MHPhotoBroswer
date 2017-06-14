//
//  CoreSVP.m
//
//  Created by muxi on 14/10/22.
//  Copyright (c) 2014年 muxi. All rights reserved.
//

#import "CoreSVP.h"
#import "UIFont+MHJFont.h"
//#import "UIImage+MHBundleImage.h"

@implementation CoreSVP


/**
 *  展示提示框
 *
 *  @param type          类型
 *  @param msg           文字
 *  @param duration      时间（当type=CoreSVPTypeLoadingInterface时无效）
 *  @param allowEdit     否允许编辑
 *  @param beginBlock    提示开始时的回调
 *  @param completeBlock 提示结束时的回调
 */
+(void)showSVPWithType:(CoreSVPType)type Msg:(NSString *)msg duration:(CGFloat)duration allowEdit:(BOOL)allowEdit beginBlock:(void(^)())beginBlock completeBlock:(void(^)())completeBlock{
    

//    dispatch_async(dispatch_get_main_queue(), ^{
     dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
         [self dismiss];

        //基本配置
        [self hudSetting];
        
        if(CoreSVPTypeBottomMsg == type){
            [SVProgressHUD setOffsetFromCenter:UIOffsetMake(0, [UIScreen mainScreen].bounds.size.height * .5f-49.0f)];
        }
         //设置时间和结束回调
        [SVProgressHUD dismissWithDelay:duration completion:completeBlock];
         
    
         UIImage *errorImage = [[self class] getBundleImageWithName:@"SVPError" andBundleName:@"CoreSVP"];
         
         UIImage *successImage =[[self class] getBundleImageWithName:@"SVPSuccess" andBundleName:@"CoreSVP"];
         
         if (errorImage) {
             //错误图片
             [SVProgressHUD setErrorImage:errorImage];
         }
         if (successImage) {
             //成功图片
             [SVProgressHUD setSuccessImage:successImage];
         }
        
        
        SVProgressHUDMaskType maskType=allowEdit?SVProgressHUDMaskTypeNone:SVProgressHUDMaskTypeClear;
        [SVProgressHUD setDefaultMaskType:maskType];
        
        //开始回调
        if(beginBlock != nil) beginBlock();
        
        dispatch_async(dispatch_get_main_queue(), ^{
            switch (type) {
                    
                case CoreSVPTypeCenterMsg:
                case CoreSVPTypeBottomMsg:
                    [SVProgressHUD showImage:nil status:msg];
                    break;
                    
                case CoreSVPTypeInfo:
                    [SVProgressHUD showInfoWithStatus:msg];
                    break;
                    
                case CoreSVPTypeLoadingInterface:
                    [SVProgressHUD showWithStatus:msg];
                    break;
                    
                case CoreSVPTypeError:
                    [SVProgressHUD showErrorWithStatus:msg];
                    break;
                    
                case CoreSVPTypeSuccess:
                    [SVProgressHUD showSuccessWithStatus:msg];
                    break;
                    
                default:
                    break;
            }
        });
    });

}
/*
 *  进度
 */
+(void)showProgess:(CGFloat)progress Msg:(NSString *)msg maskType:(SVProgressHUDMaskType)maskType{
    
    if (progress<=0) progress = 0;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        //基本配置
        [self hudSetting];
        [SVProgressHUD showProgress:progress status:msg];
        [SVProgressHUD setDefaultMaskType:maskType];
        
        if(progress>=1) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.5f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self dismiss];
            });
        }
    });
}


/*
 *  基本配置
 */
+(void)hudSetting{
    
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];

    
    //设置背景色
    [SVProgressHUD setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.68]];
    
    //文字颜色
    [SVProgressHUD setForegroundColor:[UIColor whiteColor]];
    
    //字体大小
    [SVProgressHUD setFont:[UIFont MHFont:16]];
}


/**
 *  隐藏提示框
 */
+(void)dismiss{
    dispatch_async(dispatch_get_main_queue(), ^{
        [SVProgressHUD dismiss];
    });
}
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
