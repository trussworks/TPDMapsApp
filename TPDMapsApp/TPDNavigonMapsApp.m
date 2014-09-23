//
//  TPDNavigonMapsApp.m
//  TPDMapsAppTest
//
//  Created by Mark Ferlatte on 9/11/13.
//  Copyright © 2013 Tetherpad. All rights reserved.
//

// Navigon URL documentation
// http://www.navigon.com/portal/common/faq/files/NAVIGON_AppInteract.pdf

@import UIKit;

#import "TPDNavigonMapsApp.h"

static NSString *const mapsBaseURLString = @"navigon://";

@implementation TPDNavigonMapsApp

-(NSString *)name {
    return @"Navigon";
}

-(BOOL)isInstalled {
    return [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:mapsBaseURLString]];
}

- (NSString *)identifier {
    return mapsBaseURLString;
}

// NOTE: The Navigon is stupid as shit. We'll need to geocode the query string so as to not hurt its tiny brain
- (BOOL)openWithQuery:(NSString *)query {
    return NO;
}

- (BOOL)openForDirectionsWithStart:(NSString *)start
                       destination:(NSString *)destination
                        travelMode:(enum TPDMapsAppTravelMode)travelMode {
    return NO;
}
@end
