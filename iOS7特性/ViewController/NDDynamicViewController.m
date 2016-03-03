//
//  NDDynamicViewController.m
//  iOS7特性
//
//  Created by NDMAC on 16/2/29.
//  Copyright © 2016年 NDEducation. All rights reserved.
//

#import "NDDynamicViewController.h"

@interface NDDynamicViewController ()

//现实动画
@property (nonatomic, strong) UIDynamicAnimator*animator;
//现实行为
@property (nonatomic, strong) UIDynamicItemBehavior*dynamic;
//重力行为
@property (nonatomic, strong) UIGravityBehavior*gravity;
//碰撞行为
@property (nonatomic, strong) UICollisionBehavior*collision;

@end

@implementation NDDynamicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建动画
    self.animator = [[UIDynamicAnimator alloc]initWithReferenceView:self.view];
    
    //创建行为
    //现实行为需要注意不要写错，一般会写错为UIDynamicBehavior
    self.dynamic = [[UIDynamicItemBehavior alloc] init];
    
    //设置弹力值
    self.dynamic.elasticity = 0.8;
    
    //重力行为
    self.gravity = [[UIGravityBehavior alloc] init];
    
    //气泡上升的
//    self.gravity.gravityDirection=CGVectorMake(0, -1);
    
    //碰撞行为
    self.collision = [[UICollisionBehavior alloc] init];
    
    //设置刚体碰撞
    self.collision.translatesReferenceBoundsIntoBoundary=YES;
    
    //把行为加入到动画中
    [self.animator addBehavior:self.dynamic];
    [self.animator addBehavior:self.gravity];
    [self.animator addBehavior:self.collision];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    int a = CGRectGetWidth([UIScreen mainScreen].bounds);
    
    int x = arc4random()%a;
    int z = arc4random()%50 + 1;
    NSArray *array = @[@"pigImage.png",@"birdImage.png"];
    
    //每点击一次屏幕，我们创建一个ImageView
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(x, 100, z, z)];
    imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",array[arc4random()%2]]];
    [self.view addSubview:imageView];
    
    //把imageView遵循行为
    [self.dynamic addItem:imageView];
    [self.gravity addItem:imageView];
    [self.collision addItem:imageView];
}

@end
