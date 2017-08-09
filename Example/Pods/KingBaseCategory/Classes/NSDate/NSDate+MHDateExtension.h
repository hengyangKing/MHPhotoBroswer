//
//  NSDate+MHDateExtension.h
//  musichome
//
//  Created by J on 2017/6/4.
//  Copyright © 2017年 J. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (MHDateExtension)
/**
 * 比较from和self的时间差值
 */
- (NSDateComponents *)deltaFrom:(NSDate *)from;

/**
 * 是否为今年
 */
- (BOOL)isThisYear;

/**
 * 是否为今天
 */
- (BOOL)isToday;

/**
 * 是否为昨天
 */
- (BOOL)isYesterday;
/**
 *  是否为目标日期天前
 *  输入为空默认为15天
 */
-(BOOL)isTargetAgo:(NSUInteger )dayAgo;

/**
 是否为同一天
 
 @param day1 day1
 @param day2 day2
 @return 是否为同一天
 */
-(BOOL)isSameDay1:(NSDate *)day1 andDay2:(NSDate *)day2;
/**
 得到时间戳
 
 @return 时间戳
 */
+(NSString *)getCurrentDateString;


/**
 得到修饰时间时间戳
 
 @param postTime createTime
 @return MHJCreateTime
 */
+(NSString *)getMHJCreateTimeWithCreateTime:(NSString *)postTime;

/**
 将NSDate转时间
 
 @return 返回Date转换时间戳
 */
-(NSString *)getCreateTime;

@end
