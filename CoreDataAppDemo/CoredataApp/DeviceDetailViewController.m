//
//  DeviceDetailViewController.m
//  CoredataApp
//
//  Created by ankit on 10/12/16.
//  Copyright © 2016 anyone. All rights reserved.
//

#import "DeviceDetailViewController.h"
#import "AppDelegate.h"
@interface DeviceDetailViewController ()

@property (strong) NSManagedObjectContext *context;
@property (strong, nonatomic) IBOutlet UILabel *myLabel;

@end

@implementation DeviceDetailViewController
@synthesize device;
//@synthesize managedObjectContext = _managedObjectContext;

- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}
//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        // Custom initialization
//    }
//    return self;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];

    if (self.device) {
        [self.nameTextField setText:[self.device valueForKey:@"name"]];
        [self.versionTextField setText:[self.device valueForKey:@"version"]];
        [self.companyTextField setText:[self.device valueForKey:@"company"]];
    }
   }
-(void)viewWillAppear:(BOOL)animated{
   }
-(void)dismissKeyboard
{
    [_companyTextField resignFirstResponder];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)Cancel:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (IBAction)Save:(id)sender {

    
    NSManagedObjectContext *context = [self managedObjectContext];
    
    if (self.device) {
        // Update existing device
        [self.device setValue:self.nameTextField.text forKey:@"name"];
        [self.device setValue:self.versionTextField.text forKey:@"version"];
        [self.device setValue:self.companyTextField.text forKey:@"company"];
        
    } else {
        // Create a new device
        NSManagedObject *newDevice = [NSEntityDescription insertNewObjectForEntityForName:@"Device" inManagedObjectContext:context];
        [newDevice setValue:self.nameTextField.text forKey:@"name"];
        [newDevice setValue:self.versionTextField.text forKey:@"version"];
        [newDevice setValue:self.companyTextField.text forKey:@"company"];
    }
    
    NSError *error = nil;
    // Save the object to persistent store
    if (![context save:&error]) {
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];

}
@end
