//
//  LoaderImageViewController.h
//  LoaderCustomizationApp
//
//  Created by vinod bisht on 29/12/16.
//  Copyright © 2016 vinod bisht. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoaderImageViewController : UIViewController<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *myXmlWebView;

@end
