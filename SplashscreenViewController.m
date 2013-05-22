//
//  SplashscreenViewController.m
//  WatershedDevelopment
//
//  Created by Karthik on 21/05/13.
//  Copyright (c) 2013 Karthik. All rights reserved.
//

#import "SplashscreenViewController.h"

@interface SplashscreenViewController ()

@end

@implementation SplashscreenViewController
@synthesize myImageview;
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
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)exitButton:(UIButton *)sender {
    exit(0);
}

@end
