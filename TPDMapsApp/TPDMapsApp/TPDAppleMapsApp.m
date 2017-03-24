//
//  TPDAppleMapsApp.m
//
//  Created by Mark Ferlatte on 9/11/13.
//  Copyright © 2013 Tetherpad. All rights reserved.
//

// Apple Maps URL documentation:
// http://developer.apple.com/library/ios/#featuredarticles/iPhoneURLScheme_Reference/Articles/MapLinks.html

@import UIKit;
#import "TPDAppleMapsApp.h"

static NSString *const mapsBaseURLString = @"http://maps.apple.com/";

@implementation TPDAppleMapsApp

- (NSString *)name {
    return @"Apple";
}

- (NSURL *)baseURL {
    return [NSURL URLWithString:mapsBaseURLString];
}

- (NSArray<NSURLQueryItem *> *)queryItemsForDirectionsWithStart:(NSString *)start
                                  destination:(NSString *)destination
                                   travelMode:(enum TPDMapsAppTravelMode)travelMode {
    NSURLQueryItem *startQueryItem = [NSURLQueryItem queryItemWithName:@"saddr" value:start];
    NSURLQueryItem *destinationQueryItem = [NSURLQueryItem queryItemWithName:@"daddr" value:destination];
    NSMutableArray *queryItems = [NSMutableArray arrayWithObjects:startQueryItem, destinationQueryItem, nil];
    return queryItems;
 }

@end
