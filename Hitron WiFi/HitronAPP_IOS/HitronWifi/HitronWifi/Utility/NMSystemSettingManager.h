//
//  NMSystemSettingManager.h
//  PTYExample
//
//  Created by Neo Gao on 16/5/19.
//  Copyright © 2016年 Nine Muses. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NMSystemSettingManager : NSObject

+(NMSystemSettingManager *)shareInstance;

+(NSDictionary *)systemSettingDictionary;

@end
