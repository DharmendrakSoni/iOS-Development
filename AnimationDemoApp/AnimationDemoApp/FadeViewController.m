//
//  FadeViewController.m
//  AnimationDemoApp
//
//  Created by vinod bisht on 30/12/16.
//  Copyright © 2016 dev. All rights reserved.
//

#import "FadeViewController.h"

@interface FadeViewController ()

@end

@implementation FadeViewController
@synthesize myView;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(void) fadeIn{
    [myView setAlpha:0];
    [UIView beginAnimations:NULL context:nil];
    [UIView setAnimationDuration:3.0];
    [myView setAlpha:1];
    [UIView commitAnimations];
}
-(void) fadeOut{
    [UIView beginAnimations:NULL context:nil];
    [UIView setAnimationDuration:2.0];
    [myView setAlpha:0];
    [UIView commitAnimations];}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)fadeInBtn:(id)sender {
    [self fadeIn];
}

- (IBAction)fadeOutBtn:(id)sender {
    [self fadeOut];

}

- (IBAction)startFadeinBtn:(id)sender {
    [myView setAlpha:0.0f];
    
    //fade in
    [UIView animateWithDuration:2.0f animations:^{
        [myView setAlpha:1.0f];
        
    } completion:^(BOOL finished) {
        
        //fade out
        [UIView animateWithDuration:2.0f animations:^{
            
            [myView setAlpha:0.0f];
            
        } completion:nil];
        
    }];

}
@end
