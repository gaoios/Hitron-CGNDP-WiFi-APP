//
//  HWBaseCell.m
//  HitronWifi
//
//  Created by Neo Gao on 16/6/7.
//  Copyright © 2016年 Movit. All rights reserved.
//

#import "HWBaseCell.h"

@implementation HWBaseCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+(instancetype)cellWithTableView:(UITableView *)tableView WithIdentifier:(NSString *)identifier IndexPath:(NSIndexPath *)indexPath{
    
    [tableView registerClass:[self class] forCellReuseIdentifier:identifier];
    
    HWBaseCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    if (cell == nil) {
        cell  = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    }
    
    return cell;
}

@end
