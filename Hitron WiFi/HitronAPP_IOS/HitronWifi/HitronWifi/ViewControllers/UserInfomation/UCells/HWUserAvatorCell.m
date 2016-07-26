//
//  HWUserAvatorCell.m
//  HitronWifi
//
//  Created by Neo Gao on 16/6/7.
//  Copyright © 2016年 Movit. All rights reserved.
//

#import "HWUserAvatorCell.h"
#import "HWUser.h"

@implementation HWUserAvatorCell

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)configureCellWithModel:(id)theModel{
    HWUser *user = (HWUser *)theModel;

    UIImage *avator = [UIImage imageNamed:user.icon];
    if (avator) {
        [self.ivAvator setImage:avator];
    }
    
    self.lblName.text = user.name;
    
}


@end
