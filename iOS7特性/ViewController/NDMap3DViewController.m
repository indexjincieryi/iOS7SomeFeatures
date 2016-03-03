//
//  NDMap3DViewController.m
//  iOS7特性
//
//  Created by NDMAC on 16/2/29.
//  Copyright © 2016年 NDEducation. All rights reserved.
//

#import "NDMap3DViewController.h"

@interface NDMap3DViewController ()

@end

@implementation NDMap3DViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建地图
    MKMapView *mapView = [[MKMapView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height/2)];
    
    //设置一个位置
    mapView.centerCoordinate = CLLocationCoordinate2DMake(31.189757, 121.462503);
    mapView.tag = 100;
    
    //如果实现3D地图，需要设置2个属性
    mapView.camera.altitude = 200;
    mapView.camera.pitch = 70;
    
    [self.view addSubview:mapView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
