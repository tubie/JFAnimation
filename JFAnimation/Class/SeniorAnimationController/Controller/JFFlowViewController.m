//
//  JFFlowViewController.m
//  JFAnimation
//
//  Created by 保修一站通 on 15/11/5.
//  Copyright © 2015年 JF. All rights reserved.
//

#import "JFFlowViewController.h"

@interface JFFlowViewController ()

@end

@implementation JFFlowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self run];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self run];
    

}

/*
 Appends a quadratic Bézier curve to the receiver’s path.
 
 - ( void )addQuadCurveToPoint:(CGPoint)endPoint controlPoint:(CGPoint)controlPoint
 Parameters
 endPoint
 The end point of the curve.
 controlPoint
 The control point of the curve.
 */

-(void)run{
    UIBezierPath *bezierPath = [[UIBezierPath alloc]init];
    [bezierPath moveToPoint:CGPointMake(50, self.view.bounds.size.height-50)];
    [bezierPath addCurveToPoint:CGPointMake(300, 150) controlPoint1:CGPointMake(110, 0) controlPoint2:CGPointMake(110, 100)];
    
    CAShapeLayer *pathLayer = [[CAShapeLayer alloc]init];
    pathLayer.path = bezierPath.CGPath;
    pathLayer.fillColor = [UIColor clearColor].CGColor;
    pathLayer.strokeColor = [UIColor lightGrayColor].CGColor;
    pathLayer.lineWidth = 3.f;
    [self.buttomView.layer addSublayer:pathLayer];
    
    [self.buttomView.layer addSublayer: self.imageView.layer];
    
    
    //移动动画
    CAKeyframeAnimation *animation1 = [CAKeyframeAnimation  animation];
    animation1.keyPath = @"position";
    animation1.path = bezierPath.CGPath;
    animation1.rotationMode = kCAAnimationRotateAuto;
    
    //颜色渐变动画
    CABasicAnimation *animation2 = [CABasicAnimation animation];
    animation2.keyPath = @"backgroundColor";
    animation2.toValue = (__bridge id)[UIColor redColor].CGColor;
    
    
    //动画组
    CAAnimationGroup  *groupAnimation  = [CAAnimationGroup animation];
    groupAnimation.animations = @[animation1,animation2];
    groupAnimation.duration = 5.0;
    [self.imageView.layer addAnimation:groupAnimation forKey:nil];


}

@end
