//
//  ViewController.m
//  MHPhotoBroswerDemo
//
//  Created by J on 2017/6/5.
//  Copyright © 2017年 J. All rights reserved.
//

#import "ViewController.h"
#import "PhotoCotentView.h"
#import "PhotoBroswerVC.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet PhotoCotentView *contentView;
@property (nonatomic,strong) NSArray *images;

@end

@implementation ViewController
-(NSArray *)images{
    
    if(_images ==nil){
        NSMutableArray *arrayM = [NSMutableArray array];
        
        for (NSUInteger i=0; i<9; i++) {
            
            UIImage *imagae =[UIImage imageNamed:[NSString stringWithFormat:@"%@",@(i+1)]];
            
            [arrayM addObject:imagae];
        }
        
        _images = arrayM;
    }
    
    return _images;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //展示数据
    [self contentViewDataPrepare];
    
    //事件
    [self event];
}

/** 展示数据 */
-(void)contentViewDataPrepare{
    
    _contentView.images =self.images;
}



/** 事件 */
-(void)event{
    
    _contentView.ClickImageBlock = ^(NSUInteger index){
        
        //本地图片展示
//        [self localImageShow:index];
        
        //展示网络图片
        [self networkImageShow:index];
    };
}


- (IBAction)showAction:(id)sender {
    
    
}

/*
 *  本地图片展示
 */
-(void)localImageShow:(NSUInteger)index{
    
    __weak typeof(self) weakSelf=self;

    [PhotoBroswerVC show:self andAppConfig:^(PhotoBroswerAppearanceConfig *config) {
        config.PhotoBroswerStartIndex(index);
    } photoModelBlock:^NSArray *{
        NSArray *localImages = weakSelf.images;
        
        NSMutableArray *modelsM = [NSMutableArray arrayWithCapacity:localImages.count];
        for (NSUInteger i = 0; i< localImages.count; i++) {
            
            PhotoModel *pbModel=[[PhotoModel alloc] init];
            pbModel.mid = i + 1;
            pbModel.title = [NSString stringWithFormat:@"这是标题%@",@(i+1)];
            pbModel.desc = [NSString stringWithFormat:@"我是一段很长的描述文字我是一段很长的描述文字我是一段很长的描述文字我是一段很长的描述文字我是一段很长的描述文字我是一段很长的描述文字%@",@(i+1)];
            pbModel.image = localImages[i];
            
            //源frame
            UIImageView *imageV =(UIImageView *) weakSelf.contentView.subviews[i];
            pbModel.sourceImageView = imageV;
            
            [modelsM addObject:pbModel];
        }
        
        return modelsM;
    }];
}


/*
 *  展示网络图片
 */
-(void)networkImageShow:(NSUInteger)index{
    
    __weak typeof(self) weakSelf=self;
   [PhotoBroswerVC show:self andAppConfig:^(PhotoBroswerAppearanceConfig *config) {
        config.PhotoBroswerStartIndex(index);
    } photoModelBlock:^NSArray *{
                
        NSArray *networkImages=@[
                                 @"http://img15.3lian.com/2015/h1/280/d/5.jpg",
                                 @"http://img15.3lian.com/2015/h1/280/d/5.jpg",
                                 @"http://img15.3lian.com/2015/h1/280/d/5.jpg",
                                 @"http://img15.3lian.com/2015/h1/280/d/5.jpg",
                                 @"http://img15.3lian.com/2015/h1/280/d/5.jpg",
                                 @"http://img15.3lian.com/2015/h1/280/d/5.jpg",
                                 @"http://img15.3lian.com/2015/h1/280/d/5.jpg",
                                 @"http://img15.3lian.com/2015/h1/280/d/5.jpg",
                                 @"http://img15.3lian.com/2015/h1/280/d/5.jpg",
                                 
                                 ];
        
        NSMutableArray *modelsM = [NSMutableArray arrayWithCapacity:networkImages.count];
        for (NSUInteger i = 0; i< networkImages.count; i++) {
            
            PhotoModel *pbModel=[[PhotoModel alloc] init];
            pbModel.mid = i + 1;
            pbModel.title = [NSString stringWithFormat:@"这是标题%@",@(i+1)];
            pbModel.desc = [NSString stringWithFormat:@"我是一段很长的描述文字我是一段很长的描述文字我是一段很长的描述文字我是一段很长的描述文字我是一段很长的描述文字我是一段很长的描述文字%@",@(i+1)];
            pbModel.image_HD_U = networkImages[i];
            
            //源frame
            UIImageView *imageV =(UIImageView *) weakSelf.contentView.subviews[i];
            pbModel.sourceImageView = imageV;
            
            [modelsM addObject:pbModel];
        }
        return modelsM;
    }];
}

@end
