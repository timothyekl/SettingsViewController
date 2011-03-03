//
//  PrimarySettingsViewController.m
//  SettingsViewControllerDemo
//
//  Created by Tim Ekl on 3/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PrimarySettingsViewController.h"

#import "RootViewController.h"

#import "Setting.h"
#import "MutableOrderedDictionary.h"

@implementation PrimarySettingsViewController

@synthesize rootViewController = _rootViewController;

- (void)buildSettings {
    self.settings = [[[MutableOrderedDictionary alloc] initWithCapacity:1] autorelease];
    Setting * rowCountSetting = [[[Setting alloc] initWithTitle:@"Rows" target:self onValue:@selector(rowCountString) onAction:NULL onChange:NULL] autorelease];
    NSArray * rowCountSettings = [[[NSArray alloc] initWithObjects:rowCountSetting, nil] autorelease];
    [self.settings setValue:rowCountSettings forKey:@"Rows"];
}

#pragma mark - Setting value methods

- (NSString *)rowCountString {
    return [NSString stringWithFormat:@"%d", self.rootViewController.tableRows];
}

#pragma mark - View lifecycle

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [_rootViewController release];
    [super dealloc];
}

@end
