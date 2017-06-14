//
//  PBSaveBtn.m
//  CorePhotoBroswerVC
//
//  Created by 冯成林 on 15/5/7.
//  Copyright (c) 2015年 冯成林. All rights reserved.
//

#import "PBSaveBtn.h"
#import "MHPBBundleImage.h"
@implementation PBSaveBtn


-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if(self){
        
        //视图准备
        [self viewPrepare];
    }
    
    return self;
}


-(id)initWithCoder:(NSCoder *)aDecoder{
    
    self=[super initWithCoder:aDecoder];
    
    if(self){
        
        //视图准备
        [self viewPrepare];
    }
    
    return self;
}



/*
 *  视图准备
 */
-(void)viewPrepare{
    
    [self setImage:[MHPBBundleImage getBundleImageWithName:@"preview_save_icon" andBundleName:@"PB"] forState:UIControlStateNormal];
    
    [self setImage:[MHPBBundleImage getBundleImageWithName:@"preview_save_icon_highlighted" andBundleName:@"PB"] forState:UIControlStateHighlighted];
    
    [self setImage:[MHPBBundleImage getBundleImageWithName:@"preview_save_icon_disable" andBundleName:@"PB"] forState:UIControlStateDisabled];
}
@end
