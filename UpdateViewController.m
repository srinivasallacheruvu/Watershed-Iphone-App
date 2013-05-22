//
//  UpdateViewController.m
//  WatershedDevelopment
//
//  Created by Karthik on 20/05/13.
//  Copyright (c) 2013 Karthik. All rights reserved.
//

#import "UpdateViewController.h"
#import "HelloWorldViewController.h"

@interface UpdateViewController (){
    sqlite3 *personDB;
    NSString *dbPathString;
}

@end

@implementation UpdateViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self createOrOpenDB];
    /*
     if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
     
     UIAlertView *myAlertView = [[UIAlertView alloc]initWithTitle:@"Error"
     message:@"Device has no camera"
     delegate:nil
     cancelButtonTitle:@"OK"
     otherButtonTitles: nil];
     
     [myAlertView show];
     
     }
     */
}
-(void)createOrOpenDB{
    NSLog(@" inside createOrOpenDB");
    NSArray *path=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    NSString *docPath=[path objectAtIndex:0];
    dbPathString=[docPath stringByAppendingPathComponent:@"person.db"];
    
    NSFileManager *fileManager=[NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:dbPathString]) {
        const char *dbPath=[dbPathString UTF8String];
        // create db here
        if (sqlite3_open(dbPath, &personDB)==SQLITE_OK) {
            const char *sql_stmt="CREATE TABLE IF NOT EXISTS PERSONS (AppSiNo INTEGER PRIMARY KEY AUTOINCREMENT, BENEFICIARYNAME TEXT, SPOUCENAME TEXT)";
            sqlite3_close(personDB);
            
        }
    }
    
}

-(IBAction)dismissKeyboard:(id)sender{
    [sender resignFirstResponder];
    [_beneficiaryNameTextField resignFirstResponder];
    [_spouceName resignFirstResponder];
}

- (IBAction)takePicture:(id)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self presentViewController:picker animated:YES completion:NULL];
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    _imageview.image = chosenImage;
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

- (IBAction)add:(id)sender {
    NSLog(@"add button pressed");
    char *error;
    if (sqlite3_open([dbPathString UTF8String], &personDB)==SQLITE_OK) {
        
        NSString *insertStmt=[NSString stringWithFormat:@"INSERT INTO PERSONS(AppSiNo,BENEFICIARYNAME,SPOUCENAME) values('%s','%d')",
                [_beneficiaryNameTextField.text UTF8String],[_spouceName.text intValue]];
        
        const char *insert_stmt=[insertStmt UTF8String];
        if (sqlite3_exec(personDB, insert_stmt, NULL,NULL,&error)==SQLITE_OK) {
            NSLog(@"Person added");
                        
        }
        sqlite3_close(personDB);
    }
   
}

- (IBAction)search:(id)sender {
      NSLog(@"search button pressed");
}

- (IBAction)update:(id)sender {
      NSLog(@"update button pressed");
}

- (IBAction)deletedata:(id)sender {
      NSLog(@"delete button pressed");
}

//find
/*
 sqlite3_stmt *statement;
 if (sqlite3_open([dbPathString UTF8String],&personDB)==SQLITE_OK) {
 [arrayOfPerson removeAllObjects];
 NSString *querysql=[NSString stringWithFormat:@"SELECT *FROM PERSONS"];
 const char *query_sql=[querysql UTF8String];
 if (sqlite3_prepare(personDB, query_sql, -1, &statement, NULL)==SQLITE_OK) {
 while (sqlite3_step(statement)==SQLITE_ROW) {
 NSString *name=[[NSString alloc]initWithUTF8String:(const char *)sqlite3_coloum_text(statement,1)];
 NSString *ageString=[[NSString alloc]initWithUTF8String:(const char *)sqlite3_column_text(statement,2)];
 Person *person=[[Person alloc]init];
 [person setName:name];
 [person setAge:[ageString intValue]];
 [arrayOfPerson addObject:person];
 
 }
 }
 
 }
 */




- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
