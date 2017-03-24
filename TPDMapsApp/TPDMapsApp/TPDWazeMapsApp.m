//
//  TPDWazeMapsApp.m
//  TPDMapsAppTest
//
//  Created by Mark Ferlatte on 9/11/13.
//  Copyright © 2013 Tetherpad. All rights reserved.
//

// Waze URL documentation:
// http://www.waze.com/dev/documentation/

@import UIKit;

#import "TPDWazeMapsApp.h"
#import "TPDURLUtilities.h"

static NSString *const mapsBaseURLString = @"waze://";

@implementation TPDWazeMapsApp

- (NSString *)name {
    return @"Waze";
}

- (NSURL *)baseURL {
    return [NSURL URLWithString:mapsBaseURLString];
}

- (NSArray<NSURLQueryItem *> *)queryItemsForDirectionsWithStart:(NSString *)start
                                                    destination:(NSString *)destination
                                                     travelMode:(enum TPDMapsAppTravelMode)travelMode {
    NSURLQueryItem *destinationQueryItem = [NSURLQueryItem queryItemWithName:@"q" value:destination];
    NSURLQueryItem *navigateQueryItem = [NSURLQueryItem queryItemWithName:@"navigate" value:@"yes"];
    NSMutableArray *queryItems = [NSMutableArray arrayWithObjects:destinationQueryItem, navigateQueryItem, nil];
    return queryItems;
}


- (BOOL)openForDirectionsWithStart:(NSString *)start
                       destination:(NSString *)destination
                        travelMode:(enum TPDMapsAppTravelMode)travelMode {
    NSDictionary *params = @{
                             @"q" : destination,
                             @"navigate" : @"yes"
                             };
    return OpenNSURLWithBaseURLStringAndParams(mapsBaseURLString, params);
}

@end
