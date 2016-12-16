//
//  ViewController.m
//  DigitalSignatureDemo
//
//  Created by vinod bisht on 16/12/16.
//  Copyright © 2016 vinod bisht. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet SignatureViewController *signatureController;
@property (strong, nonatomic) IBOutlet SignatureViewController *signatureController2;

@end

@implementation ViewController
@synthesize signatureController;
@synthesize signatureController2;

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"Welcome");
    // Do any; additional setup after loading the view, typically from a nib.
    if (self.signatureController) {
        self.signatureController.signatureTextField.text = @"You sign here";
        [self addChildViewController:self.signatureController];
    }
    if (self.signatureController2) {
        
        self.signatureController2.signatureTextField.text = @"Spouse sign here";
        [self addChildViewController:self.signatureController2];
    }

}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        
        return (interfaceOrientation != UIInterfaceOrientationPortrait);
    }
    else  {
        
        return YES;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark SignatureViewController delegate methods

- (void) signatureViewController:(SignatureViewController *)viewController didSign:(NSData *)signatureData {
    
    NSLog(@"signatureData: %@",signatureData.description);
}

- (void)didNotSignInSignatureViewController:(SignatureViewController *)viewController {
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Signature" message:@"Please sign" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
    
    [alertController addAction:okAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
}


@end
