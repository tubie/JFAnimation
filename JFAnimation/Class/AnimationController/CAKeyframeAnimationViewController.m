//
//  CAKeyframeAnimationViewController.m
//  JFAnimation
//
//  Created by 保修一站通 on 15/10/27.
//  Copyright © 2015年 JF. All rights reserved.
///  demo详解:http://www.jianshu.com/p/d4c516a2d82a
//  github :https://github.com/tubie/JFAnimation
#define Angle2Radian(angle) ((angle) / 180.0 * M_PI)

#import "CAKeyframeAnimationViewController.h"

@interface CAKeyframeAnimationViewController ()

@end

@implementation CAKeyframeAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.redView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bird"]];

    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self start];

    [self keyFrameAnimation];
//    [self testMove];
}

//曲线动画路径
-(void)keyFrameAnimation{
    
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
    
    anim.keyPath = @"position";
    anim.removedOnCompletion = NO;
    anim.fillMode = kCAFillModeForwards;
    anim.duration = 2.0;
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddEllipseInRect(path, NULL, CGRectMake(100, 100, 150, 150));
    //动画执行路径
    anim.path = path;
    CGPathRelease(path);
    
    // 设置动画的执行节奏
    // kCAMediaTimingFunctionEaseInEaseOut : 一开始比较慢, 中间会加速,  临近结束的时候, 会变慢
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    anim.repeatCount = MAXFLOAT;
    anim.delegate = self;
    
    [self.redView.layer addAnimation:anim forKey:nil];


}

//直线动路径
- (void)testMove
{
    //    CABasicAnimation  fromValue --> toValue
    
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
    
    anim.keyPath = @"position";
    
    NSValue *v1 = [NSValue valueWithCGPoint:CGPointMake(00, 80)];
    NSValue *v2 = [NSValue valueWithCGPoint:CGPointMake(100, 0)];
    NSValue *v3 = [NSValue valueWithCGPoint:CGPointMake(100, 200)];
    NSValue *v4 = [NSValue valueWithCGPoint:CGPointMake(200, 400)];
    
    //动画的直线路径
    anim.values = @[v1, v2, v3, v4];
    
//        anim.keyTimes = @[@(0.5), @(0.25), @(0.25)];
    
    anim.duration = 2.0;
    
    
    anim.removedOnCompletion = NO;
    anim.fillMode = kCAFillModeForwards;
    
    anim.repeatCount = MAXFLOAT;

    
    [self.redView.layer addAnimation:anim forKey:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)start {
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
    anim.keyPath = @"transform.rotation";
    
    anim.values = @[@(Angle2Radian(-20)),  @(Angle2Radian(20)), @(Angle2Radian(-20))];
    anim.duration = 0.025;
    // 动画的重复执行次数
    anim.repeatCount = MAXFLOAT;
    
    // 保持动画执行完毕后的状态
    anim.removedOnCompletion = NO;
    anim.fillMode = kCAFillModeForwards;
    
    [self.redView.layer addAnimation:anim forKey:@"shake"];
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
