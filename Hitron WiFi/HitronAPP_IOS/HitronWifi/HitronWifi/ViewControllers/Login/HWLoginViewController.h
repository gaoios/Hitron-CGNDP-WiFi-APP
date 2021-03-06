//
//  HWLoginViewController.h
//  HitronWifi
//
//  Created by leon.lu on 16/6/3.
//  Copyright © 2016年 Neo.Gao. All rights reserved.
//

#import "ViewController.h"

@interface HWLoginViewController : ViewController

@property (nonatomic, weak) IBOutlet UITextField *userNameField;
@property (nonatomic, weak) IBOutlet UITextField *passwordField;

@property (nonatomic, weak) IBOutlet UIButton *loginButton;
@property (nonatomic, weak) IBOutlet UIButton *quickQccessButton;
@property (nonatomic, weak) IBOutlet UIButton *reconnectButton;

@end
