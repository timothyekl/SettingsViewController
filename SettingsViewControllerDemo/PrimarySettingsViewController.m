//
//  PrimarySettingsViewController.m
//  SettingsViewControllerDemo
//
//  Created by Tim Ekl on 3/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PrimarySettingsViewController.h"

#import "RootViewController.h"
#import "PropertyEditorViewController.h"

@implementation PrimarySettingsViewController

@synthesize rootViewController = _rootViewController;

- (void)buildSettings {
    self.settings = [[[MutableOrderedDictionary alloc] initWithCapacity:1] autorelease];
    Setting * rowCountSetting = [[[Setting alloc] initWithTitle:@"Rows" target:self onValue:@selector(rowCountString) onAction:@selector(editRowCountString) onChange:@selector(rowCountStringChanged:)] autorelease];
    NSArray * rowCountSettings = [[[NSArray alloc] initWithObjects:rowCountSetting, nil] autorelease];
    [self.settings setValue:rowCountSettings forKey:@"Rows"];
}

#pragma mark - Setting value methods

- (NSString *)rowCountString {
    return [NSString stringWithFormat:@"%d", self.rootViewController.tableRows];
}

#pragma mark - Setting action methods

- (void)editRowCountString {
    NSLog(@"editing row count string");
    
    PropertyEditorViewController * editorVC = [[[PropertyEditorViewController alloc] initWithSetting:[[self.settings valueForKey:@"Rows"] objectAtIndex:0]] autorelease];
    [self.navigationController pushViewController:editorVC animated:YES];
}

#pragma mark - Setting change methods

- (void)rowCountStringChanged:(NSString *)newString {
    NSLog(@"row count string changed to: %@", newString);
    
    NSScanner * scanner = [[[NSScanner alloc] initWithString:newString] autorelease];
    NSInteger newCount;
    if(![scanner scanInteger:&newCount]) {
        NSLog(@"couldn't scan");
        self.rootViewController.tableRows = 0;
    } else if(newCount < 0) {
        NSLog(@"negative");
        self.rootViewController.tableRows = 0;
    } else {
        NSLog(@"scanned value: %d", newCount);
        self.rootViewController.tableRows = newCount;
    }
    
    NSLog(@"changed count to %d", self.rootViewController.tableRows);
    [self.tableView reloadData];
    [self.rootViewController.tableView reloadData];
}

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Settings";
    self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(done)] autorelease];
}

- (void)done {
    [self dismissModalViewControllerAnimated:YES];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [_rootViewController release];
    [super dealloc];
}

@end
