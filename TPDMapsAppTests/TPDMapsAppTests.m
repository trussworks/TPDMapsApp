//
//  TPDMapsAppTests.m
//  TPDMapsAppTests
//
//  Created by Mark Ferlatte on 9/16/14.
//  Copyright © 2014 Tetherpad. All rights reserved.
//

@import UIKit;
@import XCTest;

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

- (void)testNumberOfAvailableMapsApps {
    NSArray *availableApps = [TPDMapsApp availableMapsApps];
    XCTAssertEqual([availableApps count], 3UL);
}

@end
