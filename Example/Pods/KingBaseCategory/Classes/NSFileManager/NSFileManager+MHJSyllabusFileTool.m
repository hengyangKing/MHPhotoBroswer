//
//  NSFileManager+MHJSyllabusFileTool.m
//  musichome
//
//  Created by J on 2017/8/2.
//  Copyright © 2017年 J. All rights reserved.
//

#import "NSFileManager+MHJSyllabusFileTool.h"
#import "NSFileManager+MHFileHelper.h"

@implementation NSFileManager (MHJSyllabusFileTool)
-(void)getREADMEDataWithSectionId:(NSInteger)sectionId andSuccess:(void (^)(NSDictionary *jsonDic))success failure:(void (^)(NSError  *error))failure
{
    NSData *data=[self getREADMEDataWithSectionId:sectionId];
    if (!data) {
        if (failure) {
            NSError *error=[NSError errorWithDomain:@"readme is nil" code:1111110 userInfo:nil];
            failure(error);
        }
    }else{
        NSError *error;
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&error];
        if (error) {
            if (failure) {
                failure(error);
            }
        }else{
            if (success) {
                success(dic);
            }
        }
    }
}
-(BOOL)isCacheSyllabusVideoSectionId:(NSInteger)sectionId
{
    NSData *data=[self getREADMEDataWithSectionId:sectionId];
    if (!data) {
        return NO;
    }else{
        NSError *error;
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&error];
        if (error&&!dic) {
            return NO;
            
        }else{
            return YES;
        }
    }
}
-(NSData *)getREADMEDataWithSectionId:(NSInteger)sectionId
{
    NSString *filePath=[self getSyllabusVideoFilePathSectionId:sectionId];
    
    NSString *READMEPath=[NSString stringWithFormat:@"%@/README",filePath];
    
    NSData *data=[NSData dataWithContentsOfFile:READMEPath];
    
    return data;
}
-(BOOL)isCacheSyllabusZipSectionId:(NSInteger)sectionId
{
    NSString *zipPath=[self getSyllabusZipFilePathSectionId:sectionId];
    return [self fileExistsAtPath:zipPath];
}
-(NSString *)getMusicHomeSyllabusZipPath
{
    NSString *zipPath=[self getSyllabusZipFilePath];
    return zipPath;
}
-(NSString *)getMusicHomeSyllabusVideoPath
{
    NSString *videoPath=[self getSyllabusVideoFilePath];
    return videoPath;
}
-(NSString *)getSyllabusZipFilePathSectionId:(NSInteger)sectionId
{
    NSString *zipPath=[NSString stringWithFormat:@"%@/%ld.zip",[self getMusicHomeSyllabusZipPath],(long)sectionId];
    return zipPath;
}
-(NSString *)getSyllabusVideoFilePathSectionId:(NSInteger)sectionId
{
    NSString *videoPath=[NSString stringWithFormat:@"%@/%ld",[self getMusicHomeSyllabusVideoPath],(long)sectionId];
    return  videoPath;
}

-(NSString *)getSyllabus
{
    NSString *path=[self getMusicHomeSyllabusPath];
    [self hasLive:path];
    return path;
}
-(NSString *)getSyllabusZipFilePath
{
    NSString *zipPath=[NSString stringWithFormat:@"%@/SyllabusZip",[self getSyllabus]];
    [self hasLive:zipPath];
    return zipPath;
}
-(NSString *)getSyllabusVideoFilePath
{
    NSString *videoPath=[NSString stringWithFormat:@"%@/SyllabusVideo",[self getSyllabus]];
    [self hasLive:videoPath];
    return videoPath;
}
-(void)removeSyllabusZipWithZipFileName:(NSString *)zipFileName;
{
    NSString *zipPath=[NSString stringWithFormat:@"%@/%@.zip",[self getMusicHomeSyllabusZipPath],zipFileName];
    [self deleteFile:zipPath];
    
}
-(void)removeSyllabueFileWithSectionId:(NSInteger)sectionId
{
    NSString *filePath = [self getSyllabusVideoFilePathSectionId:sectionId];
    NSError *error;
    [self removeItemAtPath:filePath error:&error];
}


-(void)renameToZipFile:(NSString *)filePath andSuccess:(void (^)(NSString *filePath))success failure:(void (^)(NSError  *error))failure
{
    NSString *filePath2=[NSString stringWithFormat:@"%@.zip",filePath];
    //判断是否移动
    NSError *error;
    if ([self moveItemAtPath:filePath toPath:filePath2 error:&error] != YES){
        if (error&&failure) {
            failure(error);
        }
    }else{
        if (success) {
            success(filePath2);
        }
    }
}

@end
