//
//  JFBufferBasketballViewController.m
//  JFAnimation
//
//  Created by 保修一站通 on 15/11/5.
//  Copyright © 2015年 JF. All rights reserved.
//

#import "JFBufferBasketballViewController.h"

@interface JFBufferBasketballViewController ()

@end

@implementation JFBufferBasketballViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [UIView animateWithDuration:1.0 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.basketballImageView.center = [[touches anyObject] locationInView:self.view];
    } completion:^(BOOL finished) {
        
    }];
}


@end
