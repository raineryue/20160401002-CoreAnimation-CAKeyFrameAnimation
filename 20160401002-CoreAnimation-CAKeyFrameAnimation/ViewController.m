//
//  ViewController.m
//  20160401002-CoreAnimation-CAKeyFrameAnimation
//
//  Created by Rainer on 16/4/1.
//  Copyright © 2016年 Rainer. All rights reserved.
//

#import "ViewController.h"

#define angle2Radion(angle) ((angle) / 180.0 * M_PI)

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.imageView.layer.anchorPoint = CGPointZero;
}

/**
 *  仿iPhone卸载程序动画
 */
- (void)uninstallAppAnimation {
    // 1.创建一个CAKeyframeAnimation动画对象
    CAKeyframeAnimation *keyframeAnimation = [CAKeyframeAnimation animation];
    
    // 2.设置动画对象属性
    // 2.1.设置动画的类型Key
    keyframeAnimation.keyPath = @"transform.rotation";
    // 2.2.设置动画的类型Value
    keyframeAnimation.values = @[@angle2Radion(-5), @angle2Radion(5), @angle2Radion(-5)];
    
    // 2.3.设置动画重复次数
    keyframeAnimation.repeatCount = MAXFLOAT;
    // 2.4.设置动画是否反弹
    keyframeAnimation.removedOnCompletion = NO;
    // 2.5.设置动画保持模式（这里设置为保持最新位置）
    keyframeAnimation.fillMode = kCAFillModeForwards;
    
    // 3.给当前图片的layer层添加动画
    [self.imageView.layer addAnimation:keyframeAnimation forKey:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
