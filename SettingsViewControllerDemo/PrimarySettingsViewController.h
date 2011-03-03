//
//  PrimarySettingsViewController.h
//  SettingsViewControllerDemo
//
//  Created by Tim Ekl on 3/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SettingsViewController.h"

@class RootViewController;

@interface PrimarySettingsViewController : SettingsViewController {
    RootViewController * _rootViewController;
}

@property (nonatomic, retain) RootViewController * rootViewController;

@end
