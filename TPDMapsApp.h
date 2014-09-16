//
//  TPMapsApp.h
//
//  Created by Mark Ferlatte on 9/11/13.
//  Copyright (c) 2013 Tetherpad, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>


NS_ENUM(NSUInteger, TPMapsAppTravelMode) {
    TPMapsAppTravelModeNone = 0,
    TPMapsAppTravelModeDriving = 1,
    TPMapsAppTravelModeWalking = 2,
    TPMapsAppTravelModeBicycling = 3,
    TPMapsAppTravelModeTransit = 4
};

@interface TPMapsApp : NSObject

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
 @return An array of `TPMapsApp` objects representing every maps application that TPMapsApp knows about.
 */
+ (NSArray *)availableMapsApps;

/**
 @return An array of `TPMapsApp' objects for maps applications that are installed.
 */
+ (NSArray *)installedMapsApps;

/**
 @return A TPMapsApp for an identifier previously obtained from the identifier property. Useful for opening a map application that the customer has selected previously that you've stashed in `NSUserDefaults`.
 */
+ (TPMapsApp *)mapsAppWithIdentifier:(NSString *)identifier;

- (BOOL)isInstalled;

/**
 @return YES if the TPMapsApp objects refer to the same maps app, even if they are different objects.
 */
- (BOOL)isEqualToMapsApp:(TPMapsApp *)mapsApp;

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
 @param travelMode The preferred travel mode for the directions. Depending on the app used, some of these modes will not be available. If in doubt, use TPMapsAppTravelModeDriving as a sane default.
 
 @return YES if the maps app opened successfully, NO otherwise.
 */
- (BOOL)openForDirectionsWithStart:(NSString *)start
                       destination:(NSString *)destination
                        travelMode:(enum TPMapsAppTravelMode)travelMode;

- (BOOL)openMapsAppWithBaseURLString:(NSString *)baseURLString params:(NSDictionary *)params;

@end
