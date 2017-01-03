//
//  RotaionViewController.h
//  AnimationDemoApp
//
//  Created by vinod bisht on 02/01/17.
//  Copyright © 2017 dev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RotaionViewController : UIViewController
- (IBAction)btn_startRotate:(id)sender;
- (IBAction)btn_stopRotate:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *myImageView;

@end
