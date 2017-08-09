//
//  NSFileManager+MHFileSize.m
//  musichome
//
//  Created by J on 2017/8/2.
//  Copyright © 2017年 J. All rights reserved.
//

#import "NSFileManager+MHFileSize.h"
#import "NSFileManager+MHFilePath.h"
#import "NSFileManager+MHFileHelper.h"

@implementation NSFileManager (MHFileSize)
/**
 *  检测正在录制视频文件大小
 */
-(BOOL)recordingVideoFileIsOverflow:(float (^)())maxsize
{
    NSString *filePath=[[self getSaveMovieFileURL]absoluteString];
    if ([self fileExistsAtPath:filePath])
    {
        unsigned long long f=[[self attributesOfItemAtPath:filePath error:nil] fileSize];
        float fileSize=f/1024.0/1024.0;
        if (maxsize) {
            return (fileSize>=maxsize()-1.0)?YES:NO;
        }else{
            return (fileSize>=30-1.0)?YES:NO;
        }
    }
    return NO;
}

/**
 *  检测正在录制音频文件大小
 */
-(BOOL)recordingAudioFileIsOverflow:(float (^)())maxsize
{
    
    NSString *filePath=[[self getSaveRecorderPath]absoluteString];
    
    if ([self fileExistsAtPath:filePath])
    {
        unsigned long long f=[[self attributesOfItemAtPath:filePath error:nil] fileSize];
        float fileSize=f/1024.0/1024.0;
        if (maxsize) {
            return (fileSize>=maxsize()-1.0)?YES:NO;
        }else{
            return (fileSize>=30-1.0)?YES:NO;
        }
    }
    return NO;
}
/**
 *  检测转码后的文件大小
 */
-(BOOL)ReducedVideoIsIsOverflow:(float (^)())maxsize andFileName:(NSString *)fileName
{
    NSString *outputPath=[[self getSmallMovieFilePath] stringByAppendingPathComponent:fileName];
    
    if ([self fileExistsAtPath:outputPath]){
        unsigned long long f=[[self attributesOfItemAtPath:outputPath error:nil] fileSize];
        
        float fileSize=f/1024.0/1024.0;
        if (maxsize) {
            return (fileSize<maxsize())?YES:NO;
        }else{
            return (fileSize<30)?YES:NO;
        }
    }
    return NO;
}

@end
