//
//  TPWazeMapsApp.m
//  TPMapsAppTest
//
//  Created by Mark Ferlatte on 9/11/13.
//  Copyright (c) 2013 Tetherpad. All rights reserved.
//

// Waze URL documentation:
// http://www.waze.com/dev/documentation/

#import "TPWazeMapsApp.h"

static NSString *const mapsBaseURLString = @"waze://";

@implementation TPWazeMapsApp

-(NSString *)name {
    return @"Waze";
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
                             @"q" : destination,
                             @"navigate" : @"yes"
                             };
    return [self openMapsAppWithBaseURLString:mapsBaseURLString params:params];
}

@end
