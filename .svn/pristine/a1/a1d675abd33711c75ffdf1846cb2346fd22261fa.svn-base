//
//  UIView+IBInspect.m
//  tr90
//
//  Created by Chunhui Li on 12/9/15.
//  Copyright © 2015 Movit. All rights reserved.
//

#import "UIView+IBInspect.h"
#import "Utility.h"

@implementation UIView(IBInspect)
- (void)setBorderColor:(UIColor*)borderColor {
    self.layer.borderColor = borderColor.CGColor;
}
- (void)setBorderWidth:(CGFloat)borderWidth {
    self.layer.borderWidth = borderWidth;
}
- (void)setCornerRadius:(CGFloat)cornerRadius {
    if (cornerRadius > 0) {
        self.clipsToBounds = YES;
    }
    self.layer.cornerRadius = cornerRadius;
}
- (CGFloat)borderWidth {
    return self.layer.borderWidth;
}
- (UIColor *)borderColor {
    return [UIColor colorWithCGColor:self.layer.borderColor];
}
- (CGFloat)cornerRadius {
    return self.layer.cornerRadius;
}
@end

@implementation UILabel(IBInspect)
- (void)setTextKey:(NSString *)textKey {
    self.text = I18NString(textKey, @"IBInspectable");
}
- (NSString *)textKey {
    return self.text;
}
@end

@implementation UIButton(IBInspect)
- (void)setTextKey_normal:(NSString *)textKey_normal {
    [self setTitle:I18NString(textKey_normal, @"IBInspectable") forState:UIControlStateNormal];
}
- (NSString *)textKey_normal {
    return [self titleForState:UIControlStateNormal];
}
- (void)setTextKey_selected:(NSString *)textKey_selected {
    [self setTitle:I18NString(textKey_selected, @"IBInspectable") forState:UIControlStateSelected];
}
- (NSString *)textKey_selected {
    return [self titleForState:UIControlStateSelected];
}

- (void)setBgColor_normal:(UIColor *)backgroundColor_normal {
    [self setBackgroundImage:[UIImage imageWithColor:backgroundColor_normal size:CGSizeMake(1, 1) cornerRadius:self.cornerRadius] forState:UIControlStateNormal];
}
- (UIColor *)bgColor_normal {
    return nil;
}
- (void)setBgColor_selected:(UIColor *)bgColor_selected {
    [self setBackgroundImage:[UIImage imageWithColor:bgColor_selected size:CGSizeMake(1, 1) cornerRadius:self.cornerRadius] forState:UIControlStateSelected];
}
- (UIColor *)bgColor_selected {
    return nil;
}
- (void)setBgColor_highlight:(UIColor *)bgColor_highlight {
    [self setBackgroundImage:[UIImage imageWithColor:bgColor_highlight size:CGSizeMake(1, 1) cornerRadius:self.cornerRadius] forState:UIControlStateHighlighted];
}
- (UIColor *)bgColor_highlight {
    return nil;
}
@end

@implementation UITextField(IBInspect)
- (void)setTextKey:(NSString *)textKey {
    [self setText:I18NString(textKey, @"IBInspectable")];
}
- (NSString *)textKey {
    return self.text;
}

- (void)setPlaceholderKey:(NSString *)placeholderKey {
    self.placeholder = I18NString(placeholderKey, @"IBInspectable");
}
- (NSString *)placeholderKey {
    return self.placeholder;
}
@end

@implementation UINavigationItem(IBInspect)
- (void)setTextKey:(NSString *)textKey {
    [self setTitle:I18NString(textKey, @"IBInspectable")];
}
- (NSString *)textKey {
    return self.title;
}
@end

@implementation UIBarItem(IBInspect)
- (void)setTextKey:(NSString *)textKey {
    [self setTitle:I18NString(textKey, @"IBInspectable")];
}
- (NSString *)textKey {
    return self.title;
}
@end