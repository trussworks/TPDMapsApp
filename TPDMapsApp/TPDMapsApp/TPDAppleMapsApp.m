//
//  TPDAppleMapsApp.m
//
//  Created by Mark Ferlatte on 9/11/13.
//  Copyright © 2013 Tetherpad. All rights reserved.
//

// Apple Maps URL documentation:
// https://developer.apple.com/library/content/featuredarticles/iPhoneURLScheme_Reference/MapLinks/MapLinks.html

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
    NSString *dirflgMode = nil;
    switch (travelMode) {
        case TPDMapsAppTravelModeNone: // Alas, if we don't know, we should assume driving.
        case TPDMapsAppTravelModeDriving:
            dirflgMode = @"d";
            break;
            
        case TPDMapsAppTravelModeWalking:
            dirflgMode = @"w";
            break;
            
        case TPDMapsAppTravelModeTransit:
            dirflgMode = @"r";
            break;
            
        case TPDMapsAppTravelModeBicycling:
            dirflgMode = @"w"; // Hopefully we'll get bicycling directions in the future
            break;
    }
    NSURLQueryItem *dirflgQueryItem = [NSURLQueryItem queryItemWithName:@"dirflg" value:dirflgMode];
    [queryItems addObject:dirflgQueryItem];
    return queryItems;
 }

@end
