//
//  NSFileManager+MHDeleteFile.m
//  musichome
//
//  Created by J on 2017/8/2.
//  Copyright © 2017年 J. All rights reserved.
//

#import "NSFileManager+MHDeleteFile.h"
#import "NSFileManager+MHFilePath.h"
#import "NSFileManager+MHFileHelper.h"
#import <WebKit/WebKit.h>
@implementation NSFileManager (MHDeleteFile)
-(BOOL)deleteRecordAudioFile
{
    NSString *filePath=[NSString stringWithFormat:@"%@/MusicHomeRecorder/%@",[self getMusicHomeCachePath],kRecordAudioFile];
    return [self deleteFile:filePath];
}
-(BOOL)deleteRecordVideoFile
{
    NSString *filePath=[NSString stringWithFormat:@"%@/MusicHomeMovie/%@",[self getMusicHomeCachePath],kMovieFile];
    return  [self deleteFile:filePath];
}
-(BOOL)deleteUserFoundSmallMovieFile
{
    NSString *filePath=[NSString stringWithFormat:@"%@/MusicHomeSmallMovie/",[self getMusicHomeCachePath]];
    filePath=[filePath stringByAppendingPathComponent:kSmallMovieFile];
    return [self deleteFile:filePath];
}
-(void)clearWebCache
{
    NSSet *websiteDataTypes = [NSSet setWithArray:@[WKWebsiteDataTypeDiskCache,WKWebsiteDataTypeOfflineWebApplicationCache,WKWebsiteDataTypeMemoryCache,WKWebsiteDataTypeLocalStorage,WKWebsiteDataTypeCookies,WKWebsiteDataTypeSessionStorage,WKWebsiteDataTypeIndexedDBDatabases,WKWebsiteDataTypeWebSQLDatabases]];
    
    NSDate *dateFrom = [NSDate dateWithTimeIntervalSince1970:0];
    [[WKWebsiteDataStore defaultDataStore] removeDataOfTypes:websiteDataTypes modifiedSince:dateFrom completionHandler:^{
        
    }];
}


@end
