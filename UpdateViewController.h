//
//  UpdateViewController.h
//  WatershedDevelopment
//
//  Created by Karthik on 20/05/13.
//  Copyright (c) 2013 Karthik. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>
@interface UpdateViewController : UIViewController<UITextFieldDelegate,UIImagePickerControllerDelegate, UINavigationControllerDelegate>



@property (strong, nonatomic) IBOutlet UITextField *beneficiaryNameTextField;
@property (strong, nonatomic) IBOutlet UITextField *spouceName;
@property (strong, nonatomic) IBOutlet UIImageView *imageview;


- (IBAction)saveDataButton:(id)sender;
- (IBAction)dismissKeyboard:(id)sender;
- (IBAction)takePicture:(id)sender;
- (IBAction)add:(id)sender;
- (IBAction)search:(id)sender;
- (IBAction)update:(id)sender;
- (IBAction)deletedata:(id)sender;


@end
