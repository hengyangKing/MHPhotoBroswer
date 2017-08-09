
#ifndef Base_h
#define Base_h

// 如果是调试模式(DEBUG 是调试模式下, 自带的宏)
#ifdef DEBUG
#define MHJLog(...) NSLog(__VA_ARGS__)
#define ENV @"Debug"
#else
#define MHJLog(...)
#define ENV @"Release"
#endif
#define MHJLogFunc MHJLog(@"%s", __func__)



// 屏幕尺寸相关
#define kScreenBounds [[UIScreen mainScreen] bounds]
#define kScreenWidth [[UIScreen mainScreen] bounds].size.width
#define kScreenHeight [[UIScreen mainScreen] bounds].size.height

#define SELFSIZE [[UIScreen mainScreen] bounds].size

// 弱引用
#define MHWeakSelf __weak typeof(self) weakSelf = self;
//通知中心
#define JHYNAVCENTER [NSNotificationCenter defaultCenter]
//[NSFileManager defaultManager]
#define  JHYFILEMANAGER [NSFileManager defaultManager]
//媒体文件大小
#define MHMediaMaxSize 30.f




#endif /* Base_h */
