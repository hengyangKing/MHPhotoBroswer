//
//  NSFileManager+MHImagePickerTools.m
//  musichome
//
//  Created by J on 2017/8/2.
//  Copyright © 2017年 J. All rights reserved.
//

#import "NSFileManager+MHImagePickerTools.h"
#import "NSFileManager+MHFilePath.h"
#import "NSFileManager+MHFileHelper.h"
#import "NSFileManager+MHReduceVideoPlistTools.h"
@implementation NSFileManager (MHImagePickerTools)

-(BOOL)isReduced:(NSString *)fileName{
    
    NSArray *files = [self contentsOfDirectoryAtPath:[self getSmallMovieFilePath] error:nil];
    for (NSString *name in files) {
        if ([name hasSuffix:@".mp4"]&&[name isEqualToString:fileName]){
            return YES;
        }
    }
    return NO;
}
-(void)deleteTimeOutReduceVideo
{
    NSMutableArray *videoDatas=[self seekOverdueDataPlistWithDate];
    for (NSDictionary *dic in videoDatas){
        NSString *fileName=[dic objectForKey:MHThirdPartyVideoFileName];
        NSString *filePath=[[dic objectForKey:MHThirdPartyVideoSavePath] stringByAppendingPathComponent:fileName];
        ([self deleteFile:filePath]);
    }
}





@end
