//
//  HWUserManager.m
//  HitronWifi
//
//  Created by Neo Gao on 16/6/7.
//  Copyright © 2016年 Movit. All rights reserved.
//

#import "HWUserManager.h"
#import "HWUserInfoService.h"
#import "HWUser.h"


#define HWWIFI_RELATIVEURL_TEMPACESS @"Device/WiFi/TempAccess"

#define HWUSER_INFOMATION_RELATIVEURL_USER @"Device/Users"
#define HWUSER_INFOMATION_RELATIVEURL_LOGIN @"Device/Users/Login"
#define HWUSER_INFOMATION_RELATIVEURL_LOGIN_STATUS @"Device/Users/LoginStatus"
#define HWUSER_INFOMATION_RELATIVEURL_LOGOUT @"Device/Users/Logout"
#define HWUSER_INFOMATION_RELATIVEURL_NAMECHECK @"Device/Users/Namecheck"
#define HWUSER_INFOMATION_RELATIVEURL_PASSWORD @"Device/Users/Password"


@implementation HWUserManager

+(HWUserManager *)getInstance{
    static dispatch_once_t once;
    static id instance;
    
    dispatch_once(&once, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

+ (NSString *)getUserName{
    return [[self alloc] getCurrentUserName];
}

+ (NSString *)getUserID{
    return [[self alloc] getCurrentUserID];
}

- (NSString *)getCurrentUserName{
    return @"alice9527@hitron.com";
}

- (NSString *)getCurrentUserID{
    return @"u0";
}


#pragma mark - User Data Structure Manipulation
- (void) getAllUserSucess:(void (^)(NSArray *))success Failure:(void (^)(NSError *))failure {
    NSString *relativeUrl = HWUSER_INFOMATION_RELATIVEURL_USER;
    
    [HWUserInfoService doGet:relativeUrl params:@"" success:^(NSString *res){
        NSDictionary *responseDic = [res JSONObject];
        NSArray *user_list = [responseDic objectForKey:@"Users_List"];
        
        [HWUser setupObjectClassInArray:^NSDictionary *{
            return @{
                        @"Hosts_List":@"HWHost"
                     };
        }];
        NSArray *user_model_list = [HWUser objectArrayWithKeyValuesArray:user_list];
        if (success && user_model_list) {
            success(user_model_list);
        }
    } failure:^(NSError *err){
        NSLog(@"Reponse:%@",err);
        failure(err);
    }];
}

- (void) getUser:(HWUser *)user Sucess:(void (^)(HWUser *))success Failure:(void (^)(NSError *))failure{
    NSString *relativeUrl = HWUSER_INFOMATION_RELATIVEURL_USER;
    NSString *relativeUserUrl = [NSString stringWithFormat:@"%@/%@",relativeUrl,user.userID];
    
    [HWUserInfoService doGet:relativeUserUrl params:@"" success:^(NSString *res){
        NSDictionary *responseDic = [res JSONObject];
        
        HWUser *responseUser = [HWUser objectWithKeyValues:responseDic];
        success(responseUser);
        
        NSLog(@"Reponse:%@",relativeUrl);
    } failure:^(NSError *err){
        failure(err);
    }];
}

- (void) removeUser:(HWUser *)user Sucess:(void (^)(NSString *))success Failure:(void (^)(NSError *))failure{
    NSString *relativeUrl = HWUSER_INFOMATION_RELATIVEURL_USER;
    NSString *relativeUserUrl = [NSString stringWithFormat:@"%@/%@",relativeUrl,user.userID];
    
    [HWUserInfoService doGet:relativeUserUrl params:@"" success:^(NSString *res){
        NSDictionary *responseDic = [res JSONObject];
        
        success(@"");
        
        NSLog(@"Reponse:%@",relativeUrl);
    } failure:^(NSError *err){
        failure(err);
    }];
}


#pragma mark - Single User Access
- (void) setUserPassWord:(NSString *)oldPassword NewPassword:(NSString *)newPassword CheckNewPassword:(NSString *)checkPassword Name:(NSString *)name Sucess:(void (^)(BOOL))success Failure:(void (^)(NSError *))failure{
    NSDictionary *postDic = @{
                              @"name":name,
                              @"oldpwd":oldPassword,
                              @"newpwd":newPassword,
                              @"check_newpwd":checkPassword
                              };
    
    
    
    [HWUserInfoService doPost:HWUSER_INFOMATION_RELATIVEURL_PASSWORD params:postDic success:^(NSString *res){
        NSDictionary *responseDic = [res JSONObject];
        
        NSLog(@"%@",responseDic);
        if (responseDic) {
            if ([[responseDic objectForKey:@"errCode"] isEqualToString:@"000"]) {
                success(YES);
            }else{
                //HW AlertView Show the Error message
            }
        }
        
    } failure:^(NSError *err){
        failure(err);
    }];
}

- (void) doUserLogoutWith:(NSString *)userID Mac:(NSString *)mac Sucess:(void (^)(BOOL))success Failure:(void (^)(NSError *))failure{
    
}

- (void) doUserLogoutSucess:(void (^)(BOOL))success Failure:(void (^)(NSError *))failure{
    
    NSString *userID = [self getCurrentUserID];
    NSString *userIP = [HWUtility wifiIPAddress];
    NSDictionary *par = @{
                          @"userID":userID,
                          @"ip":userIP
                          };
    
    
    [HWUserInfoService doPost:HWUSER_INFOMATION_RELATIVEURL_LOGOUT params:[par JSONString] success:^(NSString *res){
        NSDictionary *responseDic = [res JSONObject];
        
        NSLog(@"%@",responseDic);
        if (responseDic) {
            if ([[responseDic objectForKey:@"errCode"] isEqualToString:@"000"]) {
                success(YES);
            }else{
                //HW AlertView Show the Error message
            }
        }
        
    } failure:^(NSError *err){
        failure(err);
    }];
}

- (void) doUserLogoutWith:(NSString *)userID IP:(NSString *)ip Sucess:(void (^)(BOOL))success Failure:(void (^)(NSError *))failure{
    NSDictionary *par = @{
                          @"userID":userID,
                          @"ip":ip
                          };
    
    
    [HWUserInfoService doPost:HWUSER_INFOMATION_RELATIVEURL_LOGOUT params:[par JSONString] success:^(NSString *res){
        NSDictionary *responseDic = [res JSONObject];
        
        NSLog(@"%@",responseDic);
        if (responseDic) {
            if ([[responseDic objectForKey:@"errCode"] isEqualToString:@"000"]) {
                success(YES);
            }else{
                //HW AlertView Show the Error message
            }
        }
        
    } failure:^(NSError *err){
        failure(err);
    }];
}

- (void) doTempAccessSucess:(void (^)(BOOL))success Failure:(void (^)(NSError *))failure{
    //get current ip address
    NSString *currentip = [HWUtility wifiIPAddress];
    
    if (currentip) {
        [HWUserInfoService doPost:HWWIFI_RELATIVEURL_TEMPACESS params:currentip success:^(NSString *res){
            NSDictionary *responseDic = [res JSONObject];
            
            NSLog(@"%@",responseDic);
            if (responseDic) {
                if ([[responseDic objectForKey:@"errCode"] isEqualToString:@"000"]) {
                    success(YES);
                }else{
                    //HW AlertView Show the Error message
                }
            }
            
        } failure:^(NSError *err){
            failure(err);
        }];
    }
}

- (void) doTempAccess:(NSString *)ip Sucess:(void (^)(BOOL))success Failure:(void (^)(NSError *))failure{
    [HWUserInfoService doPost:HWWIFI_RELATIVEURL_TEMPACESS params:ip success:^(NSString *res){
        NSDictionary *responseDic = [res JSONObject];
        
        NSLog(@"%@",responseDic);
        if (responseDic) {
            if ([[responseDic objectForKey:@"errCode"] isEqualToString:@"000"]) {
                success(YES);
            }else{
                //HW AlertView Show the Error message
            }
        }
        
    } failure:^(NSError *err){
        failure(err);
    }];

}


#pragma mark - Admin User Manipulation
- (void)doEditUserWith:(HWUser *)user Type:(HWUserEditType)type Sucess:(void (^)(BOOL))success Failure:(void (^)(NSError *))failure{
    NSString *opType = @"";
    switch (type) {
        case HWUserEditTypePut:{
            opType = @"Put";
        }
            break;
        case HWUserEditTypePatch:{
            opType = @"Patch";
        }
            break;
        case HWUserEditTypeDelete:{
            opType = @"Delete";
        }
            break;
            
        default:
            break;
    }
    
}



@end
