//
//  NSFileManager+MHFilePath.h
//  musichome
//
//  Created by J on 2017/8/2.
//  Copyright © 2017年 J. All rights reserved.
//

#import <Foundation/Foundation.h>

//FileName

#define kUserOwnVideoFile @"userOwnVideo"
#define kRecordAudioFile @"myRecord.caf"
#define kMovieFile @"myMovie.mov"
#define kSmallMovieFile @"mySmallMovie.mp4"
#define kCoverImageFile @"myCover.png"



@interface NSFileManager (MHFilePath)
/**
 *  得到存储录音路径URL
 *
 *  @return录音文件的URL
 */
-(NSURL *)getSaveRecorderPath;
/**
 *  得到录制视频视频路径的URL
 *
 *  @return 视频文件的URL
 */
-(NSURL *)getSaveMovieFileURL;


/**
 *  拿到小视频文件夹地址
 *
 */
-(NSString *)getSmallMovieFilePath;



@end
