//
//  NSFileManager+MHJSyllabusFileTool.h
//  musichome
//
//  Created by J on 2017/8/2.
//  Copyright © 2017年 J. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (MHJSyllabusFileTool)
/**
 检测视频文件是否存在
 
 @param sectionId 章节id
 */
-(BOOL)isCacheSyllabusVideoSectionId:(NSInteger)sectionId;


/**
 检测zip文件是否存在
 
 @param sectionId 章节id
 */
-(BOOL)isCacheSyllabusZipSectionId:(NSInteger)sectionId;

/**
 得到存储zip文件的文件夹路径
 
 */
-(NSString *)getMusicHomeSyllabusZipPath;



/**
 得到zip文件的路径
 
 @param sectionId id
 @return path
 */
-(NSString *)getSyllabusZipFilePathSectionId:(NSInteger)sectionId;

/**
 得到videoPath
 
 @param sectionId 章节id
 */
-(NSString *)getSyllabusVideoFilePathSectionId:(NSInteger)sectionId;


/**
 删除zip文件
 */
-(void)removeSyllabusZipWithZipFileName:(NSString *)zipFileName;


/**
 删除文件夹
 
 @param sectionId id
 */
-(void)removeSyllabueFileWithSectionId:(NSInteger)sectionId;

/**
 读取readme.json
 
 @param sectionId 章节id
 @param success 成功的回调
 @param failure 失败的回调
 */
-(void)getREADMEDataWithSectionId:(NSInteger)sectionId andSuccess:(void (^)(NSDictionary *jsonDic))success failure:(void (^)(NSError  *error))failure;



/**
 更改文件名
 
 @param filePath 下载文件路径
 @param success 改名成功
 @param failure 改名失败
 */
-(void)renameToZipFile:(NSString *)filePath andSuccess:(void (^)(NSString *filePath))success failure:(void (^)(NSError  *error))failure;




@end
