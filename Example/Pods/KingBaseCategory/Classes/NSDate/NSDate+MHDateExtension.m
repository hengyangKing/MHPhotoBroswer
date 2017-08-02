//
//  NSDate+MHDateExtension.m
//  musichome
//
//  Created by J on 2017/6/4.
//  Copyright © 2017年 J. All rights reserved.
//

#import "NSDate+MHDateExtension.h"

@implementation NSDate (MHDateExtension)
- (NSDateComponents *)deltaFrom:(NSDate *)from
{
    // 日历
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    // 比较时间
    NSCalendarUnit unit = NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    
    return [calendar components:unit fromDate:from toDate:self options:0];
}

- (BOOL)isThisYear
{
    // 日历
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSInteger nowYear = [calendar component:NSCalendarUnitYear fromDate:[NSDate date]];
    NSInteger selfYear = [calendar component:NSCalendarUnitYear fromDate:self];
    
    return nowYear == selfYear;
}

-(BOOL)isTargetAgo:(NSUInteger )dayAgo
{
    // 日期格式化类
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd";
    
    NSDate *nowDate = [fmt dateFromString:[fmt stringFromDate:[NSDate date]]];
    NSDate *selfDate = [fmt dateFromString:[fmt stringFromDate:self]];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *cmps = [calendar components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:selfDate toDate:nowDate options:0];
    
    if (dayAgo)
    {
        return cmps.year == 0
        && cmps.month == 0
        && cmps.day == dayAgo;
    }
    return cmps.year == 0
    && cmps.month == 0
    && cmps.day == 15;
}



- (BOOL)isToday
{
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd";
    
    NSString *nowString = [fmt stringFromDate:[NSDate date]];
    NSString *selfString = [fmt stringFromDate:self];
    
    return [nowString isEqualToString:selfString];
}

- (BOOL)isYesterday
{
    // 2014-12-31 23:59:59 -> 2014-12-31
    // 2015-01-01 00:00:01 -> 2015-01-01
    
    // 日期格式化类
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    //    忽略时分秒
    fmt.dateFormat = @"yyyy-MM-dd";
    
    NSDate *nowDate = [fmt dateFromString:[fmt stringFromDate:[NSDate date]]];
    NSDate *selfDate = [fmt dateFromString:[fmt stringFromDate:self]];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *cmps = [calendar components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:selfDate toDate:nowDate options:0];
    
    return cmps.year == 0
    && cmps.month == 0
    && cmps.day == 1;
}
-(BOOL)isSameDay1:(NSDate *)day1 andDay2:(NSDate *)day2
{
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd";
    
    NSString *nowString = [fmt stringFromDate:day1];
    NSString *selfString = [fmt stringFromDate:day2];
    
    return [nowString isEqualToString:selfString];
}

+(NSString *)getCurrentDateString
{
    //    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    //    NSTimeInterval delta = [zone secondsFromGMTForDate:[NSDate date]];
    NSString *string = [NSString stringWithFormat:@"%f",([[NSDate date] timeIntervalSince1970])*1000];
    NSString *dateString = [[string componentsSeparatedByString:@"."]objectAtIndex:0];
    return dateString;
}

+(NSString *)getMHJCreateTimeWithCreateTime:(NSString *)postTime
{
    double time=postTime.doubleValue;
    NSDate* create=[[NSDate alloc]initWithTimeIntervalSince1970:time/1000.0];
    NSDateFormatter *fmt=[[NSDateFormatter alloc]init];
    fmt.dateFormat=@"yyyy-MM-dd HH:mm:ss";
    if (create.isThisYear)
    {
        //今年
        if (create.isToday)
        {
            //今天
            NSDateComponents * comps=[[NSDate date]deltaFrom:create];
            if (comps.hour>=1)
            {
                //大于一个小时
                return [NSString stringWithFormat:@"%zd小时前",comps.hour];
                
            }else if (comps.minute>=1)
            {
                //                一小时之内
                return [NSString stringWithFormat:@"%zd分钟前",comps.minute];
            }else{
                //刚刚
                return @"刚刚";
            }
        }else if (create.isYesterday)
        {
            //昨天
            fmt.dateFormat=@"昨天 HH:mm";
            return [fmt stringFromDate:create];
        }else
        {
            fmt.dateFormat=@"MM-dd HH:mm";
            return [fmt stringFromDate:create];
        }
    }else
    {
        //非今年
        fmt.dateFormat=@"yyyy-MM-dd HH:mm";
        return [fmt stringFromDate:create];
    }
}


/**
 将NSDate转城str时间戳
 
 @return 返回str时间戳
 */
-(NSString *)getCreateTime
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *strDate = [dateFormatter stringFromDate:self];
    return strDate;
}


@end
