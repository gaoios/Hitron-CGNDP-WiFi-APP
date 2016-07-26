//
//  HWResetPasswordController.m
//  HitronWifi
//
//  Created by Neo Gao on 16/6/7.
//  Copyright © 2016年 Movit. All rights reserved.
//

#import "HWResetPasswordController.h"
#import "HWUserManager.h"

@interface HWResetPasswordController ()


@end

@implementation HWResetPasswordController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)leftHeaderBtnPressed:(id)sender{
    [super leftHeaderBtnPressed:sender];
}

- (IBAction)rightHeaderBtnPressed:(id)sender{
    if ([self didCheckPassword]) {
        NSString *opwd = self.tfOldPassword.text;
        NSString *npwd = self.tfNewPassword.text;
        NSString *cpwd = self.tfChceckPassword.text;
        
        NSString *name = [HWUserManager getUserName];
        
        [[HWUserManager getInstance] setUserPassWord:opwd NewPassword:npwd CheckNewPassword:cpwd Name:name Sucess:^(BOOL result){
            //show sucess
            [super leftHeaderBtnPressed:sender];
        } Failure:^(NSError *err){
            //show error
        }];
    }else{
        NSLog(@"Error");
    }
}


- (BOOL)didCheckPassword{
    if ([self.tfOldPassword.text length] == 0 || [self.tfNewPassword.text length] == 0 || [self.tfChceckPassword.text length] == 0) {
        
        [HWUtility showAlertView:I18NString(@"Error", nil) message:I18NString(@"TextField Can't Be Empty", nil)];
        return NO;
    }
    
    if (!([self.tfOldPassword.text length] < 32 && [self.tfOldPassword.text length] > 8)) {
        [HWUtility showAlertView:I18NString(@"Error", nil) message:I18NString(@"The Old Password Within The Range 8~32", nil)];
        return NO;
    }
    
    if (!([self.tfNewPassword.text length] < 32 && [self.tfNewPassword.text length] > 8)) {
        [HWUtility showAlertView:I18NString(@"Error", nil) message:I18NString(@"The New Password Within The Range 8~32", nil)];
        return NO;
    }
    
    if (!([self.tfChceckPassword.text length] < 32 && [self.tfChceckPassword.text length] > 8)) {
        [HWUtility showAlertView:I18NString(@"Error", nil) message:I18NString(@"The New Password Within The Range 8~32", nil)];
        return NO;
    }
    
    if (![self.tfNewPassword.text isEqualToString:self.tfChceckPassword.text]) {
        [HWUtility showAlertView:I18NString(@"Error", nil) message:I18NString(@"The Checkpassword is not equal to new password", nil)];
        return NO;
    }
    
    return YES;
}


@end
