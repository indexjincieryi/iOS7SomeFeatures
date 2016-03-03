//
//  NDSpeechViewController.m
//  iOS7特性
//
//  Created by NDMAC on 16/2/29.
//  Copyright © 2016年 NDEducation. All rights reserved.
//

#import "NDSpeechViewController.h"

#import <AVFoundation/AVFoundation.h>

@interface NDSpeechViewController ()

@property (nonatomic, strong) AVSpeechSynthesizer *speech;

@end

@implementation NDSpeechViewController

- (void)dealloc{
    BOOL isClear = [self.speech stopSpeakingAtBoundary:AVSpeechBoundaryImmediate];
    NSLog(@"%d",isClear);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //初始化语音合成
    self.speech = [[AVSpeechSynthesizer alloc]init];
    
    //初始化需要合成的内容
    AVSpeechUtterance *utterance = [AVSpeechUtterance speechUtteranceWithString:@"The default is the system's region and language. Passing in nil will return the default voice"];
//    AVSpeechUtterance *utterance = [AVSpeechUtterance speechUtteranceWithString:@"坡上立着一只鹅，坡下就是一条河。宽宽的河，肥肥的鹅，鹅要过河，河要渡鹅不知是鹅过河，还是河渡鹅？"];
    
    //语速慢一些
    utterance.rate = 0.1;
    
    [self.speech speakUtterance:utterance];
}

@end
