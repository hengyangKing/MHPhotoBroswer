//
//  UIView+KingLayoutFrame.h
//  KingFM
//
//  Created by J on 2017/6/1.
//  Copyright © 2017年 J. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (KingLayoutFrame)
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property(nonatomic,assign)CGFloat centerX;
@property(nonatomic,assign)CGFloat centerY;



-(CGFloat)getMaxY;

-(CGFloat)getMaxX;

-(CGFloat)getMinY;

-(CGFloat)getMinX;

-(CGFloat)getMidX;

-(CGFloat)getMidY;

-(void)addCornerRadius:(CGFloat )radius;


@end
