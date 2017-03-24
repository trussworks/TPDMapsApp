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

- (NSURL *)baseURL {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:[NSString stringWithFormat:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)]
                                 userInfo:nil];
}

// Apple Maps, Google Maps, and Waze all use the same query param for query
// so we just have the implementation in the base class.
- (NSArray<NSURLQueryItem *> *)queryItemsWithQuery:(NSString *)query {
    NSURLQueryItem *queryItem = [NSURLQueryItem queryItemWithName:@"q" value:query];
    return @[queryItem];
}

- (NSArray<NSURLQueryItem *> *)queryItemsForDirectionsWithStart:(NSString *)start
                                  destination:(NSString *)destination
                                   travelMode:(enum TPDMapsAppTravelMode)travelMode {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:[NSString stringWithFormat:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)]
                                 userInfo:nil];
}

- (BOOL)isInstalled {
    return [[UIApplication sharedApplication] canOpenURL:[self baseURL]];
}

- (NSString *)identifier {
    return [[self baseURL] absoluteString];
}

- (BOOL)isEqualToMapsApp:(TPDMapsApp *)mapsApp {
    if (! mapsApp) {
        return NO;
    }
    return [self.identifier isEqualToString:mapsApp.identifier];
}

- (BOOL)openWithQuery:(NSString *)query {
    NSArray *queryItems = [self queryItemsWithQuery:query];
    return [self openWithQueryItems:queryItems];
}

- (void)openWithQuery:(NSString *)query completionHandler:(void (^)(BOOL success))completion {
    NSArray *queryItems = [self queryItemsWithQuery:query];
    [self openWithQueryItems:queryItems completionHandler:completion];
}

- (BOOL)openForDirectionsWithStart:(NSString *)start
                       destination:(NSString *)destination
                        travelMode:(enum TPDMapsAppTravelMode)travelMode {
    NSArray *queryItems = [self queryItemsForDirectionsWithStart:start destination:destination travelMode:travelMode];
    return [self openWithQueryItems:queryItems];
}

- (void)openForDirectionsWithStart:(NSString *)start
                       destination:(NSString *)destination
                        travelMode:(enum TPDMapsAppTravelMode)travelMode
                 completionHandler:(void (^)(BOOL success))completion {
    NSArray *queryItems = [self queryItemsForDirectionsWithStart:start destination:destination travelMode:travelMode];
    [self openWithQueryItems:queryItems completionHandler:completion];
}

- (BOOL)openWithQueryItems:(NSArray<NSURLQueryItem *> *)queryItems {
    NSArray *sortedQueryItems = [queryItems sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        NSURLQueryItem *item1 = obj1;
        NSURLQueryItem *item2 = obj2;
        return [item1.name compare:item2.name];
    }];
    NSURLComponents *mapURLComponents = [NSURLComponents componentsWithURL:[self baseURL] resolvingAgainstBaseURL:NO];
    mapURLComponents.queryItems = sortedQueryItems;
    if (mapURLComponents.URL) {
        NSURL * _Nonnull url = (NSURL * _Nonnull)mapURLComponents.URL;
        return [[UIApplication sharedApplication] openURL:url];
    }
    return NO;
}

- (void)openWithQueryItems:(NSArray<NSURLQueryItem *> *)queryItems completionHandler:(void (^)(BOOL success))completion {
    NSArray *sortedQueryItems = [queryItems sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        NSURLQueryItem *item1 = obj1;
        NSURLQueryItem *item2 = obj2;
        return [item1.name compare:item2.name];
    }];
    NSURLComponents *mapURLComponents = [NSURLComponents componentsWithURL:[self baseURL] resolvingAgainstBaseURL:NO];
    mapURLComponents.queryItems = sortedQueryItems;
    BOOL retval = NO;
    if (mapURLComponents.URL) {
        NSURL * _Nonnull url = (NSURL * _Nonnull)mapURLComponents.URL;
        if ([UIApplication instancesRespondToSelector:@selector(openURL:options:completionHandler:)]) {
            [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:completion];
        } else {
            retval = [[UIApplication sharedApplication] openURL:url];
            completion(retval);
        }
    } else {
        completion(retval);
    }
}

@end
