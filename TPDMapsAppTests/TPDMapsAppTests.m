//
//  TPDMapsAppTests.m
//  TPDMapsAppTests
//
//  Created by Mark Ferlatte on 9/16/14.
//  Copyright © 2014 Tetherpad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "TPDMapsApp.h"

@interface TPDMapsAppTests : XCTestCase

@end

@implementation TPDMapsAppTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testNumberOfInstalledMapsApps {
    NSArray *installedApps = [TPDMapsApp installedMapsApps];
    XCTAssertEqual([installedApps count], 1UL);
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
