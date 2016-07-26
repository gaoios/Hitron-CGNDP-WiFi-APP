//
//  HWRouterService.m
//  HitronWifi
//
//  Created by Chunhui Li on 6/12/16.
//  Copyright © 2016 Movit. All rights reserved.
//

#import "HWRouterService.h"

@implementation HWRouterService
+ (NSURLSessionDataTask*)routerStatusWithResult:(ResultBlock)result {
    return [self doGet:@"/1/Device/Router/Status" params:nil success:^(NSString *res) {
        if (result) {
            NSDictionary *obj = [res JSONObject];
            result([obj[@"errCode"] intValue] == 0, obj[@"errMsg"], obj);
        }
    } failure:^(NSError *e) {
        if (result) {
            result(0,e.localizedDescription,nil);
        }
    }];
}
@end
