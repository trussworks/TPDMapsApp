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
                             @"q" : destination,
                             @"navigate" : @"yes"
                             };
    return OpenNSURLWithBaseURLStringAndParams(mapsBaseURLString, params);
}

@end
