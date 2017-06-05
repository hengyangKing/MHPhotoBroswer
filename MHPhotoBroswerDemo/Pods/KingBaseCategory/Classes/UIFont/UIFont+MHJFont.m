//
//  UIFont+MHJFont.m
//  musichome
//
//  Created by J on 2017/6/3.
//  Copyright © 2017年 J. All rights reserved.
//

#import "UIFont+MHJFont.h"
#import "NSObject+MHJDeviceTools.h"
@implementation UIFont (MHJFont)



+(CGFloat )getFontSizeWithStandardFontSize:(CGFloat )size
{
    
    MHJDeviceType type=[self getDeviceModel];
    
    if (type==iphone4and4s||type==iphone5and5sandiphoneSE) {
        
        return size-1.0;
        
    }else if (type==iphone6and6sand7){
        return size;
    }else{
        return size+1.0;
    }
}

+(UIFont *)MHFont:(CGFloat)fontSize
{
    CGFloat needSize=[self getFontSizeWithStandardFontSize:fontSize];
    return [UIFont fontWithName:@"PingFangSC-Regular" size:needSize]?[UIFont fontWithName:@"PingFangSC-Regular" size:needSize]:[UIFont systemFontOfSize:needSize];
}

+(UIFont *)MHMFont:(CGFloat)fontSize
{
    CGFloat needSize=[self getFontSizeWithStandardFontSize:fontSize];
    
    return [UIFont fontWithName:@"PingFangSC-Medium" size:needSize]?[UIFont fontWithName:@"PingFangSC-Medium" size:needSize]:[UIFont boldSystemFontOfSize:needSize];
}
@end
