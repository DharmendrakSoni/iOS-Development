//
//  ImgeFadeViewController.h
//  AnimationDemoApp
//
//  Created by vinod bisht on 30/12/16.
//  Copyright © 2016 dev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImgeFadeViewController : UIViewController
{
    UIView *view1;
    UIView *view2;
}
-(IBAction)flipFromLeft:(id)sender;
-(IBAction)flipFromRight:(id)sender;
-(IBAction)flipFromTop:(id)sender;
-(IBAction)flipFromBottom:(id)sender;
@end
