//
//  LoaderWithImageViewController.m
//  LoaderCustomizationApp
//
//  Created by vinod bisht on 29/12/16.
//  Copyright © 2016 vinod bisht. All rights reserved.
//

#import "LoaderWithImageViewController.h"
#import "UIImage+animatedGIF.h"

@interface LoaderWithImageViewController ()
{
    UIActivityIndicatorView *activityView;
    UIView *myView;
    UILabel *myLabel;
}
@end

@implementation LoaderWithImageViewController
@synthesize myWebView;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
      [self.navigationItem setTitle:@"ImageLoader"];
    myView=[[UIView alloc]initWithFrame:CGRectMake(60,220,180,50)];
    [myView setBackgroundColor:[UIColor clearColor]];
    [myView setAlpha:0.7];
    myView.layer.cornerRadius=10;
    
    UIImageView *animatedImageView=[[UIImageView alloc] initWithFrame:CGRectMake(myView.frame.size.width*0.2,myView.frame.size.height*0.1,100,90)];//(myView.frame.size.width*0.3,myView.frame.size.height*0.1,100,90)];
    
    NSString *path=[[NSBundle mainBundle]pathForResource:@"circle" ofType:@"gif"];
    NSURL *url=[[NSURL alloc]initFileURLWithPath:path];
    animatedImageView.image=[UIImage animatedImageWithAnimatedGIFURL:url];
    
    myLabel=[[UILabel alloc]initWithFrame:CGRectMake(35,82,150,30)];
    myLabel.textColor=[UIColor orangeColor];
    myLabel.text=@"Loading data...";
    
    [myView addSubview:animatedImageView];
    [myView addSubview:myLabel];
    [self.view addSubview:myView];
   
    
}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [NSTimer scheduledTimerWithTimeInterval:5.0 target:self selector:@selector(changeAnimation) userInfo:nil repeats:NO];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)webViewDidStartLoad:(UIWebView *)webView{
      NSLog(@"WebView start Call");
    
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    // NSLog(@"after stop webview description %d",);
    NSLog(@"WebView stop Call");
      [myView removeFromSuperview];
    
    
    
}
-(void)changeAnimation{
    NSString *urlString = @"http://aoldev.apponlease.com/api/1b/catsubcat_api.php?app_id=2";
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    [myWebView loadRequest:urlRequest];
    
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
