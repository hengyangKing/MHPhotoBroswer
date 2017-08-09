//
//  NSFileManager+MHAccount.h
//  musichome
//
//  Created by J on 2017/8/2.
//  Copyright © 2017年 J. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (MHAccount)
/**
 删除用户数据
 
 @return 是否删除成功
 */
-(BOOL)deleteAccount;
/**
 *  得到拿到存储用户数据的路径
 *
 *  @return 用户存储数据路径
 */
-(NSString *)getAccountPath;
@end
