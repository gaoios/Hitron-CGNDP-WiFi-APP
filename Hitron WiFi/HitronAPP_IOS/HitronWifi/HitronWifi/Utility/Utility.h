//
//  Utility.h
//  WebViewDemo
//
//  Created by Nathan.Li on 3/10/15.
//  Copyright (c) 2015 Movit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "I18NController.h"
#import "UIView+IBInspect.h"

#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]
#define CACHE_PATH [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0]
#define DOC_PATH [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]

#define SCREEN_HEIGHT [Utility screenBoundsFixedToPortraitOrientation].size.height
#define SCREEN_WIDTH [Utility screenBoundsFixedToPortraitOrientation].size.width

#define RGB(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define COLOR_BG_GRAY RGB(242,243,249)

#if defined(DEBUG)
#define TEST YES
#else
#define TEST NO
#define NSLog(format, ...)
#endif

#define FStr(format, ...) [NSString stringWithFormat:format, ##__VA_ARGS__]
#define AStr(str,aColor,aFont,aRang) [str attrStringWithColor:aColor font:aFont range:aRang]

#define I18NString(key,comment) key//[[I18NController bundle] localizedStringForKey:key value:key table:@"AppStrings"]

@interface UITabBar(CustomBadge)
- (void)setupBadge;
- (void)showBadgeAtItemIndex:(NSInteger)index;
- (void)hideBadgeAtItemIndex:(NSInteger)index;
- (void)hideAllBadge;
@end

@interface UIWebView (DataDetectorTypeNone)
-(void)awakeFromNib;
@end

@interface NSNull (KeyValue)
- (id)objectForKeyedSubscript:(id)key;
@end

@interface NSData (Save)
- (BOOL)saveToPath:(NSString *)path;
@end

@interface NSObject (Association)
- (id)associatedObjectForKey:(NSString*)key;
- (void)setAssociatedObject:(id)object forKey:(NSString*)key;
- (void)removeAssociatedObjectForKey:(NSString*)key;
@end

@interface UIAlertView (Block)
typedef void(^clickedButtonBlock)(NSInteger buttonIndex);
- (void)setButtonClickedBlock:(clickedButtonBlock)cbb;
@end

@interface UIActionSheet (Block) <UIActionSheetDelegate>
- (void)setButtonClickedBlock:(clickedButtonBlock)cbb;
@end

@interface UIImage (LCHEXT)
typedef NS_ENUM(NSUInteger, GradientType) {
    GradientTypeTopToBottom = 0,
    GradientTypeLeftToRight = 1,
    GradientTypeUpleftToLowright = 2,
    GradientTypeUprightToLowleft = 3,
};
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size cornerRadius:(CGFloat)cornerRadius;
+ (UIImage *)imageWithScreenshotForView:(UIView *)view;
+ (UIImage *)gradientColorImageFromColors:(NSArray*)colors gradientType:(GradientType)gradientType imgSize:(CGSize)imgSize;
@end


@interface NSString (SimpleAttributed)
- (NSMutableAttributedString *)attrStringWithAttributes:(NSDictionary*)attrs range:(NSRange)range;
- (NSMutableAttributedString *)attrStringWithColor:(UIColor*)color font:(UIFont*)font range:(NSRange)range;
@end

@interface NSString (MD5)
- (NSString *)md5HexDigest;
- (NSString *)trimmed;
@end

@interface Utility : NSObject
NSString* encodeToPercentEscapeString(NSString *string);
NSString* decodeFromPercentEscapeString(NSString *string);

+ (CGRect)screenBoundsFixedToPortraitOrientation;
+ (NSString *)appVersion;
+ (NSUInteger)deviceSystemMajorVersion;
+ (NSString *)platform;
+ (NSString *)wifiIPAddress;
+ (NSString *)wifiName;
+ (NSString *)createUUID;

+ (void)showAlertView:(NSString*)title message:(NSString*)msg;
+ (void)showAlertView:(NSString*)title message:(NSString*)msg buttonClickedBlock:(clickedButtonBlock)cbb;

+ (void)showNetworkActivityIndicator;
+ (void)hideNetworkActivityIndicator;

+ (void)showHUD;
+ (void)showHUDWithText:(NSString *)text;
+ (void)hideHUD;
+ (long long)folderSizeAtPath:(NSString*)folderPath;
+ (long long)fileSizeAtPath:(NSString*)filePath;
@end

@interface NSDate (Format)
- (NSString *)stringWithFormat:(NSString *)format;
+ (NSDate *)dateFromString:(NSString*)string format:(NSString *)format;
+ (NSDate *)dateFrom:(NSDate*)date year:(NSInteger)year month:(NSInteger)month day:(NSInteger)day;
+ (NSDate *)currentMonth;
@end
@interface NSNumber (Format)
- (NSString *)stringWithFormat:(NSString *)format;
- (NSString *)formatedStringValue;
@end