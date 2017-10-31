//
//  MHCoreSVP.m
//  musichome
//
//  Created by J on 2017/6/2.
//  Copyright © 2017年 J. All rights reserved.
//

#import "MHCoreSVP.h"
#import "CoreSVP.h"
@implementation MHCoreSVP

+(void)hideMHHUD
{
    [CoreSVP dismiss];
}
+(void)showMHHUD
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [CoreSVP dismiss];
        [CoreSVP hudSetting];
        [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
        [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
        [SVProgressHUD show];
    });
}
+(void)showMHMsg:(NSString *)msg andCompleteBlock:(void(^)(void))completeBlock
{
    [CoreSVP showSVPWithType:(CoreSVPTypeCenterMsg) Msg:msg duration:1.5 allowEdit:NO beginBlock:nil completeBlock:completeBlock];
}
@end
