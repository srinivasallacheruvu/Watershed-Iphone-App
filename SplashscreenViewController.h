//
//  SplashscreenViewController.h
//  WatershedDevelopment
//
//  Created by Karthik on 21/05/13.
//  Copyright (c) 2013 Karthik. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SplashscreenViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *myImageview;

- (IBAction)exitButton:(UIButton *)sender;
@end
