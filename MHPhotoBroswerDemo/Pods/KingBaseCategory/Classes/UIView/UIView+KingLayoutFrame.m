//
//  UIView+KingLayoutFrame.m
//  KingFM
//
//  Created by J on 2017/6/1.
//  Copyright © 2017年 J. All rights reserved.
//

#import "UIView+KingLayoutFrame.h"

@implementation UIView (KingLayoutFrame)

- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}


- (CGFloat)height
{
    return self.frame.size.height;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}


-(void)setCenterX:(CGFloat)centerX
{
    CGPoint center=self.center;
    center.x=centerX;
    self.center=center;
}
-(CGFloat)centerX
{
    return self.center.x;
}

-(void)setCenterY:(CGFloat)centerY
{
    CGPoint center=self.center;
    center.y=centerY;
    self.center=center;
}

-(CGFloat)centerY
{
    return self.center.y;
}



-(CGFloat)getMaxY
{
    return CGRectGetMaxY(self.frame);
}
-(CGFloat)getMaxX
{
    return CGRectGetMaxX(self.frame);
}
-(CGFloat)getMinY
{
    return CGRectGetMinY(self.frame);
}
-(CGFloat)getMinX
{
    return CGRectGetMinX(self.frame);
}
-(CGFloat)getMidX
{
    return CGRectGetMidX(self.frame);
}
-(CGFloat)getMidY
{
    return CGRectGetMidY(self.frame);
}

-(void)addCornerRadius:(CGFloat)radius
{
    self.layer.cornerRadius=radius;
    self.layer.masksToBounds=YES;
}

@end
