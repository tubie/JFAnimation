//
//  JFAnimationListCell.m
//  JFAnimation
//
//  Created by 保修一站通 on 15/10/27.
//  Copyright © 2015年 JF. All rights reserved.
//

#import "JFAnimationListCell.h"

@implementation JFAnimationListCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"JFAnimationListCell";
    JFAnimationListCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        // 从xib中加载cell
        cell = [[[NSBundle mainBundle] loadNibNamed:@"JFAnimationListCell" owner:nil options:nil] lastObject];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

@end
