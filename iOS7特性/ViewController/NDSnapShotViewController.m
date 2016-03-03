//
//  NDSnapShotViewController.m
//  iOS7特性
//
//  Created by NDMAC on 16/2/29.
//  Copyright © 2016年 NDEducation. All rights reserved.
//

#import "NDSnapShotViewController.h"

@interface NDSnapShotViewController ()

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation NDSnapShotViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeContactAdd];
    button.frame = CGRectMake(0, 0, 30, 30);
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:button];
    self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height/2, self.view.frame.size.width, self.view.frame.size.height/2)];
    [self.view addSubview:self.imageView];
}

-(void)buttonClick
{
    //找到地图的指针
    MKMapView *view = (MKMapView*)[self.view  viewWithTag:100];
    
    //初始化截屏信息
    MKMapSnapshotOptions *options = [[MKMapSnapshotOptions alloc]init];
    options.region = view.region;
    
    //设置大小
    options.scale = [UIScreen mainScreen].scale;
    
    //初始化截图
    MKMapSnapshotter *shotter = [[MKMapSnapshotter alloc]initWithOptions:options];
    [shotter startWithCompletionHandler:^(MKMapSnapshot *snapshot, NSError *error) {
        self.imageView.image = snapshot.image;
    }];
}

@end
