//
//  NSFileManager+MHFilePath.m
//  musichome
//
//  Created by J on 2017/8/2.
//  Copyright © 2017年 J. All rights reserved.
//

#import "NSFileManager+MHFilePath.h"
#import "NSFileManager+MHFileHelper.h"
@implementation NSFileManager (MHFilePath)
-(NSURL *)getSaveRecorderPath{
    
    NSString *path=[self getMusicHomeCachePath];
    NSString *filePath=[NSString stringWithFormat:@"%@/MusicHomeRecorder/",path];
    [self hasLive:filePath];
    filePath=[filePath stringByAppendingPathComponent:kRecordAudioFile];
    NSURL *url=[NSURL fileURLWithPath:filePath];
    return url;
}

-(NSURL *)getSaveMovieFileURL
{
    NSString *path=[self getMusicHomeCachePath];
    
    NSString *filePath=[NSString stringWithFormat:@"%@/MusicHomeMovie/",path];
    [self hasLive:filePath];
    filePath=[filePath stringByAppendingPathComponent:kMovieFile];
    return [NSURL fileURLWithPath:filePath];
}

-(NSString *)getSmallMovieFilePath;
{
    NSString *path=[self getMusicHomeCachePath];
    NSString *filePath=[NSString stringWithFormat:@"%@/MusicHomeSmallMovie/",path];
    [self hasLive:filePath];
    return filePath;
    
}


@end
