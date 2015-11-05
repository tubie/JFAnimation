//
//  JFClockViewController.m
//  JFAnimation
//
//  Created by 保修一站通 on 15/11/5.
//  Copyright © 2015年 JF. All rights reserved.
//

#import "JFClockViewController.h"

@interface JFClockViewController ()
@property(nonatomic,weak)NSTimer *timer;


@end

@implementation JFClockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(run) userInfo:nil repeats:YES];
    //更改视图的anchorPoint来调整旋转。
    self.second.layer.anchorPoint = CGPointMake(0.5f, 0.9f);
    self.minute.layer.anchorPoint = CGPointMake(0.5, 0.9);
    self.hour.layer.anchorPoint = CGPointMake(0.5, 0.9);
    //改变控制器的前后关系。
    self.second.layer.zPosition = 1.0;
    [self run];
    // Do any additional setup after loading the view from its nib.
}


-(void)run{
    
    NSCalendar *calendar = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSUInteger units = NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitSecond;
    
    NSDateComponents *components = [calendar components:units fromDate:[NSDate date]];
    CGFloat hoursAngle = (components.hour / 12.0) * M_PI * 2.0;
    CGFloat minsAngle = (components.minute / 60.0) * M_PI *2.0;
    CGFloat secsAngle = (components.second / 60.0) *M_PI *2.0;
    
    self.hour.transform = CGAffineTransformMakeRotation(hoursAngle);
    self.minute.transform = CGAffineTransformMakeRotation(minsAngle);
    self.second.transform = CGAffineTransformMakeRotation(secsAngle);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
