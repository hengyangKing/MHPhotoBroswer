//
//  NSDate+MHSingleMark.h
//  Pods
//
//  Created by J on 2017/8/2.
//
//

#import <Foundation/Foundation.h>

@interface NSDate (MHSingleMark)

/**
 解构时间戳

 @param singleMark 时间戳
 @return 返回NSDate对象
 */
+(NSDate *)unscrambleSingleMark:(NSString *)singleMark;


/**
 得到当前时间戳

 @return 返回时间戳字符串
 */
+(NSString *)singleMark;
@end
