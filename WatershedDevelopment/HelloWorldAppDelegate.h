//
//  HelloWorldAppDelegate.h
//  WatershedDevelopment
//
//  Created by Karthik on 20/05/13.
//  Copyright (c) 2013 Karthik. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SplashViewController.h"
@class HelloWorldViewController;

@interface HelloWorldAppDelegate : UIResponder <UIApplicationDelegate>{
    UIWindow *window;
    SplashViewController *viewController;
}

@property (strong, nonatomic)IBOutlet UIWindow *window;

@property (strong, nonatomic) IBOutlet SplashViewController *viewController;

@end
