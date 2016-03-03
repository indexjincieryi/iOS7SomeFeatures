//
//  NDQRViewController.m
//  iOS7特性
//
//  Created by NDMAC on 16/2/29.
//  Copyright © 2016年 NDEducation. All rights reserved.
//

#import "NDQRViewController.h"

#import <CoreImage/CoreImage.h>

@interface NDQRViewController ()

@property (nonatomic, strong) UIImageView  *imageView;

@end

@implementation NDQRViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    self.imageView.center = self.view.center;
    [self.view addSubview:self.imageView];
    
    //生成资源
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    
    //使用默认参数
    [filter setDefaults];
    
    //设置值
    [filter setValue:[@"http://www.baidu.com" dataUsingEncoding:NSUTF8StringEncoding] forKey:@"inputMessage"];
    
    //生成ciImage，也就是根据资源导出ciImage进行输出
    CIImage *ciImage = [filter outputImage];
    
    //开始绘制上下文
    CIContext *context = [CIContext contextWithOptions:nil];
    
    //创建图像
    CGImageRef ref = [context createCGImage:ciImage fromRect:[ciImage extent]];
    
    //生成UIImage  这样生成的image是模糊的，需要重新绘制
    UIImage *image = [UIImage imageWithCGImage:ref scale:1. orientation:UIImageOrientationUp];
    self.imageView.image = image;
    
    //重新绘制的图像，我们需要让他的size大6倍
    UIImage *resized = nil;
    CGFloat width = image.size.width *6;
    CGFloat height = image.size.height *6;
    UIGraphicsBeginImageContext(CGSizeMake(width, height));
    
    //获取上下文
    CGContextRef context1 = UIGraphicsGetCurrentContext();
    
    //进行设置
    CGContextSetInterpolationQuality(context1, kCGInterpolationNone);
    
    //原有的iamge进行重绘
    [image drawInRect:CGRectMake(0, 0, width, height)];
    
    //抽取现在上下文为image
    resized = UIGraphicsGetImageFromCurrentImageContext();
    self.imageView.image = resized;
    
    //最后释放cgimage
    CGImageRelease(ref);
}

@end
