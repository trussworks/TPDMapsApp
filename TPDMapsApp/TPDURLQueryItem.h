//
//  TPDURLQueryItem.h
//  TPDMapsApp
//
//  Created by Mark Ferlatte on 9/17/14.
//  Copyright (c) 2014 Tetherpad. All rights reserved.
//

#import <Foundation/Foundation.h>

NSString *URLQueryStringFromTPDURLQueryItems(NSArray *queryItems);

@interface TPDURLQueryItem : NSObject

@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) NSString *value;

+ (instancetype)queryItemWithName:(NSString *)name
                            value:(NSString *)value;

- (instancetype)initWithName:(NSString *)name
                       value:(NSString *)value;

@end
