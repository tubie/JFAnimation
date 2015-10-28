//
//  JFRootViewController.m
//  JFAnimation
//
//  Created by 保修一站通 on 15/10/27.
//  Copyright © 2015年 JF. All rights reserved.
//

#import "JFRootViewController.h"
#import "JFAnimationListCell.h"
#import "CABasicAnimationViewController.h"
#import "CAKeyframeAnimationViewController.h"
#import "CATransitionViewController.h"
#import "CAAnimationGroupViewController.h"
@interface JFRootViewController ()<UITableViewDataSource, UITableViewDelegate>

@property(nonatomic, strong)NSArray *animationNameArray;
@property(nonatomic, strong)NSArray *chineseNameArray;


@end

@implementation JFRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initNav];
    
    [self initData];
    // Do any additional setup after loading the view from its nib.
}
-(void)initNav{
    self.title = @"JF动画";

}

-(void)initData{
    self.animationNameArray = @[@"CABasicAnimation",@"CAKeyframeAnimation",@"CATransition",@"CAAnimationGroup"];
    self.chineseNameArray = @[@"基础动画",@"关键帧动画",@"转场动画",@"组合动画"];
    

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.animationNameArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JFAnimationListCell *cell = [JFAnimationListCell cellWithTableView:tableView];
    cell.animatationNameLabel.text = self.animationNameArray[indexPath.row];
    cell.chineseNameLabel.text = self.chineseNameArray[indexPath.row];
    return cell;

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
        {
            [self pushToController:[[CABasicAnimationViewController alloc]init]];
            break;
        }
        case 1:
        {
            [self pushToController:[[CAKeyframeAnimationViewController alloc]init]];
            break;
        }
        case 2:
        {
            [self pushToController:[[CATransitionViewController alloc]init]];
            break;
        }
        case 3:
        {
            [self pushToController:[[CAAnimationGroupViewController alloc]init]];
            break;
        }
            
        default:
            break;
    }
    
}

-(void)pushToController:(UIViewController *)controller{
    [self.navigationController pushViewController:controller animated:YES];


}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
