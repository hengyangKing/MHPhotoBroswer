//
//  NSFileManager+MHFileSize.h
//  musichome
//
//  Created by J on 2017/8/2.
//  Copyright © 2017年 J. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (MHFileSize)
/**
 *  检测正在录制视频文件大小
 */
-(BOOL)recordingVideoFileIsOverflow:(float (^)())maxsize;

/**
 *  检测正在录制音频文件大小
 */
-(BOOL)recordingAudioFileIsOverflow:(float (^)())maxsize;
/**
 *  检测转码后的文件大小
 */
-(BOOL)ReducedVideoIsIsOverflow:(float (^)())maxsize andFileName:(NSString *)fileName;

@end
