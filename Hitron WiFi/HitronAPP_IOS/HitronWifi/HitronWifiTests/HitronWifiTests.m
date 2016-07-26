//
//  HitronWifiTests.m
//  HitronWifiTests
//
//  Created by Neo Gao on 16/5/31.
//  Copyright © 2016年 Movit. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ConnectTestService.h"

@interface HitronWifiTests : XCTestCase

@end

@implementation HitronWifiTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}


//- (void)testPerformanceExample {
//    // This is an example of a performance test case.
//    [self measureBlock:^{
//        // Put the code you want to measure the time of here.
//    }];
//}

- (void)testConnect{
    __block BOOL finished = NO;
    
    NSString *hostString = @"/1/Device/WiFi";
    [ConnectTestService doGet:hostString params:nil success:^(NSString *response){
        NSLog(@"%@",response);
        XCTAssertNotNil(response);
        finished = YES;
    } failure:^(NSError *err){
        NSLog(@"%@",err);
        XCTAssertNil(err);
        finished = YES;
    }];
    while (!finished) {
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
    }
}
@end
