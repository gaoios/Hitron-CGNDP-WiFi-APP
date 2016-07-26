//
//  HWBaseCell.h
//  HitronWifi
//
//  Created by Neo Gao on 16/6/7.
//  Copyright © 2016年 Movit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HWBaseCellModel.h"

@protocol HWBaseCellProtocol <NSObject>

+ (instancetype)cellWithTableView:(UITableView *)tableView WithIdentifier:(NSString *)identifier IndexPath:(NSIndexPath *)indexPath;

-(void)configureCellWithModel:(id)theModel;

@end

@class HWBaseCellModel;

@interface HWBaseCell : UITableViewCell <HWBaseCellProtocol>


@end
