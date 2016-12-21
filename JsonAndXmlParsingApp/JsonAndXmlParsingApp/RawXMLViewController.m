//
//  RawXMLViewController.m
//  JsonAndXmlParsingApp
//
//  Created by vinod bisht on 21/12/16.
//  Copyright © 2016 vinod bisht. All rights reserved.
//

#import "RawXMLViewController.h"

@interface RawXMLViewController ()

@end

@implementation RawXMLViewController
@synthesize myXmlWebView;
- (void)viewDidLoad {
   
    // Do any additional setup after loading the view.
    NSString *urlString = @"http://images.apple.com/main/rss/hotnews/hotnews.rss#sthash.TyhRD7Zy.dpuf";
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    [myXmlWebView loadRequest:urlRequest];
    [super viewDidLoad];
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
