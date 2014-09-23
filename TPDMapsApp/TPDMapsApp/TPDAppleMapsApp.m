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
#import "TPDURLUtilities.h"

static NSString *const mapsBaseURLString = @"http://maps.apple.com/";

@implementation TPDAppleMapsApp

- (NSString *)name {
    return @"Apple";
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
    return OpenNSURLWithBaseURLStringAndParams(mapsBaseURLString, params);
}

- (BOOL)openForDirectionsWithStart:(NSString *)start
                       destination:(NSString *)destination
                        travelMode:(enum TPDMapsAppTravelMode)travelMode {
    NSDictionary *params = @{
                             @"saddr" : start,
                             @"daddr" : destination
                             };
    return OpenNSURLWithBaseURLStringAndParams(mapsBaseURLString, params);
}

@end
