//
//  ViewController.m
//  TPDMapsApp
//
//  Created by Mark Ferlatte on 9/16/14.
//  Copyright © 2014 Tetherpad. All rights reserved.
//

#import "TPDMapsApp.h"
#import "ViewController.h"
#import "ArrayUITableViewDataSource.h"

@interface ViewController () <UITableViewDelegate>

@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic, strong) ArrayUITableViewDataSource *dataSource;
@property (nonatomic, strong) NSArray *availableMapsApps;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.availableMapsApps = [TPDMapsApp availableMapsAppsSortedByName];
    self.dataSource = [[ArrayUITableViewDataSource alloc] initWithArray:self.availableMapsApps
                                                         cellIdentifier:@"BasicCell"
                                                     configureCellBlock:^(UITableViewCell *cell, id item) {
                                                         TPDMapsApp *app = item;
                                                         cell.textLabel.text = app.name;
                                                         cell.textLabel.enabled = app.installed;
                                                         if (! app.installed) {
                                                             cell.selectionStyle = UITableViewCellSelectionStyleNone;
                                                         }
                                                     }];
    self.tableView.dataSource = self.dataSource;
    self.tableView.delegate = self;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    TPDMapsApp *app = [self.availableMapsApps objectAtIndex:(NSUInteger) indexPath.row];
    [app openWithQuery:@"1 Stockton St, San Francisco, CA 94108"];
}

@end
