//
//  NSFileManager+MHFileHelper.m
//  musichome
//
//  Created by J on 2017/8/2.
//  Copyright © 2017年 J. All rights reserved.
//

#import "NSFileManager+MHFileHelper.h"

@implementation NSFileManager (MHFileHelper)
- (NSString *)getHomePath{
    return NSHomeDirectory();
}

- (NSString *)getAppPath
{
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSApplicationDirectory, NSUserDomainMask, YES);
    return [paths objectAtIndex:0];
}

- (NSString *)getDocPath
{
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return [paths objectAtIndex:0];
}

- (NSString *)getLibPrefPath
{
    
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    return [[paths objectAtIndex:0] stringByAppendingFormat:@"/Preference"];
}

- (NSString *)getLibCachePath
{
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    return [[paths objectAtIndex:0] stringByAppendingFormat:@"/Caches"];
}
-(NSString *)getMusicHomeCachePath
{    
    return [[self getLibCachePath] stringByAppendingFormat:@"/musicHomeCaches"];
}

-(NSString *)getMusicHomeSyllabusPath
{
    return [NSString stringWithFormat:@"%@/syllabus",[self getMusicHomeCachePath]];
}

- (NSString *)getTmpPath
{
    return [NSHomeDirectory() stringByAppendingFormat:@"/tmp"];
}

- (BOOL)hasLive:(NSString *)path
{
    if ([self fileExistsAtPath:path]==NO)
    {
        return [self createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:NULL];
    }
    
    return NO;
}
-(BOOL)deleteFile:(NSString *)path
{
    return ([self fileExistsAtPath:path]&&[self removeItemAtPath:path error:nil]);
}



@end
