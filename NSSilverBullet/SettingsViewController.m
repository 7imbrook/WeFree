//
//  SettingsViewController.m
//  NSSilverBullet
//
//  Created by Michael Timbrook on 1/30/14.
//  Copyright (c) 2014 AppChallenge. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SettingsViewController.h"

NSString *OTUserDefaultsGravatarEmailKey = @"gravatarEmail";
NSString *OTUserDefaultsDeviceSearchDisabledKey = @"deviceSearchDisabled";

@interface SettingsViewController ()

@property (weak, nonatomic) IBOutlet UISwitch *nearbyEnabledSwitch;
@property (weak, nonatomic) IBOutlet UITextField *gravatarEmailTextField;

@end

@implementation SettingsViewController

- (IBAction)nearbySwitchChange:(id)sender {
    BOOL deviceSearchDisabled = !_nearbyEnabledSwitch.on;
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setBool:deviceSearchDisabled forKey:OTUserDefaultsDeviceSearchDisabledKey];
    [defaults synchronize];
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    NSString *gravatarEmail = _gravatarEmailTextField.text;
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:gravatarEmail forKey:OTUserDefaultsGravatarEmailKey];
    [defaults synchronize];
    
    return YES;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    // Load our data before the view draws
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *gravatarEmail = [defaults objectForKey:OTUserDefaultsGravatarEmailKey];
    BOOL deviceSearchDisabled = [defaults boolForKey:OTUserDefaultsDeviceSearchDisabledKey];
    _gravatarEmailTextField.text = gravatarEmail;
    _nearbyEnabledSwitch.on = !deviceSearchDisabled;
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    _gravatarEmailTextField.delegate = self;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
