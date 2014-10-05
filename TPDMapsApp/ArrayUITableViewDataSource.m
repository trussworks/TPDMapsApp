//
//  ArrayUITableViewDataSource.m
//  TPDMapsApp
//
//  Created by Mark Ferlatte on 9/18/14.
//  Copyright (c) 2014 Tetherpad. All rights reserved.
//

#import "ArrayUITableViewDataSource.h"

@interface ArrayUITableViewDataSource ()

@property (nonatomic, strong) NSArray *array;
@property (nonatomic, copy) NSString *cellIdentifier;
@property (nonatomic, copy) TableViewCellConfigureBlock configureCellBlock;

@end

@implementation ArrayUITableViewDataSource

- (instancetype)initWithArray:(NSArray *)anArray cellIdentifier:(NSString *)aCellIdentifier configureCellBlock:(TableViewCellConfigureBlock)aConfigureCellBlock {
    self = [super init];
    if (self) {
        _array = anArray;
        _cellIdentifier = aCellIdentifier;
        _configureCellBlock = aConfigureCellBlock;
    }
    return self;
}

- (id)itemAtIndexPath:(NSIndexPath *)indexPath {
    return self.array[(NSUInteger) indexPath.row];
}

#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return (NSInteger) self.array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier
                                                            forIndexPath:indexPath];
    id item = [self itemAtIndexPath:indexPath];
    self.configureCellBlock(cell, item);
    return cell;
}

@end
