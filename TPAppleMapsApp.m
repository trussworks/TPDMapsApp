//
//  TPAppleMapsApp.m
//
//  Created by Mark Ferlatte on 9/11/13.
//  Copyright (c) 2013 Tetherpad. All rights reserved.
//

// Apple Maps URL documentation:
// http://developer.apple.com/library/ios/#featuredarticles/iPhoneURLScheme_Reference/Articles/MapLinks.html

#import "TPAppleMapsApp.h"

static NSString *const mapsBaseURLString = @"http://maps.apple.com/";

@implementation TPAppleMapsApp

-(NSString *)name {
    return @"Apple";
}

-(BOOL)isInstalled {
    return [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:mapsBaseURLString]];
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
    NSDictionary *params = @{
                             @"saddr" : start,
                             @"daddr" : destination
                             };
    return [self openMapsAppWithBaseURLString:mapsBaseURLString params:params];
}

@end
