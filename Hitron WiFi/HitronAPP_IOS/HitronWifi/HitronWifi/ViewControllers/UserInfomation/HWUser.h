//
//  HWUser.h
//  HitronWifi
//
//  Created by ourtrip on 16/6/7.
//  Copyright © 2016年 Movit. All rights reserved.
//

#import "BaseModel.h"

@class HWHost;

@interface HWUser : BaseModel

typedef enum {
    SexMale,
    SexFemale,
    SexSecret
} Sex;

typedef enum {
    RoleUser,
    RoleAdmin
} Role;

typedef enum {
    StatusOnline,
    StatusAdmin
} Status;

//Authorization
@property(strong,nonatomic) NSString *userID;
@property(strong,nonatomic) NSString *token;

//User Info
@property(strong,nonatomic) NSString *name;
@property(strong,nonatomic) NSString *password;
@property(strong,nonatomic) NSString *nickname;
@property(strong,nonatomic) NSString *icon;
@property(strong,nonatomic) NSString *fwLevel;
@property(strong,nonatomic) NSString *TmFilter_URI;
@property(strong,nonatomic) NSString *KwdFilter_URI;
@property(strong,nonatomic) NSString *SrvFilter_URI;
@property(strong,nonatomic) NSArray *Hosts_List;

@property(assign,nonatomic) NSString *role;
@property(assign,nonatomic) NSString *gender;
@property(assign,nonatomic) NSString *status;

@property(assign,nonatomic,getter=isAdmin) BOOL admin;


- (HWUser *)init;

- (HWUser *)initWithJson;


@end
