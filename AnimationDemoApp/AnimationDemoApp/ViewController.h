//
//  ViewController.h
//  AnimationDemoApp
//
//  Created by Vikas Mishra on 12/30/16.
//  Copyright © 2016 dev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIView *myView;
@property (weak, nonatomic) IBOutlet UIImageView *myImgView;
@property (strong, nonatomic) IBOutlet UILabel *myLabel;
- (IBAction)btnFadeIn:(id)sender;
- (IBAction)btnFadeOut:(id)sender;
- (IBAction)btnStartFade:(id)sender;
@end

