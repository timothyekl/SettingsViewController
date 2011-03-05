//
//  PropertyEditorViewController.m
//  MTM
//
//  Created by Tim Ekl on 2/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PropertyEditorViewController.h"

@implementation PropertyEditorViewController

@synthesize propertyField = _propertyField;
@synthesize setting = _setting;

#pragma mark - Lifecycle
- (id)initWithSetting:(Setting *)setting {
    if((self = [super initWithNibName:@"PropertyEditorView" bundle:nil])) {
        self.setting = setting;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = [self.setting title];
    
    self.propertyField.secureTextEntry = self.setting.secure;
    self.propertyField.text = [self.setting insecureValue];
    self.propertyField.placeholder = [self.setting title];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    self.propertyField.keyboardType = [self keyboardTypeForSettingValueType:self.setting.valueType];
    [self.propertyField becomeFirstResponder];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.setting performChangeCallbackWithValue:self.propertyField.text];
}

- (void)dealloc {
    [_propertyField release];
    [_setting release];
    
    [super dealloc];
}

#pragma mark - UITextFieldDelegate methods

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.setting performChangeCallbackWithValue:self.propertyField.text];
    
    [self.navigationController popViewControllerAnimated:YES];
    return YES;
}

#pragma mark - Helper methods

- (UIKeyboardType)keyboardTypeForSettingValueType:(SettingValueType)valueType {
    switch(valueType) {
        case SettingValueTypeString: return UIKeyboardTypeASCIICapable;
        case SettingValueTypeDecimal: return UIKeyboardTypeDecimalPad;
        default: return UIKeyboardTypeDefault;
    }
}

@end
