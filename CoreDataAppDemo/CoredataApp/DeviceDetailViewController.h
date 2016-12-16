//
//  DeviceDetailViewController.h
//  CoredataApp
//
//  Created by ankit on 10/12/16.
//  Copyright © 2016 anyone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface DeviceDetailViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *nameTextField;
@property (strong, nonatomic) IBOutlet UITextField *versionTextField;
@property (strong, nonatomic) IBOutlet UITextField *companyTextField;
//@property (strong, nonatomic) IBOutlet UILabel *status;
- (IBAction)Cancel:(id)sender;
- (IBAction)Save:(id)sender;

@property (strong) NSManagedObject *device;
//@property (nonatomic, strong,readonly) NSManagedObjectContext *managedObjectContext;


@end
