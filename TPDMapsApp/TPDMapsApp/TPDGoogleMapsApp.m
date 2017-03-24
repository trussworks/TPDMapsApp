//
//  TPDGoogleMapsApp.m
//
//  Created by Mark Ferlatte on 9/11/13.
//  Copyright © 2013 Tetherpad. All rights reserved.
//

// Google Maps URL documentation:
// https://developers.google.com/maps/documentation/ios/urlscheme

@import UIKit;

#import "TPDGoogleMapsApp.h"

static NSString *const mapsBaseURLString = @"comgooglemaps://";

@implementation TPDGoogleMapsApp

- (NSString *)name {
    return @"Google";
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
    NSString *directionsMode = nil;
    switch (travelMode) {
        case TPDMapsAppTravelModeNone: // Alas, if we don't know, we should assume driving.
        case TPDMapsAppTravelModeDriving:
            directionsMode = @"driving";
            break;
            
        case TPDMapsAppTravelModeWalking:
            directionsMode = @"walking";
            break;
            
        case TPDMapsAppTravelModeTransit:
            directionsMode = @"transit";
            break;
            
        case TPDMapsAppTravelModeBicycling:
            directionsMode = @"walking"; // Hopefully we'll get bicycling directions in the future
            break;
    }
    NSURLQueryItem *directionsmodeQueryItem = [NSURLQueryItem queryItemWithName:@"directionsmode" value:directionsMode];
    [queryItems addObject:directionsmodeQueryItem];
    return queryItems;
}

@end
