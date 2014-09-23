//
//  TPDURLQueryItem.h
//  TPDMapsApp
//
//  Created by Mark Ferlatte on 9/17/14.
//  Copyright (c) 2014 Tetherpad. All rights reserved.
//

@import Foundation;

NSString *URLQueryStringFromTPDURLQueryItems(NSArray *queryItems);

/**
 TPDURLQueryItem is a copy of the NSURLQueryItem class introduced in iOS 8. This helps with iOS 7 support.
 */
@interface TPDURLQueryItem : NSObject

/**
 The name of the query item.
 */
@property (nonatomic, readonly) NSString *name;

/**
 The value of the query item.
 */
@property (nonatomic, readonly) NSString *value;

/**
 Creates a new query item with the specified name and value.
 
 @param name The name of the query item. For example, in the URL http://www.apple.com/search/?q=iPad, the name parameter is q.
 @param value The value for the query item. For example, in the URL http://www.apple.com/search/?q=iPad, the value parameter is iPad.
 */
+ (instancetype)queryItemWithName:(NSString *)name
                            value:(NSString *)value;

/**
 Initializes a newly allocated query item with the specified name and value.
 
 @param name The name of the query item. For example, in the URL http://www.apple.com/search/?q=iPad, the name parameter is q.
 @param value The value for the query item. For example, in the URL http://www.apple.com/search/?q=iPad, the value parameter is iPad.
 */
- (instancetype)initWithName:(NSString *)name
                       value:(NSString *)value;

@end
