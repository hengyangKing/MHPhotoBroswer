//
//  UIImageView+MHJaddShadow.m
//  musichome
//
//  Created by J on 2017/4/13.
//  Copyright © 2017年 J. All rights reserved.
//

#import "UIImageView+MHJAddShadow.h"
#import "UIImageView+Extension.h"
@implementation UIImageView (MHJAddShadow)
-(void)addShadowWithRadius:(CGFloat)radius
{
    self.shadowColor = [UIColor colorWithRed:(0)/255.0f green:(0)/255.0f blue:(0)/255.0f alpha:1.0];
    self.shadowRadius = radius ;
    self.shadowXOffset = 0.0 ;
    self.shadowYOffset = 0.0 ;
    [self setImageCornerRadius:radius];
}
@end
