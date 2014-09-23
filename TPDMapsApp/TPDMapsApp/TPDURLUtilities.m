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
    NSURLComponents *mapURLComponent = [NSURLComponents componentsWithString:baseURLString];
    if ([NSURLQueryItem class]) {
        for (NSString *key in params) {
            NSURLQueryItem *item = [NSURLQueryItem queryItemWithName:key value:[params objectForKey:key]];
            [queryItems addObject:item];
        }
        mapURLComponent.queryItems = queryItems;
    } else {
        for (NSString *key in params) {
            TPDURLQueryItem *item = [TPDURLQueryItem queryItemWithName:key value:[params objectForKey:key]];
            [queryItems addObject:item];
        }
        mapURLComponent.query = URLQueryStringFromTPDURLQueryItems(queryItems);
    }
    return mapURLComponent.URL;
}
