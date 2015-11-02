//
//  CAAnimationGroupViewController.m
//  JFAnimation
//
//  Created by 保修一站通 on 15/10/28.
//  Copyright © 2015年 JF. All rights reserved.
///  demo详解:http://www.jianshu.com/p/d4c516a2d82a
//  github :https://github.com/tubie/JFAnimation

#import "CAAnimationGroupViewController.h"

@interface CAAnimationGroupViewController ()

@end

@implementation CAAnimationGroupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.redView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"greatApes"]];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self starAnimation];
}


-(void)starAnimation{
    // 1.创建旋转动画对象
    CABasicAnimation *rotate = [CABasicAnimation animation];
    rotate.keyPath = @"transform.rotation";
     //旋转的度数M_PI ＝ 180度
    rotate.toValue = @(M_PI*2);
    
    // 2.创建缩放动画对象
    CABasicAnimation *scale = [CABasicAnimation animation];
    scale.keyPath = @"transform.scale";
    //缩放的比例大小 >1放大  <1缩小
    scale.toValue = @(0.5);
    
    // 3.平移动画
    CABasicAnimation *move = [CABasicAnimation animation];
    move.keyPath = @"transform.translation";
    move.toValue = [NSValue valueWithCGPoint:CGPointMake(20, 100)];
    
    // 4.将所有的动画添加到动画组中
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = @[rotate, scale, move];
    group.duration = 2.0;
    group.removedOnCompletion = NO;
    group.fillMode = kCAFillModeForwards;
    
    [self.redView.layer addAnimation:group forKey:nil];
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
