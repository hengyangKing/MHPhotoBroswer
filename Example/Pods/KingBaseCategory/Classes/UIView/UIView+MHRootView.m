//
//  UIView+MHRootView.m
//  musichome
//
//  Created by J on 2017/8/4.
//  Copyright © 2017年 J. All rights reserved.
//

#import "UIView+MHRootView.h"

@implementation UIView (MHRootView)
+(UIView *)MHRootView{
    UIViewController *appRootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
    UIViewController *topVC = appRootVC;
    while (topVC.presentedViewController) {
        topVC = topVC.presentedViewController;
    }
    return topVC.view;

}
@end
