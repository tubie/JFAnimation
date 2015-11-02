//
//  CATransitionViewController.m
//  JFAnimation
//
//  Created by 保修一站通 on 15/10/28.
//  Copyright © 2015年 JF. All rights reserved.
///  demo详解:http://www.jianshu.com/p/d4c516a2d82a
//  github :https://github.com/tubie/JFAnimation

#import "CATransitionViewController.h"

@interface CATransitionViewController ()


/**
 *  当前图片的索引
 */
@property (nonatomic, assign) int index;

@end

@implementation CATransitionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self starAnimation];

}

-(void)starAnimation{
    self.index++;
    if (self.index == 9) {
        self.index = 0;
    }
    
    NSString *filename = [NSString stringWithFormat:@"%d.png", self.index + 1];
    self.iconImageView.image = [UIImage imageNamed:filename];
    
    // 转场动画
    CATransition *anim = [CATransition animation];
//        anim.type = @"pageCurl";
    anim.type = @"cube";
    
    anim.subtype = kCATransitionFromLeft;
    anim.duration = 0.8;
    anim.repeatCount = MAXFLOAT;
    
    //    anim.startProgress = 0.5;
    ////
    //    anim.endProgress = 0.5;
    
    [self.view.layer addAnimation:anim forKey:nil];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
