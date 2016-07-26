
//
//  HWUserSetController.m
//  HitronWifi
//
//  Created by Neo Gao on 16/6/12.
//  Copyright © 2016年 Movit. All rights reserved.
//

#import "HWUserSetController.h"

NSString * HWNotificationIsOpenKey = @"HWNotificationClose";

@interface HWUserSetController ()

@property (weak, nonatomic) IBOutlet UISwitch *closeNotification;

@end

@implementation HWUserSetController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    BOOL isOpen = [[NSUserDefaults standardUserDefaults] boolForKey:HWNotificationIsOpenKey];
    [self.closeNotification setOn:isOpen];
}

- (IBAction)doCloseNotification:(id)sender {
    UISwitch * sw = (UISwitch *)sender;
    if (sw.isOn) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:HWNotificationIsOpenKey];
        [[UIApplication sharedApplication] registerForRemoteNotifications];
    }else{
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:HWNotificationIsOpenKey];
        [[UIApplication sharedApplication] unregisterForRemoteNotifications];
    }
    
}



@end
