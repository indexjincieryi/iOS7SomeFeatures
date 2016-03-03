//
//  NDFilterViewController.m
//  iOS7特性
//
//  Created by NDMAC on 16/2/29.
//  Copyright © 2016年 NDEducation. All rights reserved.
//

#import "NDFilterViewController.h"

@interface NDFilterViewController ()

@end

@implementation NDFilterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *array = @[
                      @"CILinearToSRGBToneCurve",
                      @"CIPhotoEffectChrome",
                      @"CIPhotoEffectFade",
                      @"CIPhotoEffectInstant",
                      @"CIPhotoEffectMono",
                      @"CIPhotoEffectNoir",
                      @"CIPhotoEffectProcess",
                      @"CIPhotoEffectTonal",
                      @"CIPhotoEffectTransfer",
                      @"CISRGBToneCurveToLinear",
                      @"CIVignetteEffect",
                      ];
    
    //每张滤镜加载的图片，需要消耗大约200ms时间，这个步骤是同步加载
    for (int i = 0; i < array.count; i++) {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(i%3 *(self.view.frame.size.width/3), i/3 *130 + 64, 100, 100)];
        imageView.image = [UIImage imageNamed:@"iphoneImage.jpg"];
        
        imageView.tag = 100+i;
        
        [self.view addSubview:imageView];
        //coretext  coreimage 不具备自动内存管理，需要手动释放
    }
    
    dispatch_async(dispatch_get_global_queue(0, 0),^{
        NSMutableArray *imageArray = [NSMutableArray array];
        
        //循环创建image
        for (int i = 0; i < array.count; i++) {
            
            //对图像进行处理
            UIImage *image = [UIImage imageNamed:@"iphoneImage.jpg"];
            
            //把UIImage转换为CIImage
            CIImage *ciImage = [[CIImage alloc]initWithImage:image];
            
            //使用资源 类似滤镜生成器一样
            CIFilter *filter = [CIFilter filterWithName:array[i] keysAndValues:kCIInputImageKey,ciImage, nil];
            
            //使用默认参数
            [filter setDefaults];
            
            //生成上下文
            CIContext *context = [CIContext contextWithOptions:nil];
            
            //滤镜生成器输出图片
            CIImage  *outputimage = [filter outputImage];
            
            //转换为UIImage
            CGImageRef ref = [context createCGImage:outputimage fromRect:[outputimage extent]];
            
            UIImage *temp = [UIImage imageWithCGImage:ref];
            
            [imageArray addObject:temp];
            
            //释放
            CGImageRelease(ref);
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            for (int x = 0; x < array.count; x++) {
                UIImageView *imageView = (UIImageView *)[self.view viewWithTag:100+x];
                imageView.image = imageArray[x];
            }
        });
    });
}

@end
