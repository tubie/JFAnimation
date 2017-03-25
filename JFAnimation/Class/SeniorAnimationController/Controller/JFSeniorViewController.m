//
//  JFSeniorViewController.m
//  JFAnimation
//
//  https://github.com/tubie/JFAnimation
//  http://www.jianshu.com/u/be0e45643dcf

//

#import "JFSeniorViewController.h"
#import "JFAnimationListCell.h"
#import "JFBufferBasketballViewController.h"
#import "JFBufferBasketBall2ViewController.h"
#import "JFClockViewController.h"
#import "JFFlowViewController.h"
#import "JFSpreadAnimationViewController.h"
@interface JFSeniorViewController ()
@property(nonatomic, strong)NSArray *EnglishArray;
@property(nonatomic, strong)NSArray *ChinaeseArray;


@end

@implementation JFSeniorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.EnglishArray = @[@"follewAnimation",@"touchAnimation",@"clockAnimation",@"bezierPathAnimation",@"sqreadAnimation"];
    self.ChinaeseArray = @[@"篮球1", @"篮球2",@"时钟",@"贝塞尔虚线流动",@"扩散"];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.EnglishArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JFAnimationListCell *cell = [JFAnimationListCell cellWithTableView:tableView];
    cell.animatationNameLabel.text = self.EnglishArray[indexPath.row];
    cell.chineseNameLabel.text = self.ChinaeseArray[indexPath.row];
    return cell;
}

#pragma mark - Table view delegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        [self pushTocontroller:[[JFBufferBasketballViewController alloc] initWithNibName:@"JFBufferBasketballViewController" bundle:nil]];
    }else if (indexPath.row == 1){
        [self pushTocontroller:[[JFBufferBasketBall2ViewController alloc] initWithNibName:@"JFBufferBasketBall2ViewController" bundle:nil]];
    
    }else if (indexPath.row == 2){
        [self pushTocontroller:[[JFClockViewController alloc] initWithNibName:@"JFClockViewController" bundle:nil]];
    }else if (indexPath.row == 3){
        [self pushTocontroller:[[JFFlowViewController alloc] initWithNibName:@"JFFlowViewController" bundle:nil]];

    }else if (indexPath.row == 4){
        [self pushTocontroller:[[JFSpreadAnimationViewController alloc] initWithNibName:@"JFSpreadAnimationViewController" bundle:nil]];

    }
   
    

}

-(void)pushTocontroller:(UIViewController*)controller{
    
    [self.navigationController pushViewController:controller animated:YES];

}



@end
