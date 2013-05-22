//
//  SplashViewController.h
//  WatershedDevelopment
//
//  Created by Karthik on 21/05/13.
//  Copyright (c) 2013 Karthik. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HelloWorldViewController.h"
@interface SplashViewController : UIViewController{
    NSTimer *timer;
    UIImageView *splashImageView;
    HelloWorldViewController *viewController;
}
@property (nonatomic,retain)NSTimer *timer;
@property(nonatomic,retain)UIImageView *splashImageView;
@property(nonatomic,retain)HelloWorldViewController *viewController;
@end
