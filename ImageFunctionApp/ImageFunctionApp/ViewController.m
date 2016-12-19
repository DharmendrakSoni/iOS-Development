//
//  ViewController.m
//  ImageFunctionApp
//
//  Created by vinod bisht on 16/12/16.
//  Copyright © 2016 vinod bisht. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    int btnTap;
}
@end

@implementation ViewController
@synthesize imageView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        UIAlertController * alert=   [UIAlertController
                                      alertControllerWithTitle:@"Info"
                                      message:@"Device have No Camera"
                                      preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* ok = [UIAlertAction
                             actionWithTitle:@"OK"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             {
                                 [alert dismissViewControllerAnimated:YES completion:nil];
                                 
                             }];
        [alert addAction:ok];
        
        [self presentViewController:alert animated:YES completion:nil];
        
    }
   
    
}
- (UIImage*)rotateUIImage:(UIImage*)sourceImage clockwise:(BOOL)clockwise
{
    CGSize size = sourceImage.size;
    UIGraphicsBeginImageContext(CGSizeMake(size.height, size.width));
    [[UIImage imageWithCGImage:[sourceImage CGImage] scale:1.0 orientation:clockwise ? UIImageOrientationRight : UIImageOrientationLeft] drawInRect:CGRectMake(0,0,size.height ,size.width)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)btnOpenImage:(id)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:NULL];
}


- (IBAction)btnOpenCamera:(id)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self presentViewController:picker animated:YES completion:NULL];
}

- (IBAction)btnFlip:(id)sender {
    
   UIImage *image = [self rotateUIImage:self.imgView.image clockwise:YES];
   self.imgView.image = image;
       //imageView.transform = CGAffineTransformMakeRotation(M_PI_2);
    
}
//==========this code for anticlock============
//- (IBAction)btnAntiClockRotate:(id)sender {
//    UIImage *image = [self rotateUIImage:self.imgView.image clockwise:NO];
//    
//    self.imgView.image = image;
//}

-(UIImage *)makeMirroredImage:(UIImage *)image
{
    NSLog(@"image state befor---%d",image.imageOrientation);
    UIImageOrientation flippedOrientation = UIImageOrientationUpMirrored;
    UIImage * flippedImage;
    if(image.imageOrientation==0){
   flippedImage = [UIImage imageWithCGImage:image.CGImage scale:image.scale orientation:flippedOrientation];
    }
    if(image.imageOrientation==4){
        flippedImage=[UIImage imageWithCGImage:image.CGImage scale:image.scale orientation:UIImageOrientationUp] ;
    }
//    switch (image.imageOrientation) {
//        case UIImageOrientationDown:
//            flippedOrientation = UIImageOrientationDownMirrored;
//            break;
//        case UIImageOrientationLeft:
//            flippedOrientation = UIImageOrientationLeftMirrored;
//            break;
//            // ...
//    }
   

    
  
    return flippedImage;
}


- (IBAction)btnMirror:(id)sender {
    //btnTap=1;
   

     UIImage *image = [self makeMirroredImage:self.imgView.image];
        self.imgView.image = image;
 
    

    
}

//- (IBAction)btnUnMirror:(id)sender {
//    
////    UIImage *chosenImage = [info[UIImagePickerControllerEditedImage];
////    [self.imgView setImage:chosenImage];
//
//}


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    [self.imgView setImage:chosenImage];
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}


@end
