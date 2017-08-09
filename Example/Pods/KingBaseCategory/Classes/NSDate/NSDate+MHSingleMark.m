//
//  NSDate+MHSingleMark.m
//  Pods
//
//  Created by J on 2017/8/2.
//
//

#import "NSDate+MHSingleMark.h"

@implementation NSDate (MHSingleMark)
/**
 *  解构时间戳
 */
+(NSDate *)unscrambleSingleMark:(NSString *)singleMark
{
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *destDate= [formatter dateFromString:singleMark];
    return destDate;
}
//拿到时间戳
+(NSString *)singleMark
{
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *singleMark=[formatter stringFromDate:[NSDate date]];
    return singleMark;
}
@end
