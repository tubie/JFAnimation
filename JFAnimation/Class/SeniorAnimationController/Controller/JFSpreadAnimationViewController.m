//
//  JFSpreadAnimationViewController.m
//  JFAnimation
//
//  Created by 保修一站通 on 15/11/5.
//  Copyright © 2015年 JF. All rights reserved.
//

#import "JFSpreadAnimationViewController.h"

@interface JFSpreadAnimationViewController ()

@end

@implementation JFSpreadAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    CAEmitterLayer *emitter = [CAEmitterLayer layer];
    emitter.frame = self.snowImageView.bounds;
    [self.snowImageView.layer addSublayer:emitter];
    
    emitter.renderMode = kCAEmitterLayerAdditive;
    emitter.emitterPosition = CGPointMake(200, self.view.frame.size.height/2-100);
    
    CAEmitterCell *cell = [[CAEmitterCell alloc]init];
    cell.contents = (__bridge id)([UIImage imageNamed:@"Spark.png"].CGImage);
    
    cell.birthRate = 150;
    cell.lifetime = 5.0;
    cell.color = [UIColor redColor].CGColor;
    cell.alphaSpeed = -0.4;
    cell.velocity = 50;
    cell.velocityRange = 50;
    cell.emissionRange = M_PI * 1.0;
    emitter.emitterCells = @[cell];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
