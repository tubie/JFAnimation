//
//  CABasicAnimationViewController.m
//  JFAnimation
//
//  Created by 保修一站通 on 15/10/27.
//  Copyright © 2015年 JF. All rights reserved.
///  demo详解:http://www.jianshu.com/p/d4c516a2d82a
//  github :https://github.com/tubie/JFAnimation

#import "CABasicAnimationViewController.h"

@interface CABasicAnimationViewController ()

@property (nonatomic, strong) CALayer *layer;


@end

@implementation CABasicAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
}

-(void)initView{
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    CALayer *layer = [CALayer layer];
    layer.position = CGPointMake(100, 200);
    layer.bounds = CGRectMake(0, 0, 50, 50);
    layer.backgroundColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:layer];
    self.layer = layer;


}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self transformAnimation];
    
    [self rotateAnimation];

//    缩放
    [self scaleAnimation];
//
    [self translateAnimation];
    

}

- (void)transformAnimation
{
    // 1.创建动画对象
    CABasicAnimation *anim = [CABasicAnimation animation];
    
    // 2.设置动画对象
    // keyPath决定了执行怎样的动画, 调整哪个属性来执行动画
    
    
    anim.keyPath = @"transform.rotation";//转圈

//    anim.keyPath = @"transform.scale.x";//平铺扩充
//    anim.keyPath = @"transform.translation.y";//平移
#warning 以下两个效果一样，都是包装成对象类型
    anim.toValue = @(100);
//        anim.toValue = [NSValue valueWithCGPoint:CGPointMake(100, 100)];
    anim.duration = 2.0;
    
    anim.removedOnCompletion = NO;
    anim.fillMode = kCAFillModeForwards;
    
    // 3.添加动画
    [self.layer addAnimation:anim forKey:nil];
}

- (void)rotateAnimation
{
    // 1.创建动画对象
    CABasicAnimation *anim = [CABasicAnimation animation];
    
    // 2.设置动画对象
    anim.keyPath = @"transform";
    //    anim.fromValue = [NSValue valueWithCGPoint:CGPointMake(0, 0)];
    anim.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI, 1, -1, 0)];
    anim.duration = 2.0;
    
    anim.removedOnCompletion = NO;
    anim.fillMode = kCAFillModeForwards;
    
    // 3.添加动画
    [self.layer addAnimation:anim forKey:nil];
}

- (void)scaleAnimation
{
    // 1.创建动画对象
    CABasicAnimation *anim = [CABasicAnimation animation];
    
    // 2.设置动画对象
    anim.keyPath = @"bounds";
//        anim.fromValue = [NSValue valueWithCGPoint:CGPointMake(0, 0)];
    anim.toValue = [NSValue valueWithCGRect:CGRectMake(0, 0, 150, 150)];
    anim.duration = 5.0;
    
    /**让图层保持动画执行完毕后的状态**/
    // 动画执行完毕后不要删除动画
    anim.removedOnCompletion = NO;
    // 保持最新的状态
    anim.fillMode = kCAFillModeForwards;
    
    // 3.添加动画
    [self.layer addAnimation:anim forKey:nil];
}


- (void)translateAnimation
{
    // 1.创建动画对象
    CABasicAnimation *anim = [CABasicAnimation animation];
    
    // 2.设置动画对象
    anim.keyPath = @"position";
//    anim.fromValue = [NSValue valueWithCGPoint:CGPointMake(100, 100)];
//    anim.toValue = [NSValue valueWithCGPoint:CGPointMake(200, 200)];

    // toValue : 最终变成什么值
    // byValue : 增加多少值
    anim.byValue = [NSValue valueWithCGPoint:CGPointMake(50, 200)];
    anim.duration = 5.0;
    
    /**让图层保持动画执行完毕后的状态**/
    // 动画执行完毕后不要删除动画
    anim.removedOnCompletion = NO;
    // 保持最新的状态
    anim.fillMode = kCAFillModeForwards;
    
    // 3.添加动画
    [self.layer addAnimation:anim forKey:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
