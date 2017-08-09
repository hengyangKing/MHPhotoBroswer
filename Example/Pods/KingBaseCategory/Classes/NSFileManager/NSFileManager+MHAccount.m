//
//  NSFileManager+MHAccount.m
//  musichome
//
//  Created by J on 2017/8/2.
//  Copyright © 2017年 J. All rights reserved.
//

#import "NSFileManager+MHAccount.h"
#import "NSFileManager+MHFilePath.h"
#import "NSFileManager+MHFileHelper.h"
@implementation NSFileManager (MHAccount)
-(BOOL)deleteAccount
{
    return  [self deleteFile:[self getAccountPath]];
}
-(NSString *)getAccountPath
{
    return [[self getDocPath] stringByAppendingPathComponent:@"account.data"];
}
@end
