//
//  LoaderImageViewController.m
//  LoaderCustomizationApp
//
//  Created by vinod bisht on 29/12/16.
//  Copyright © 2016 vinod bisht. All rights reserved.
//

#import "LoaderImageViewController.h"

@interface LoaderImageViewController ()
{
    UIActivityIndicatorView *activityView;
    UIView *myView;
    UILabel *myLabel;
}
@end

@implementation LoaderImageViewController
@synthesize myXmlWebView;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    myView=[[UIView alloc]initWithFrame:CGRectMake(60,220,180,50)];
    [myView setBackgroundColor:[UIColor blackColor]];
    [myView setAlpha:0.7];
    myView.layer.cornerRadius=10;
    activityView=[[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(myView.frame.size.width*0.08, myView.frame.size.height*0.2, 30,30)];
    [activityView setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhiteLarge];
    activityView.color=[UIColor orangeColor];
    
    [activityView startAnimating];
    myLabel=[[UILabel alloc]initWithFrame:CGRectMake(60,8,150,30)];
    myLabel.textColor=[UIColor orangeColor];
    myLabel.text=@"Loading data...";
    
    [self.navigationItem setTitle:@"TextLoader"];
    [myView addSubview:activityView];
    [myView addSubview:myLabel];
    [self.view addSubview:myView];
  
}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [NSTimer scheduledTimerWithTimeInterval:5.0 target:self selector:@selector(changeAnimation) userInfo:nil repeats:NO];
    
}

-(void)webViewDidStartLoad:(UIWebView *)webView{
    // [imageToMove startAnimating];
    NSLog(@"WebView start Call");
    
   }

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    // NSLog(@"after stop webview description %d",);
    NSLog(@"WebView stop Call");
    [activityView stopAnimating];
    [myView removeFromSuperview];
    
    
    
}
-(void)changeAnimation{
    NSString *urlString = @"http://aoldev.apponlease.com/api/1b/catsubcat_api.php?app_id=2";
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    [myXmlWebView loadRequest:urlRequest];   
    
}

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

@end
