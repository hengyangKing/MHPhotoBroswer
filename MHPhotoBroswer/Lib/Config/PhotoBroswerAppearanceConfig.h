//
//  PhotoBroswerAppearanceConfig.h
//  MHPhotoBroswer
//
//  Created by J on 2017/10/30.
//

#import <Foundation/Foundation.h>
#import "PhotoBroswerType.h"

@interface PhotoBroswerAppearanceConfig : NSObject

+(instancetype)defaultAppearance;

@property (nonatomic,assign,readonly) PhotoBroswerVCType showType;

@property (nonatomic,assign,readonly) BOOL isBlackStyle;

@property (nonatomic,strong,readonly) UIImage *placeholderImage;

/**
 初始位置
 */
@property (nonatomic,assign,readonly) NSUInteger startIndex;


@property (nonatomic,copy,readonly) PhotoBroswerAppearanceConfig * (^PhotoBroswerShowType)(PhotoBroswerVCType showType);

@property (nonatomic,copy,readonly) PhotoBroswerAppearanceConfig * (^PhotoBroswerIsBlockStyle)(BOOL isBlockStyle);

@property (nonatomic,copy,readonly)PhotoBroswerAppearanceConfig *(^PhotoBroswerPlaceholderImage)(UIImage *image);

@property (nonatomic,copy,readonly)PhotoBroswerAppearanceConfig *(^PhotoBroswerStartIndex)(NSUInteger index);


@end
