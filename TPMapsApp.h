//
//  TPMapsApp.h
//
//  Created by Mark Ferlatte on 9/11/13.
//  Copyright (c) 2013 Tetherpad, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ENUM(NSInteger, TPMapsAppTravelMode) {
    TPMapsAppTravelModeNone = 0,
    TPMapsAppTravelModeDriving = 1,
    TPMapsAppTravelModeWalking = 2,
    TPMapsAppTravelModeBicycling = 3,
    TPMapsAppTravelModeTransit = 4
};

@interface TPMapsApp : NSObject

@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly, getter = isInstalled) BOOL installed;

+ (NSArray *)availableMapsApps;

- (BOOL)isInstalled;

// 'Cupertino', or '37.77493,-122.419416'
- (BOOL)openWithQuery:(NSString *)query;

- (BOOL)openForDirectionsWithStart:(NSString *)start
                       destination:(NSString *)destination
                        travelMode:(enum TPMapsAppTravelMode)travelMode;

- (BOOL)openMapsAppWithBaseURLString:(NSString *)baseURLString params:(NSDictionary *)params;

@end
