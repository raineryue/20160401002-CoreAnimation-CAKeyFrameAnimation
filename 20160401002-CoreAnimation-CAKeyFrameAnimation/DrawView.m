//
//  DrawView.m
//  20160401002-CoreAnimation-CAKeyFrameAnimation
//
//  Created by Rainer on 16/4/1.
//  Copyright © 2016年 Rainer. All rights reserved.
//

#import "DrawView.h"

@interface DrawView ()

@property (nonatomic, strong) UIBezierPath *bezierPath;

@end

@implementation DrawView

/**
 *  触摸开始
 */
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 1.获取当前点击手势
    UITouch *touch = [touches anyObject];
    
    // 2.获取当前触摸点
    CGPoint currentPoint = [touch locationInView:self];
    
    // 4.创建一个贝赛尔路径
    self.bezierPath = [UIBezierPath bezierPath];
    
    // 5.为路径设置起点
    [self.bezierPath moveToPoint:currentPoint];
}

/**
 *  触摸移动
 */
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 1.获取当前点击手势
    UITouch *touch = [touches anyObject];
    
    // 2.获取当前触摸点
    CGPoint currentPoint = [touch locationInView:self];
    
    // 3.添加一条线到当前触摸点
    [self.bezierPath addLineToPoint:currentPoint];
    
    // 4.重绘
    [self setNeedsDisplay];
}

/**
 *  触摸结束
 */
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 1.创建一个CAKeyframeAnimation动画对象
    CAKeyframeAnimation *keyframeAnimation = [CAKeyframeAnimation animation];
    
    // 2.设置对象的操作属性
    // 2.1.设置动画为移动属性
    keyframeAnimation.keyPath = @"position";
    // 2.2.设置动画的移动路径
    keyframeAnimation.path = self.bezierPath.CGPath;
    
    // 2.3.设置动画的重复次数
    keyframeAnimation.repeatCount = MAXFLOAT;
    // 2.4.设置动画的完成时间
    keyframeAnimation.duration = 5;
    
    // 3.将动画添加到当前视图子控件的layer层上
    [self.subviews.firstObject.layer addAnimation:keyframeAnimation forKey:nil];
}

- (void)drawRect:(CGRect)rect {
    [self.bezierPath stroke];
}

@end
