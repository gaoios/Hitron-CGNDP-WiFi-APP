//
//  I18NController.m
//  danone
//
//  Created by Nathan.Li on 5/13/14.
//  Copyright (c) 2014 Movit. All rights reserved.
//

#import "I18NController.h"

NSString * const I18NControllerLanguageChangedNotification = @"I18NControllerLanguageChangedNotification";

@implementation I18NController

static NSBundle *bundle = nil;
static NSString *currentLanguage = nil;
+ (NSBundle *)bundle{
    if (bundle == nil) {
        NSString *lan = [[NSUserDefaults standardUserDefaults] stringForKey:@"I18NController.userLanguage"];
        if (lan.length) {
            [self setLanguage:lan];
        } else {
            [self setLanguage:[self defaultLanguage]];
        }
    }
    return bundle;
}
+ (void)setLanguage:(NSString *)language {
    NSString *path = [[NSBundle mainBundle] pathForResource:language ofType:@"lproj" ];
    bundle = [NSBundle bundleWithPath:path];
    currentLanguage = language;
    [[NSUserDefaults standardUserDefaults] setObject:language forKey:@"I18NController.userLanguage"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [[NSNotificationCenter defaultCenter] postNotificationName:I18NControllerLanguageChangedNotification object:nil];
}
+ (NSString *)currentLanguage {
    if (currentLanguage == nil) {
        NSString *lan = [[NSUserDefaults standardUserDefaults] stringForKey:@"I18NController.userLanguage"];
        if (lan.length) {
            [self setLanguage:lan];
        } else {
            [self setLanguage:[self defaultLanguage]];
        }
    }
    return currentLanguage;
}
+ (NSString *)currentLanguageId {
    NSString *languageId = nil;
    NSString *language = [self currentLanguage];
    if ([language isEqualToString:@"zh-Hant-HK"]) {
        languageId = @"zh_HK";
    } else if ([language isEqualToString:@"zh-Hant-TW"]) {
        languageId = @"zh_TW";
    } else if ([language isEqualToString:@"zh-Hans"]){
        languageId = @"zh_CN";
    } else {
        languageId = @"en";
    }
    return languageId;
}
+ (NSString *)systemLanguage {
    static NSString *preferredLang;
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        NSUserDefaults* defs = [NSUserDefaults standardUserDefaults];
        NSArray* languages = [defs objectForKey:@"AppleLanguages"];
        preferredLang = [languages objectAtIndex:0];
    });
    return preferredLang;
}

+ (NSString *)defaultLanguage {
    NSString *sysLan = [self systemLanguage];
    if([sysLan isEqualToString:@"zh-HK"]) {
        return @"zh-Hant-HK";
    } else if ([sysLan isEqualToString:@"zh-TW"] || [sysLan hasPrefix:@"zh-Hant"]) {
        return @"zh-Hant-TW";
    } else if([sysLan hasPrefix:@"zh-Hans"]) {
        return @"zh-Hans";
    } else {
        return @"en";
    }
}
@end
