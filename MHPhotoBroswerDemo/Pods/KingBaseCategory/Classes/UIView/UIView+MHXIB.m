//
//  UIView+MHXIB.m
//  musichome
//
//  Created by J on 2017/6/4.
//  Copyright © 2017年 J. All rights reserved.
//

#import "UIView+MHXIB.h"

@implementation UIView (MHXIB)
/**
 *  自动从xib创建视图
 */
+(instancetype)viewFromXIB{
    
    NSString *name=NSStringFromClass(self);
    UIView *xibView=[[[NSBundle bundleForClass:self] loadNibNamed:name owner:nil options:nil] firstObject];
    
    if(xibView==nil){
        NSLog(@"CoreXibView：从xib创建视图失败，当前类是：%@",name);
    }
    return xibView;
}

@end
