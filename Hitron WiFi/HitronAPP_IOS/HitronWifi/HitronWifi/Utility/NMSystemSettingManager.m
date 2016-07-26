//
//  NMSystemSettingManager.m
//  PTYExample
//
//  Created by Neo Gao on 16/5/19.
//  Copyright © 2016年 Nine Muses. All rights reserved.
//

#import "NMSystemSettingManager.h"

@implementation NMSystemSettingManager


+(NMSystemSettingManager *)shareInstance{
    static dispatch_once_t onceToken;
    static NMSystemSettingManager *manager;
    dispatch_once(&onceToken, ^{
        manager = [[NMSystemSettingManager alloc]init];
    });
    return manager;
}

+(NSDictionary *)systemSettingDictionary{
    NSString  *mainBundlePath = [[NSBundle mainBundle] bundlePath];
    NSString  *settingsPropertyListPath = [mainBundlePath
                                           stringByAppendingPathComponent:@"Settings.bundle/Root.plist"];
    
    NSDictionary *settingsPropertyList = [NSDictionary
                                          dictionaryWithContentsOfFile:settingsPropertyListPath];
    NSMutableArray      *preferenceArray = [settingsPropertyList objectForKey:@"PreferenceSpecifiers"];
    NSMutableDictionary *registerableDictionary = [NSMutableDictionary dictionary];
    
    for (int i = 0; i < [preferenceArray count]; i++)  {
        NSString  *key = [[preferenceArray objectAtIndex:i] objectForKey:@"Key"];
        
        if (key)  {
            id  value = [[preferenceArray objectAtIndex:i] objectForKey:@"DefaultValue"];
            if(value != nil)
                [registerableDictionary setObject:value forKey:key];
        }
    }
    
    [[NSUserDefaults standardUserDefaults] registerDefaults:registerableDictionary];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    return registerableDictionary;
}

@end
