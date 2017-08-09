//
//  NSFileManager+MHReduceVideoPlistTools.h
//  musichome
//
//  Created by J on 2017/8/2.
//  Copyright © 2017年 J. All rights reserved.
//

#import <Foundation/Foundation.h>
//存储压缩用户视频信息plistfilename
#define MHThirdPartyVideoPlistFile @"UserTransformationVideo.plist"
//存储压缩用户视频信息plistfile中存储文件名的Key
#define MHThirdPartyVideoFileName @"MHThirdPartyVideoFileName"
//存储压缩用户视频信息plistfile中存储时间戳的Key
#define MHThirdPartyVideoCreateDate @"MHThirdPartyVideoCreateDate"
//存储压缩用户视频信息plistfile中 video存储路径
#define MHThirdPartyVideoSavePath @"MHThirdPartyVideoSavePath"
@interface NSFileManager (MHReduceVideoPlistTools)
/**
 *  查看plist中的过期项目在返回的数组中
 *
 *  @return 装有过期条目字典的数组
 */
-(NSMutableArray *)seekOverdueDataPlistWithDate;

/**
 压缩视频完成 存入plist文件钟保存
 
 @param videoName 被压缩视频文件名
 */
-(void)reduceVideo:(NSString *)videoName;


/**
 得到该文件的存储路径
 
 @param fileName 文件名
 @return 存储路径
 */
-(NSString *)getFilePath:(NSString *)fileName;
@end
