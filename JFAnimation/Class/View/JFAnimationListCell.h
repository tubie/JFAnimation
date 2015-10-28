//
//  JFAnimationListCell.h
//  JFAnimation
//
//  Created by 保修一站通 on 15/10/27.
//  Copyright © 2015年 JF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JFAnimationListCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@property (weak, nonatomic) IBOutlet UILabel *animatationNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *chineseNameLabel;

@end
