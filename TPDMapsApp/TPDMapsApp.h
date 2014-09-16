//
//  TPDMapsApp.h
//
//  Created by Mark Ferlatte on 9/11/13.
//  Copyright (c) 2013 Tetherpad, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>


NS_ENUM(NSUInteger, TPDMapsAppTravelMode) {
    TPDMapsAppTravelModeNone = 0,
    TPDMapsAppTravelModeDriving = 1,
    TPDMapsAppTravelModeWalking = 2,
    TPDMapsAppTravelModeBicycling = 3,
    TPDMapsAppTravelModeTransit = 4
};

@interface TPDMapsApp : NSObject

/**
 The name of the maps application, suitable for showing to the customer.
 */
@property (nonatomic, readonly) NSString *name;

/**
 Is the maps application in question is installed on the device?
 */
@property (nonatomic, readonly, getter = isInstalled) BOOL installed;

/**
 An identifier for the maps application, suitable for storing in `NSUserDefaults`.
 */
@property (nonatomic, readonly) NSString *identifier;

/**
 @return An array of `TPDMapsApp` objects representing every maps application that TPDMapsApp knows about.
 */
+ (NSArray *)availableMapsApps;

/**
 @return An array of `TPDMapsApp' objects for maps applications that are installed.
 */
+ (NSArray *)installedMapsApps;

/**
 @return A TPDMapsApp for an identifier previously obtained from the identifier property. Useful for opening a map application that the customer has selected previously that you've stashed in `NSUserDefaults`.
 */
+ (TPDMapsApp *)mapsAppWithIdentifier:(NSString *)identifier;

- (BOOL)isInstalled;

/**
 @return YES if the TPDMapsApp objects refer to the same maps app, even if they are different objects.
 */
- (BOOL)isEqualToMapsApp:(TPDMapsApp *)mapsApp;

/**
 Open the maps application and pass it the map query.
 
 @param query The query string to send to the maps app (like @"Cupertino" or @"37.77493,-122.419416").
 
 @return YES if the maps app opened successfully, NO otherwise.
 */
- (BOOL)openWithQuery:(NSString *)query;

/**
 Open the maps application and request directions between two locations.
 
 @param start The query string representing the directions start location.
 @param destination The query string representing the directions destination.
 @param travelMode The preferred travel mode for the directions. Depending on the app used, some of these modes will not be available. If in doubt, use TPDMapsAppTravelModeDriving as a sane default.
 
 @return YES if the maps app opened successfully, NO otherwise.
 */
- (BOOL)openForDirectionsWithStart:(NSString *)start
                       destination:(NSString *)destination
                        travelMode:(enum TPDMapsAppTravelMode)travelMode;

- (BOOL)openMapsAppWithBaseURLString:(NSString *)baseURLString params:(NSDictionary *)params;

@end
