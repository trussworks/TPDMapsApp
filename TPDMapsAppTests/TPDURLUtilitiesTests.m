//
//  TPDURLUtilitiesTests.m
//  TPDMapsApp
//
//  Created by Mark Ferlatte on 9/23/14.
//  Copyright (c) 2014 Tetherpad. All rights reserved.
//

@import UIKit;
@import XCTest;

#import "TPDURLUtilities.h"

@interface TPDURLUtilitiesTests : XCTestCase

@end

@implementation TPDURLUtilitiesTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testMakesURLCorrectly {
    NSString *baseURL = @"comgoogle://";
    NSString *queryValue = @"abcdefghijklmnop1234567880!@#$%^&*()_+=-üü<>,.//";
    NSString *queryName = @"testQueryName";
    NSURLQueryItem *queryItem = [NSURLQueryItem queryItemWithName:queryName value:queryValue];
    NSURLComponents *urlComponents = [NSURLComponents componentsWithString:baseURL];
    urlComponents.queryItems = @[queryItem];

    NSURL *urlToBeTested = NSURLWithBaseURLStringAndParams(baseURL, @{ queryName: queryValue });
    XCTAssertEqualObjects(urlToBeTested,
                          urlComponents.URL,
                          @"NSURLWithBaseURLStringAndParams MUST make a complex URL correctly");
}

- (void)testMakesURLCorrectlyWithMultipleParams {
    NSString *baseURL = @"comgoogle://";
    NSString *queryValue = @"abcdefghijklmnop1234567880!@#$%^&*()_+=-üü<>,.//";
    NSString *queryName = @"testQueryName";
    NSString *queryValue2 = @"überTester";
    NSString *queryName2 = @"testQueryName2";
    NSURLQueryItem *queryItem = [NSURLQueryItem queryItemWithName:queryName value:queryValue];
    NSURLQueryItem *queryItem2 = [NSURLQueryItem queryItemWithName:queryName2 value:queryValue2];

    NSURLComponents *urlComponents = [NSURLComponents componentsWithString:baseURL];
    urlComponents.queryItems = [@[queryItem2, queryItem] sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        NSURLQueryItem *item1 = obj1;
        NSURLQueryItem *item2 = obj2;
        return [item1.name compare:item2.name];
    }];

    NSURL *urlToBeTested = NSURLWithBaseURLStringAndParams(baseURL, @{ queryName: queryValue, queryName2: queryValue2 });
    XCTAssertEqualObjects(urlToBeTested,
                          urlComponents.URL,
                          @"NSURLWithBaseURLStringAndParams MUST make a URL with multiple params correctly");
}
@end
