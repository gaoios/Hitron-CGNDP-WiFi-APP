//
//  I18NController.h
//  danone
//
//  Created by Nathan.Li on 5/13/14.
//  Copyright (c) 2014 Movit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface I18NController : NSObject
+(NSBundle *)bundle;
+(void)setLanguage:(NSString *)language;
+(NSString*)currentLanguage;
+(NSString*)currentLanguageId;
@end

extern NSString * const I18NControllerLanguageChangedNotification;