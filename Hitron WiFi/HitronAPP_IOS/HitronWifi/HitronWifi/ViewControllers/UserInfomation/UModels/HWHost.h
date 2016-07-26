//
//  HWHost.h
//  HitronWifi
//
//  Created by Neo Gao on 16/6/7.
//  Copyright © 2016年 Movit. All rights reserved.
//

#import "BaseModel.h"

@interface HWHost : BaseModel

/*
 {
 "hostName": "Yoo's Ipad2",
 "macAddr": "bb:cc:dd:ee:ff:gg",
 "ip": "192.168.0.24",
 "icon": "http://upload/hosticon/ipad.ico",
 "deviceType": "2",
 "connectType": "1",
 "hostID": "d1"
 }
 */

@property(strong,nonatomic)NSString *hostName;
@property(strong,nonatomic)NSString *macAddr;
@property(strong,nonatomic)NSString *icon;
@property(strong,nonatomic)NSString *deviceType;
@property(strong,nonatomic)NSString *connectType;
@property(strong,nonatomic)NSString *hostID;


@end
