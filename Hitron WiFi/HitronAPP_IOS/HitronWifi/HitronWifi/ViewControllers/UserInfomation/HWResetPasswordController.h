//
//  HWResetPasswordController.h
//  HitronWifi
//
//  Created by Neo Gao on 16/6/7.
//  Copyright © 2016年 Movit. All rights reserved.
//

#import "ViewController.h"

@interface HWResetPasswordController : ViewController

typedef void(^DoneBlock)(NSDictionary *commitData);

@property (weak, nonatomic) IBOutlet UITextField *tfOldPassword;
@property (weak, nonatomic) IBOutlet UITextField *tfNewPassword;
@property (weak, nonatomic) IBOutlet UITextField *tfChceckPassword;


@property (unsafe_unretained, nonatomic) IBOutlet UITextField *test;

@property(nonatomic, copy)DoneBlock donBlock;

@end
