//
//  HWHost.h
//  HitronWifi
//
//  Created by Chunhui Li on 6/12/16.
//  Copyright © 2016 Movit. All rights reserved.
//

#import "BaseService.h"
/* deviceType */
typedef enum {
    DEVICE_TYPE_UNKONW     = 0,
    DEVICE_TYPE_MOBILE     = 1,
    DEVICE_TYPE_PC         = 2,
    DEVICE_TYPE_PRINTER    = 3
} DEVICE_TYPE;

typedef enum {
    CONNECT_TYPE_WIRELESS   = 1,
    CONNECT_TYPE_LAN        = 2
} CONNECT_TYPE;
    
@interface HWHost : BaseService
@property (nonatomic, strong) NSString *hostName;
@property (nonatomic, strong) NSString *macAddr;
@property (nonatomic, strong) NSString *ip;
@property (nonatomic, strong) NSString *icon;
@property (nonatomic, assign) DEVICE_TYPE deviceType;
@property (nonatomic, strong) NSString *status;
@property (nonatomic, assign) CONNECT_TYPE connectType;
@property (nonatomic, strong) NSString *hostID;
@end
