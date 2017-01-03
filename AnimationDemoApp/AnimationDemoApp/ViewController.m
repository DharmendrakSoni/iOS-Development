//
//  ViewController.m
//  AnimationDemoApp
//
//  Created by Vikas Mishra on 12/30/16.
//  Copyright © 2016 dev. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize myView,myLabel,myImgView;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //myView=[[UIView alloc] init];
   
    
}
-(void) fadeIn{
    [myImgView setAlpha:0];
    [UIImageView beginAnimations:NULL context:nil];
    [UIImageView setAnimationDuration:3.0];
    [myImgView setAlpha:1];
    [UIImageView commitAnimations];
}

-(void) fadeOut{
    [UIImageView beginAnimations:NULL context:nil];
    [UIImageView setAnimationDuration:2.0];
    [myImgView setAlpha:0];
    [UIImageView commitAnimations];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnFadeIn:(id)sender {
    [self fadeIn];
}

- (IBAction)btnFadeOut:(id)sender {
    [self fadeOut];
}

- (IBAction)btnStartFade:(id)sender {
    [myImgView setAlpha:0.0f];
    
    //fade in
    [UIView animateWithDuration:2.0f animations:^{
        [myImgView setAlpha:1.0f];
        
    } completion:^(BOOL finished) {
        
        //fade out
        [UIView animateWithDuration:2.0f animations:^{
            
            [myImgView setAlpha:0.0f];
            
        } completion:nil];
        
    }];

}
@end
