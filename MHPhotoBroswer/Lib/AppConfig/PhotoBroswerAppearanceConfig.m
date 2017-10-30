//
//  PhotoBroswerAppearanceConfig.m
//  MHPhotoBroswer
//
//  Created by J on 2017/10/30.
//

#import "PhotoBroswerAppearanceConfig.h"
#import "UIImage+ReMake.h"
#import "MHBase.h"
@implementation PhotoBroswerAppearanceConfig
+(instancetype)defaultAppearance{
    PhotoBroswerAppearanceConfig *config = [[PhotoBroswerAppearanceConfig alloc]init];
    config.PhotoBroswerShowType(PhotoBroswerVCTypeModal).PhotoBroswerIsBlockStyle(YES);
    
    UIImage *image=config.isBlackStyle?[UIImage blackBGphImageWithSize:kScreenBounds.size zoom:.3f]:[UIImage whiteBGphImageWithSize:kScreenBounds.size zoom:.3f];
    
    config.PhotoBroswerPlaceholderImage(image);

    return config;
}
-(void)setShowType:(PhotoBroswerVCType)showType
{
    _showType=showType;
}
-(void)setIsBlackStyle:(BOOL)isBlackStyle
{
    _isBlackStyle=isBlackStyle;
}
-(void)setPlaceholderImage:(UIImage *)placeholderImage
{
    _placeholderImage=placeholderImage;
}
-(PhotoBroswerAppearanceConfig *(^)(BOOL))PhotoBroswerIsBlockStyle
{
    return ^(BOOL isBlockStyle){
        self.isBlackStyle=isBlockStyle;
        return self;
    };
}
-(PhotoBroswerAppearanceConfig *(^)(PhotoBroswerVCType))PhotoBroswerShowType
{
    return ^(PhotoBroswerVCType showType){
        self.showType=showType;
        return self;
    };
}
-(PhotoBroswerAppearanceConfig *(^)(UIImage *))PhotoBroswerPlaceholderImage
{
    return ^(UIImage *image){
        self.placeholderImage=image;
        return self;
    };
}

@end
