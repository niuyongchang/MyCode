//
//  ____Tests.m
//  单元测试Tests
//
//  Created by 123 on 16/2/18.
//  Copyright © 2016年 北京物网科技有限公司. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface ____Tests : XCTestCase

@end

@implementation ____Tests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    
    NSLog(@"测试方法");
    int a = 3;
    XCTAssertTrue(a == 3 , "a 不等于0");
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
//        [self testExample];
        // Put the code you want to measure the time of here.
    }];
}

@end
