//
//  FadeViewController.h
//  AnimationDemoApp
//
//  Created by vinod bisht on 30/12/16.
//  Copyright © 2016 dev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FadeViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *myView;

- (IBAction)fadeInBtn:(id)sender;
- (IBAction)fadeOutBtn:(id)sender;
- (IBAction)startFadeinBtn:(id)sender;

@end
