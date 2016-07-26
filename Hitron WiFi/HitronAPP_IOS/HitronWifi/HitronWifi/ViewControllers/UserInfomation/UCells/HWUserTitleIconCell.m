//
//  HWUserTitleIconCell.m
//  HitronWifi
//
//  Created by Neo Gao on 16/6/7.
//  Copyright © 2016年 Movit. All rights reserved.
//

#import "HWUserTitleIconCell.h"

@implementation HWUserTitleIconCell

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)configureCellWithModel:(id)theModel{
    HWBaseCellModel *model = (HWBaseCellModel *)theModel;
    
    self.imageView.image = [UIImage imageNamed:model.cell_icon];
    self.textLabel.text = model.cell_title;
}


@end
