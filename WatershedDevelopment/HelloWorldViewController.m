//
//  HelloWorldViewController.m
//  WatershedDevelopment
//
//  Created by Karthik on 20/05/13.
//  Copyright (c) 2013 Karthik. All rights reserved.
//

#import "HelloWorldViewController.h"
#import "UpdateViewController.h"

@interface HelloWorldViewController (){
   
    CLLocationManager *location;
   // CLGeocoder *geocoder;
}

@end

@implementation HelloWorldViewController



- (IBAction)viewButton:(id)sender {
    NSLog(@"view button pressed!");
    //saving battery power
    
    if ([_appSiNoTextField.text length]>0 || [_appSubSiNoTextField.text length]>0) {
        
        _schemeTextField.text=@"Bharat Nirman";
        _seriesyYearTextField.text=@"2013";
        _hobliTextField.text=@"Hobli";
        _villageTextField.text=@"Hobli";
      
        
    } else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Welcome to Watershed Development!"
                                                        message:@"Please enter appSiNo or appSubSiNo!!"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles: nil];
        [alert show];
    }
   }


- (IBAction)updateButton:(id)sender {
    NSLog(@"in goto secondpage!");
    UpdateViewController *uc=[[UpdateViewController alloc]initWithNibName:@"UpdateViewController"
                                            bundle:[NSBundle mainBundle]];
    [self.view addSubview:uc.view];
    [self.navigationController pushViewController:uc animated:YES];
    
}

-(IBAction)dismissKeyboard:(id)sender{
    [sender resignFirstResponder];
    [_districtTextField resignFirstResponder];
    [_talukTextField resignFirstResponder];
    [_appSiNoTextField resignFirstResponder];
    [_appSubSiNoTextField resignFirstResponder];
    [_schemeTextField resignFirstResponder];
    [_seriesyYearTextField resignFirstResponder];
    [_hobliTextField resignFirstResponder];
    [_villageTextField resignFirstResponder];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    location=[[CLLocationManager alloc]init];
    location.delegate=self;
    location.desiredAccuracy=kCLLocationAccuracyBest;
    location.distanceFilter=kCLDistanceFilterNone;
    [location startUpdatingLocation];
}
-(void)locationmanager:(CLLocationManager *) manager didUpDateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation{
    
    NSLog(@"didUpdateToLocation: %@", newLocation);
    CLLocation *currentLocation = newLocation;
    
    if (currentLocation != nil) {
        NSString *lat=[[NSString alloc]initWithFormat:@"%f",newLocation.coordinate.latitude];
        
        NSString *lon=[[NSString alloc]initWithFormat:@"%f",newLocation.coordinate.longitude];
    }
    
    // Stop Location Manager
    [location stopUpdatingLocation];
  // CLGeocoder * geoCoder = [[CLGeocoder alloc] init];
   /*
    [geocoder reverseGeocodeLocation:currentLocation completionHandler:^(NSArray *placemarks, NSError *error) {
        NSLog(@"Found placemarks: %@, error: %@", placemarks, error);
        if (error == nil && [placemarks count] > 0) {
            placemark = [placemarks lastObject];
            addressLabel.text = [NSString stringWithFormat:@"%@ %@\n%@ %@\n%@\n%@",
                                 placemark.subThoroughfare, placemark.thoroughfare,
                                 placemark.postalCode, placemark.locality,
                                 placemark.administrativeArea,
                                 placemark.country];
        } else {
            NSLog(@"%@", error.debugDescription);
        }
    } ];
    */
   
    
}
-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    NSString *msg=[[NSString alloc]initWithFormat:@"Error obtained"];
    UIAlertView*alert;
    alert=[[UIAlertView alloc]initWithTitle:@"error" message:msg
                                   delegate:self
                          cancelButtonTitle:@"Ok"
                          otherButtonTitles:nil];
    [alert show];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
