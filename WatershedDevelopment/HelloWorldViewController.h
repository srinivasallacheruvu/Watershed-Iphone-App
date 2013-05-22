//
//  HelloWorldViewController.h
//  WatershedDevelopment
//
//  Created by Karthik on 20/05/13.
//  Copyright (c) 2013 Karthik. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CLLocationManagerDelegate.h>
#import <CoreLocation/CLError.h>
#import <CoreLocation/CLLocation.h>
#import <CoreLocation/CLLocationManager.h>
@interface HelloWorldViewController : UIViewController<UINavigationControllerDelegate,UITextFieldDelegate,CLLocationManagerDelegate>


@property (strong, nonatomic) IBOutlet UITextField *districtTextField;
@property (strong, nonatomic) IBOutlet UITextField *talukTextField;
@property (strong, nonatomic) IBOutlet UITextField *appSiNoTextField;
@property (strong, nonatomic) IBOutlet UITextField *appSubSiNoTextField;

@property (strong, nonatomic) IBOutlet UITextField *schemeTextField;
@property (strong, nonatomic) IBOutlet UITextField *seriesyYearTextField;
@property (strong, nonatomic) IBOutlet UITextField *hobliTextField;
@property (strong, nonatomic) IBOutlet UITextField *villageTextField;

@property (strong, nonatomic) IBOutlet UIButton *viewButton;
@property (strong, nonatomic) IBOutlet UIButton *updateButton;

- (IBAction)viewButton:(id)sender;
- (IBAction)updateButton:(id)sender;
-(IBAction)dismissKeyboard:(id)sender;

@end
