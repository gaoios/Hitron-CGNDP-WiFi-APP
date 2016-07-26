//
//  UIView+IBInspect.h
//  tr90
//
//  Created by Chunhui Li on 12/9/15.
//  Copyright © 2015 Movit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIView(IBInspect)
@property (nonatomic, assign) IBInspectable CGFloat borderWidth;
@property (nonatomic, assign) IBInspectable UIColor *borderColor;
@property (nonatomic, assign) IBInspectable CGFloat cornerRadius;
@end


@interface UILabel(IBInspect)
@property (nonatomic, assign) IBInspectable NSString *textKey;
@end

@interface UIButton(IBInspect)
@property (nonatomic, assign) IBInspectable NSString *textKey_normal;
@property (nonatomic, assign) IBInspectable NSString *textKey_selected;

@property (nonatomic, assign) IBInspectable UIColor *bgColor_normal;
@property (nonatomic, assign) IBInspectable UIColor *bgColor_selected;
@property (nonatomic, assign) IBInspectable UIColor *bgColor_highlight;
@end

@interface UITextField(IBInspect)
@property (nonatomic, assign) IBInspectable NSString *textKey;
@property (nonatomic, assign) IBInspectable NSString *placeholderKey;
@end

@interface UINavigationItem(IBInspect)
@property (nonatomic, assign) IBInspectable NSString *textKey;
@end

@interface UIBarItem(IBInspect)
@property (nonatomic, assign) IBInspectable NSString *textKey;
@end