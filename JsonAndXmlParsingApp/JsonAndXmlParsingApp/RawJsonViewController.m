//
//  RawJsonViewController.m
//  JsonAndXmlParsingApp
//
//  Created by vinod bisht on 20/12/16.
//  Copyright © 2016 vinod bisht. All rights reserved.
//

#import "RawJsonViewController.h"

@interface RawJsonViewController ()
{
UIActivityIndicatorView *activityView ;
}
@end

@implementation RawJsonViewController
@synthesize myWebView;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationItem setTitle:@"Raw Json Data"];
    activityView = [[UIActivityIndicatorView alloc]                                         initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    myWebView.delegate=self;
    activityView.center=self.view.center;    
    [self.view addSubview:activityView];

}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    NSString *urlString = @"http://aoldev.apponlease.com/api/1b/catsubcat_api.php?app_id=2";
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    [myWebView loadRequest:urlRequest];

}
-(void)webViewDidStartLoad:(UIWebView *)webView{
    [activityView startAnimating];
    
}
-(void)webViewDidFinishLoad:(UIWebView *)webView{
    [activityView stopAnimating];
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
