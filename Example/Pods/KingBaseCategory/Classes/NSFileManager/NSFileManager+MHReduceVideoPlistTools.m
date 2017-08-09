//
//  NSFileManager+MHReduceVideoPlistTools.m
//  musichome
//
//  Created by J on 2017/8/2.
//  Copyright © 2017年 J. All rights reserved.
//

#import "NSFileManager+MHReduceVideoPlistTools.h"
#import "NSDate+MHSingleMark.h"
#import "NSDate+MHDateExtension.h"
#import "NSFileManager+MHFilePath.h"

@implementation NSFileManager (MHReduceVideoPlistTools)
/**
 *  查看plist中的过期项目在返回的数组中
 *
 *  @return 装有过期条目字典的数组
 */
-(NSMutableArray *)seekOverdueDataPlistWithDate
{
    NSMutableArray *overDueArray=[[NSMutableArray alloc]init];
    NSMutableArray *originalArr=[[NSMutableArray alloc]init];
    
    if ([self isPlistFileExists]){
        //拿到原始数据
        originalArr=[self readPlist];
    }
    for (NSDictionary *dic in originalArr) {
        NSString *createDateStr=[dic objectForKey:MHThirdPartyVideoCreateDate];
        
        if ([[NSDate unscrambleSingleMark:createDateStr] isTargetAgo:15]){
            [overDueArray addObject:dic];
        }
    }
    return overDueArray;
    
}

/**
 压缩视频完成 存入plist文件钟保存
 将dictionary写入plist文件，并插入一条数据保存
 
 @param videoName 被压缩视频文件名
 */
-(void)reduceVideo:(NSString *)videoName{
    
    NSMutableArray *originalArr=[[NSMutableArray alloc]init];
    if ([self isPlistFileExists]){
        //拿到原始数据
        originalArr=[self readPlist];
    }
    //加入新数据
    NSMutableDictionary *dic=[NSMutableDictionary dictionary];
    [dic setObject:videoName forKey:MHThirdPartyVideoFileName];
    [dic setObject:[NSDate singleMark] forKey:MHThirdPartyVideoCreateDate];
    [dic setObject:[self getSmallMovieFilePath] forKey:MHThirdPartyVideoSavePath];
    
    [originalArr addObject:dic];
    //    拿到文件路径
    [originalArr writeToFile:[self getReduceVideoPlistPath] atomically:YES]?NSLog(@"写入plist write ok!"):NSLog(@"写入plist失败");
}
-(NSString *)getFilePath:(NSString *)fileName
{
    return (fileName.length)?[[self getSmallMovieFilePath] stringByAppendingPathComponent:fileName]:nil;
}
//获得plist路径
-(NSString*)getReduceVideoPlistPath{
    //沙盒中的文件路径
    return [[self getSmallMovieFilePath] stringByAppendingPathComponent:MHThirdPartyVideoPlistFile];
}
//判断沙盒中名为plistname的文件是否存在
-(BOOL) isPlistFileExists{
    
    NSString *plistPath =[self getReduceVideoPlistPath];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    return ( [fileManager fileExistsAtPath:plistPath]== NO )?NO:YES;
}
//读取plist文件
-(NSMutableArray*)readPlist{
    
    return [[NSMutableArray alloc]initWithContentsOfFile:[self getReduceVideoPlistPath]];
}
//查询是否有过期数据 有则返回其文件名数组

-(void)deleteOverdueDataWithData:(NSMutableArray *)data
{
    NSMutableArray *originalArr=[[NSMutableArray alloc]init];
    
    if ([self isPlistFileExists]){
        //拿到原始数据
        originalArr=[self readPlist];
    }
    //    删除
    [originalArr removeObjectsInArray:data];
    //重写
    [originalArr writeToFile:[self getReduceVideoPlistPath] atomically:YES]?NSLog(@"write ok!"):NSLog(@"写入plist失败");
}

@end
