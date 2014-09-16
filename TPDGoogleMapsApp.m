//
//  TPGoogleMapsApp.m
//
//  Created by Mark Ferlatte on 9/11/13.
//  Copyright (c) 2013 Tetherpad. All rights reserved.
//

// Google Maps URL documentation:
// https://developers.google.com/maps/documentation/ios/urlscheme

#import "TPGoogleMapsApp.h"

static NSString *const mapsBaseURLString = @"comgooglemaps://";

@implementation TPGoogleMapsApp

- (NSString *)name {
    return @"Google";
}

- (BOOL)isInstalled {
    return [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:mapsBaseURLString]];
}

- (NSString *)identifier {
    return mapsBaseURLString;
}

- (BOOL)openWithQuery:(NSString *)query {
    NSDictionary *params = @{
                             @"q" : query
                             };
    return [self openMapsAppWithBaseURLString:mapsBaseURLString params:params];
}

- (BOOL)openForDirectionsWithStart:(NSString *)start
                       destination:(NSString *)destination
                        travelMode:(enum TPMapsAppTravelMode)travelMode {
    NSString *directionsMode = nil;
    switch (travelMode) {
        case TPMapsAppTravelModeDriving:
            directionsMode = @"driving";
            break;
        
        case TPMapsAppTravelModeWalking:
            directionsMode = @"walking";
            break;
            
        case TPMapsAppTravelModeTransit:
            directionsMode = @"transit";
            break;
            
        case TPMapsAppTravelModeBicycling:
            directionsMode = @"walking"; // Hopefully we'll get bicycling directions in the future
            break;
            
        default:
            directionsMode = @"driving"; // Sigh. It's sad that the default must be driving.
            break;
    }
    NSDictionary *params = @{
                             @"saddr" : start,
                             @"daddr" : destination,
                             @"directionsmode" : directionsMode
                             };
    return [self openMapsAppWithBaseURLString:mapsBaseURLString params:params];
}

@end
