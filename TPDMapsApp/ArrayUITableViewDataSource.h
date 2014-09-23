//
//  ArrayUITableViewDataSource.h
//  TPDMapsApp
//
//  Created by Mark Ferlatte on 9/18/14.
//  Copyright (c) 2014 Tetherpad. All rights reserved.
//

@import UIKit;

typedef void (^TableViewCellConfigureBlock)(UITableViewCell *cell, id item);

@interface ArrayUITableViewDataSource : NSObject <UITableViewDataSource>

- (instancetype)initWithArray:(NSArray *)anArray cellIdentifier:(NSString *)aCellIdentifier configureCellBlock:(TableViewCellConfigureBlock)aConfigureCellBlock;

@end
