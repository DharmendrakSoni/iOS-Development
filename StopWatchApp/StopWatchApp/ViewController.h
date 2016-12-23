//
//  ViewController.h
//  StopWatchApp
//
//  Created by vinod bisht on 23/12/16.
//  Copyright © 2016 vinod bisht. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    NSTimer *myTimer;
    BOOL running;
    int count;
}
@property (weak, nonatomic) IBOutlet UILabel *timerLabel;


- (IBAction)resetBtnPushed:(id)sender;

- (IBAction)startBtnPushed:(id)sender;
-(void)updateTimer;
@property (weak, nonatomic) IBOutlet UIButton *startBtn;

@property (weak, nonatomic) IBOutlet UIButton *resetBtn;
@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@end

