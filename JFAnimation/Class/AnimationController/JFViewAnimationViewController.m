//
//  JFViewAnimationViewController.m
//  JFAnimation
//
//  Created by 保修一站通 on 15/10/29.
//  Copyright © 2015年 JF. All rights reserved.
///  demo详解:http://www.jianshu.com/p/d4c516a2d82a
//  github :https://github.com/tubie/JFAnimation

#import "JFViewAnimationViewController.h"

@interface JFViewAnimationViewController ()

@end

@implementation JFViewAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

/*
 常见方法解析:
 
 + (void)setAnimationDelegate:(id)delegate     设置动画代理对象，当动画开始或者结束时会发消息给代理对象
 
 + (void)setAnimationWillStartSelector:(SEL)selector   当动画即将开始时，执行delegate对象的selector，并且把beginAnimations:context:中传入的参数传进selector
 
 + (void)setAnimationDidStopSelector:(SEL)selector  当动画结束时，执行delegate对象的selector，并且把beginAnimations:context:中传入的参数传进selector
 
 + (void)setAnimationDuration:(NSTimeInterval)duration   动画的持续时间，秒为单位
 
 + (void)setAnimationDelay:(NSTimeInterval)delay  动画延迟delay秒后再开始
 
 + (void)setAnimationStartDate:(NSDate *)startDate   动画的开始时间，默认为now
 
 + (void)setAnimationCurve:(UIViewAnimationCurve)curve  动画的节奏控制
 
 + (void)setAnimationRepeatCount:(float)repeatCount  动画的重复次数
 
 + (void)setAnimationRepeatAutoreverses:(BOOL)repeatAutoreverses  如果设置为YES,代表动画每次重复执行的效果会跟上一次相反
 
 + (void)setAnimationTransition:(UIViewAnimationTransition)transition forView:(UIView *)view cache:(BOOL)cache  设置视图view的过渡效果, transition指定过渡类型, cache设置YES代表使用视图缓存，性能较好
 */

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    [self foreAndAft];
    
//    [self blockAnimation];
    
    [self animation3D];
}

#pragma mark -首尾动画
-(void)foreAndAft{
    
    //打印动画块的位置
    
//    NSLog(@"动画执行之前的位置：%@",NSStringFromCGPoint(self.redView.layer.position));

     NSLog(@"动画执行之前的位置：%@",NSStringFromCGPoint(self.redView.center));

     //首尾式动画
     [UIView beginAnimations:nil context:nil];
     //执行动画
     //设置动画执行时间
     [UIView setAnimationDuration:1.0];
     //设置代理
     [UIView setAnimationDelegate:self];
     //设置动画执行完毕调用的事件
     [UIView setAnimationDidStopSelector:@selector(didStopAnimation)];
     self.redView.center=CGPointMake(200, 300);
     [UIView commitAnimations];

}

-(void)didStopAnimation{
    NSLog(@"动画执行之后的位置：%@",NSStringFromCGPoint(self.redView.center));
//    NSLog(@"动画执行之后的位置：%@",NSStringFromCGPoint(self.redView.layer.position));



}


/*
 duration：动画的持续时间
 
 delay：动画延迟delay秒后开始
 
 options：动画的节奏控制
 
 animations：将改变视图属性的代码放在这个block中
 
 completion：动画结束后，会自动调用这个block
 */
#pragma mark - blockAnimation
-(void)blockAnimation{
    
    [UIView transitionWithView:self.redView duration:1 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
        NSLog(@"动画执行之前的位置：%@",NSStringFromCGPoint(self.redView.center));
        self.redView.center=CGPointMake(200, 300);

    } completion:^(BOOL finished) {
        NSLog(@"动画执行之后的位置：%@",NSStringFromCGPoint(self.redView.center));
        self.redView.center=CGPointMake(100, 400);


    }];
    
    
    
//    [UIView animateKeyframesWithDuration:2 delay:1 options:UIViewKeyframeAnimationOptionCalculationModePaced animations:^{
//        self.redView.center=CGPointMake(200, 300);
//
//    } completion:^(BOOL finished) {
//        self.redView.center=CGPointMake(100, 400);
//
//    }];
    

}

-(void)animation3D{
    CATransform3D outer = CATransform3DIdentity;
    outer.m34 = -1.0 / 500.0;
    outer = CATransform3DRotate(outer, M_PI_4, 0, 1, 0);
    self.redView.layer.transform = outer;
    //rotate the inner layer -45 degrees
    CATransform3D inner = CATransform3DIdentity;
    inner.m34 = -1.0 / 500.0;
    inner = CATransform3DRotate(inner, -M_PI_4, 0, 1, 0);
    self.redView.layer.transform = inner;

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
