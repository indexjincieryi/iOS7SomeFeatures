//
//  NDEffectViewController.m
//  iOS7特性
//
//  Created by NDMAC on 16/2/29.
//  Copyright © 2016年 NDEducation. All rights reserved.
//

#import "NDEffectViewController.h"

@interface NDEffectViewController ()

@property (nonatomic, strong) UIImageView  *imageView;

@end

@implementation NDEffectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
    self.imageView.center = self.view.center;
    self.imageView.image = [UIImage imageNamed:@"birdImage.png"];
    [self.view addSubview:self.imageView];
    
    //设置偏移
    UIInterpolatingMotionEffect *effectX;
    UIInterpolatingMotionEffect *effectY;
    effectX = [[UIInterpolatingMotionEffect alloc]initWithKeyPath:@"center.x" type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
    effectY = [[UIInterpolatingMotionEffect alloc]initWithKeyPath:@"center.y" type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
    
    //设置最大值和最小值
    effectX.maximumRelativeValue = @(200);
    effectX.minimumRelativeValue = @(-200);
    effectY.maximumRelativeValue = @(300);
    effectY.minimumRelativeValue = @(-300);
    [self.imageView addMotionEffect:effectX];
    [self.imageView addMotionEffect:effectY];
}

@end
