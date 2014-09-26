//
//  TPDMapsApp.m
//
//  Created by Mark Ferlatte on 9/11/13.
//  Copyright © 2013 Tetherpad, Inc. All rights reserved.
//

@import UIKit;
@import Dispatch;

#import "TPDMapsApp.h"
#import "TPDAppleMapsApp.h"
#import "TPDGoogleMapsApp.h"
#import "TPDWazeMapsApp.h"
#import "TPDURLQueryItem.h"

@implementation TPDMapsApp

#pragma mark - Class methods

+ (NSArray *)availableMapsApps {
    static NSArray *mapsApps;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // The order of this array is important; it should be ordered from least common to most common so that
        // we default to  maps app that the customer has explicitly installed, and then fall back to the common ones.
        mapsApps = @[
                     [[TPDWazeMapsApp alloc] init],
                     [[TPDGoogleMapsApp alloc] init],
                     [[TPDAppleMapsApp alloc] init]
                     ];

    });
    return mapsApps;
}

+ (NSArray *)availableMapsAppsSortedByName {
    return [[[self class] availableMapsApps] sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        TPDMapsApp *app1 = obj1;
        TPDMapsApp *app2 = obj2;
        return [app1.name compare:app2.name];
    }];
}

+ (NSArray *)installedMapsApps {
    NSArray *mapsApps = [self availableMapsApps];
    NSIndexSet *installedApps = [mapsApps indexesOfObjectsPassingTest:^BOOL(id obj, NSUInteger idx, BOOL *stop) {
        TPDMapsApp *app = obj;
        return app.installed;
    }];
    return [mapsApps objectsAtIndexes:installedApps];
}

+ (TPDMapsApp *)mapsAppWithIdentifier:(NSString *)identifier {
    NSArray *availableMapsApps = [self availableMapsApps];
    for (TPDMapsApp *app in availableMapsApps) {
        if ([app.identifier isEqualToString:identifier]) {
            return app;
        }
    }
    return nil;
}

#pragma mark - NSObject

- (NSString *)description {
    return [NSString stringWithFormat:@"<TPDMapApp name:%@>", self.name];
}

- (BOOL)isEqual:(id)object {
    if (self == object) {
        return YES;
    }
    if (! [object isKindOfClass:[self class]]) {
        return NO;
    }
    return [self isEqualToMapsApp:object];
}

- (NSUInteger)hash {
    return [self.identifier hash];
}

#pragma mark - TPDMapsApp

- (NSString *)name {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:[NSString stringWithFormat:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)]
                                 userInfo:nil];
}

- (BOOL)isInstalled {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:[NSString stringWithFormat:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)]
                                 userInfo:nil];
}

- (NSString *)identifier {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:[NSString stringWithFormat:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)]
                                 userInfo:nil];
}

- (BOOL)isEqualToMapsApp:(TPDMapsApp *)mapsApp {
    if (! mapsApp) {
        return NO;
    }
    return [self.identifier isEqualToString:mapsApp.identifier];
}

- (BOOL)openWithQuery:(NSString *)query {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:[NSString stringWithFormat:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)]
                                 userInfo:nil];
}

- (BOOL)openForDirectionsWithStart:(NSString *)start
                       destination:(NSString *)destination
                        travelMode:(enum TPDMapsAppTravelMode)travelMode {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:[NSString stringWithFormat:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)]
                                 userInfo:nil];
}

@end
