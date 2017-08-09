//
//  NSFileManager+MHDeleteFile.h
//  musichome
//
//  Created by J on 2017/8/2.
//  Copyright © 2017年 J. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (MHDeleteFile)
/**
 *  删除录音文件
 */
-(BOOL)deleteRecordAudioFile;


/**
 *  删除用户录制完成转码小视频文件
 */
-(BOOL)deleteUserFoundSmallMovieFile;

/**
 *  删除用户录制的视频文件
 */
-(BOOL)deleteRecordVideoFile;


/**
 删除web缓存
 */
-(void)clearWebCache;
@end
