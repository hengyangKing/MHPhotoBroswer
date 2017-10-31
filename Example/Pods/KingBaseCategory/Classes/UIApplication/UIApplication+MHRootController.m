//
//  UIApplication+MHRootController.m
//  musichome
//
//  Created by J on 2017/8/9.
//  Copyright © 2017年 J. All rights reserved.
//

#import "UIApplication+MHRootController.h"

@implementation UIApplication (MHRootController)
-(UIViewController *)root
{
    UIViewController *appRootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
    UIViewController *topVC = appRootVC;
    while (topVC.presentedViewController) {
        topVC = topVC.presentedViewController;
    }
    return topVC;
}
@end
