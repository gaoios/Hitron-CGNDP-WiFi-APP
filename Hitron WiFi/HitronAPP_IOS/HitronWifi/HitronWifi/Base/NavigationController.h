//
//  NavigationController.h
//  linju
//
//  Created by Nathan.Li on 9/10/15.
//  Copyright (c) 2015 Movit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HWUtility.h"
@interface NavigationController : UINavigationController

@end

@interface PushSegue : UIStoryboardSegue
@property (nonatomic, assign) BOOL animate;
@end