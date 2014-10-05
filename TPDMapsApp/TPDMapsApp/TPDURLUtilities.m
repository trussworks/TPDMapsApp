//
//  TPDURLUtilities.m
//  TPDMapsApp
//
//  Created by Mark Ferlatte on 9/23/14.
//  Copyright © 2014 Tetherpad. All rights reserved.
//

@import UIKit;

#import "TPDURLUtilities.h"
#import "TPDURLQueryItem.h"

BOOL OpenNSURLWithBaseURLStringAndParams(NSString *baseURLString, NSDictionary *params) {
    NSURL *url = NSURLWithBaseURLStringAndParams(baseURLString, params);
    return [[UIApplication sharedApplication] openURL:url];
}

NSURL *NSURLWithBaseURLStringAndParams(NSString *baseURLString, NSDictionary *params) {
    NSMutableArray *queryItems = [NSMutableArray array];
    NSArray *sortedQueryItems;
    NSURLComponents *mapURLComponent = [NSURLComponents componentsWithString:baseURLString];
    if ([NSURLQueryItem class]) {
        for (NSString *key in params) {
            NSURLQueryItem *item = [NSURLQueryItem queryItemWithName:key value:[params objectForKey:key]];
            [queryItems addObject:item];
        }
        sortedQueryItems = [queryItems sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
            NSURLQueryItem *item1 = obj1;
            NSURLQueryItem *item2 = obj2;
            return [item1.name compare:item2.name];
        }];
        mapURLComponent.queryItems = sortedQueryItems;
    } else {
        for (NSString *key in params) {
            TPDURLQueryItem *item = [TPDURLQueryItem queryItemWithName:key value:[params objectForKey:key]];
            [queryItems addObject:item];
        }
        sortedQueryItems = [queryItems sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
            TPDURLQueryItem *item1 = obj1;
            TPDURLQueryItem *item2 = obj2;
            return [item1.name compare:item2.name];
        }];
        mapURLComponent.query = URLQueryStringFromTPDURLQueryItems(sortedQueryItems);
    }
    return mapURLComponent.URL;
}
