//
//  JFHomeViewController.m
//  JFAnimation
//
//  Created by 保修一站通 on 15/11/4.
//  Copyright © 2015年 JF. All rights reserved.
//

#import "JFHomeViewController.h"
#import "JFAnimationListCell.h"
#import "JFRootViewController.h"
#import "JFSeniorViewController.h"
@interface JFHomeViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic, strong)NSArray *EnglishArray;
@property(nonatomic, strong)NSArray *ChinaeseArray;


@end

@implementation JFHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.EnglishArray = @[@"BaseAnimation",@"SeniorAnimation"];
    self.ChinaeseArray = @[@"基础动画", @"进阶动画"];
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JFAnimationListCell *cell = [JFAnimationListCell cellWithTableView:tableView];
    cell.animatationNameLabel.text = self.EnglishArray[indexPath.row];
    cell.chineseNameLabel.text = self.ChinaeseArray[indexPath.row];

    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
        {
            [self pushToController:[[JFRootViewController alloc]init]];
            break;
        }
        case 1:
        {
            [self pushToController:[[JFSeniorViewController alloc]init]];
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



@end
