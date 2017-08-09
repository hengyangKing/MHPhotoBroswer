//
//  NSObject+MHJDeviceTools.m
//  musichome
//
//  Created by J on 2016/12/14.
//  Copyright © 2016年 J. All rights reserved.
//

#import "NSObject+MHJDeviceTools.h"
#import <AdSupport/AdSupport.h>
@implementation NSObject (MHJDeviceTools)

-(double)getSelfDevice
{
    return    [[[UIDevice currentDevice] systemVersion] doubleValue];
}
-(MHJDeviceType)getDeviceModel
{

    double h=[[UIScreen mainScreen] bounds].size.height;
    if (h==480){
        return iphone4and4s;
    }else if (h==568){
        return iphone5and5sandiphoneSE;
    }else if (h==667){
        return iphone6and6sand7;
    }
    return iphone6plusandiphone6splusand7plus;
}
//得到ADID
-(NSString *)ADID{
    
    NSString *adid = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
    return adid;
    
}

-(NSString *)MHJVersion
{
    //添加版本信息
    //    basic/check?v=1.0.1_12&basicVer=20140812
    NSString *currentVersion=[NSBundle mainBundle].infoDictionary[@"CFBundleVersion"];
    
    //    CFBundleShortVersionString
    NSString *ShortVersion=[NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"];
    
    NSString *version=[NSString stringWithFormat:@"%@_%@",ShortVersion,currentVersion];
    
    return version;
}



@end
