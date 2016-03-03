//
//  NDSpriteViewController.m
//  iOS7特性
//
//  Created by NDMAC on 16/2/29.
//  Copyright © 2016年 NDEducation. All rights reserved.
//

#import "NDSpriteViewController.h"

#import <SpriteKit/SpriteKit.h>

@interface NDSpriteViewController ()

@end

@implementation NDSpriteViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //创建一个舞台
    SKView *sp = [[SKView alloc]initWithFrame:self.view.frame];
    
    //生成一个场景
    SKScene *scene = [SKScene sceneWithSize:self.view.frame.size];
    
    //生成节点(节点类似精灵，精灵是在场景里面跑的)
    SKSpriteNode *monster = [SKSpriteNode spriteNodeWithImageNamed:@"birdImage.png"];
    
    //设置锚点
    monster.position = CGPointMake(50, 50);
    
    //场景添加精灵
    [scene addChild:monster];
    
    //舞台加载场景
    [sp presentScene:scene];
    [self.view addSubview:sp];
    
    //添加运动  moveTo方法不可逆  moveBy方法可逆
    SKAction *actionMove = [SKAction moveTo:CGPointMake(250, 400) duration:2];
    
    //添加一个动作完成
    SKAction *actionDone = [SKAction runBlock:^{
        NSLog(@"运行完成");
    }];
    
    //把动作添加到精灵上
    [monster runAction:actionMove completion:^{
        [monster runAction:actionDone];
    }];
}

@end
