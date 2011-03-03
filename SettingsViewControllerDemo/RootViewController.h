//
//  RootViewController.h
//  SettingsViewControllerDemo
//
//  Created by Tim Ekl on 3/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UITableViewController {
    NSInteger _tableRows;
}

@property (nonatomic, assign) NSInteger tableRows;

@end
