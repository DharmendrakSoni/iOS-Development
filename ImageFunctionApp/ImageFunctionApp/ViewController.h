//
//  ViewController.h
//  ImageFunctionApp
//
//  Created by vinod bisht on 16/12/16.
//  Copyright © 2016 vinod bisht. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (strong, nonatomic)  UIImageView *imageView;

- (IBAction)btnOpenImage:(id)sender;
- (IBAction)btnOpenCamera:(id)sender;
- (IBAction)btnFlip:(id)sender;
- (IBAction)btnAntiClockRotate:(id)sender;

@end

