//
//  MHCoreSVP.h
//  musichome
//
//  Created by J on 2017/6/2.
//  Copyright © 2017年 J. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MHCoreSVP : NSObject
+(void)hideMHHUD;
+(void)showMHHUD;
+(void)showMHMsg:(NSString *)msg andCompleteBlock:(void(^)(void))completeBlock;

@end
