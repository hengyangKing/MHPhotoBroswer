//
//  NSFileManager+MHImagePickerTools.h
//  musichome
//
//  Created by J on 2017/8/2.
//  Copyright © 2017年 J. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (MHImagePickerTools)
/**
 15天内是否已经完成转码
 
 @param fileName 文件名
 */
-(BOOL)isReduced:(NSString *)fileName;

/**
 *  删除时间已经过期的转码文件
 */
-(void)deleteTimeOutReduceVideo;



@end
