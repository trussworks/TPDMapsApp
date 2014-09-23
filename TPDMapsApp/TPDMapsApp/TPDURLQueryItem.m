//
//  TPDURLQueryItem.m
//  TPDMapsApp
//
//  Created by Mark Ferlatte on 9/17/14.
//  Copyright (c) 2014 Tetherpad. All rights reserved.
//

#import "TPDURLQueryItem.h"

NSString *URLQueryStringFromTPDURLQueryItems(NSArray *queryItems) {
    if (queryItems) {
        NSMutableArray *queryStrings = [NSMutableArray array];
        for (TPDURLQueryItem *item in queryItems) {
            NSString *queryItemString = [NSString stringWithFormat:@"%@=%@",
                                         [item.name stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]],
                                         [item.value stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]]];
            [queryStrings addObject:queryItemString];
        }
        return [queryStrings componentsJoinedByString:@"&"];
    } else {
        return nil;
    }
}

@interface TPDURLQueryItem ()

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *value;

@end

@implementation TPDURLQueryItem

+ (instancetype)queryItemWithName:(NSString *)name
                            value:(NSString *)value {
    return [[self alloc] initWithName:name value:value];
}

- (instancetype)initWithName:(NSString *)name
                       value:(NSString *)value {
    if (self = [super init]) {
        _name = name;
        _value = value;
    }
    return self;
}

@end
