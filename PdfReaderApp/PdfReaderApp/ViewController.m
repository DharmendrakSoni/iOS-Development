//
//  ViewController.m
//  PdfReaderApp
//
//  Created by vinod bisht on 15/12/16.
//  Copyright © 2016 vinod bisht. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)btnOpenPdf:(id)sender {
    NSString *file = [[NSBundle mainBundle] pathForResource:@"objective_c_tutorial" ofType:@"pdf"];
    ReaderDocument *document = [ReaderDocument withDocumentFilePath:file password:nil];if (document != nil)
    {
        ReaderViewController *readerViewController = [[ReaderViewController alloc] initWithReaderDocument:document];
        readerViewController.delegate = self;
        readerViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        readerViewController.modalPresentationStyle = UIModalPresentationFullScreen;
        [self presentModalViewController:readerViewController animated:YES];
    }
//    ReaderDocument *document = [ReaderDocument withDocumentFilePath:path password:nil];
//    if (document != nil)
//    {
//        ReaderViewController *readerViewController = [[ReaderViewController alloc] initWithReaderDocument:document];
//        readerViewController.delegate = self;
//        
//        readerViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
//        readerViewController.modalPresentationStyle = UIModalPresentationFullScreen;
//        
//        [self presentViewController:readerViewController animated:YES completion:nil];
//    }
//    else
//    {
//        NSLog(@"document is nil");
//    }
}
- (void)dismissReaderViewController:(ReaderViewController *)viewController {
    [self dismissModalViewControllerAnimated:YES];
}
@end
