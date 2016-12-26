//
//  ViewController.m
//  StopWatchApp
//
//  Created by vinod bisht on 23/12/16.
//  Copyright © 2016 vinod bisht. All rights reserved.
//

#import "ViewController.h"
#import "LapListTableViewCell.h"

@interface ViewController (){
    NSInteger lapIndex;
    LapListTableViewCell *cell;
}
@property (retain,nonatomic)NSMutableArray *mutArrData;


@end

@implementation ViewController
@synthesize  timerLabel,startBtn,resetBtn,mutArrData,myTableView;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    running=NO;
    count=0;
    lapIndex = 0;
    timerLabel.text=@"00:00:00";
    
    startBtn.layer.cornerRadius=45;
    resetBtn.layer.cornerRadius=45;
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    myTableView.dataSource=self;
    myTableView.delegate=self;
   // mutArrData=[[NSMutableArray alloc]init];

   // [resetBtn setEnabled:NO];

    mutArrData=[[NSMutableArray alloc]init];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)startBtnPushed:(id)sender {
    
    if (running==NO) {
        running=YES;
        //[resetBtn setEnabled:YES];
        [startBtn setTitle:@"STOP" forState:UIControlStateNormal];
        [resetBtn setTitle:@"LAP" forState:UIControlStateNormal];
        
        if (myTimer==nil)
        {        myTimer=[NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(updateTimer) userInfo:nil repeats:YES];
        }
    }
    else{
        running=NO;
        [myTimer invalidate];
        myTimer=nil;
        [startBtn setTitle:@"STOP" forState:UIControlStateNormal];
        [resetBtn setTitle:@"Reset" forState:UIControlStateNormal];
        
    }
}
- (IBAction)resetBtnPushed:(id)sender {
    NSLog(@"restBtn Tap");
       [mutArrData addObject:timerLabel.text];
    [myTableView reloadData];
    NSLog(@"Mutable Array : %@",mutArrData);
            [startBtn setTitle:@"START" forState:UIControlStateNormal];

    if (running==NO) {
      
        timerLabel.text=@"00:00:00";
        [mutArrData removeObjectsInArray:mutArrData];
        [myTableView reloadData];
        [resetBtn setTitle:@"LAP" forState:UIControlStateNormal];
        [startBtn setTitle:@"START" forState:UIControlStateNormal];
        
    }
    
}
-(void)updateTimer{
    count++;
    int min=floor(count/100/60);
    int sec=floor(count/100);
    int mSec=count%100;
    
    if (sec>=60) {
        sec=sec%60;
        
    }
    timerLabel.text=[NSString stringWithFormat:@"%02d:%02d:%02d",min,sec,mSec];
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    NSLog(@"numberOf sectionInTableView");
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@"numberOFRowInSection");
       return  [mutArrData count];//[mutArrData count];
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier=@"Cell";
    cell=(LapListTableViewCell *)[myTableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.lapLabel.text=[mutArrData objectAtIndex:(mutArrData.count-(indexPath.row+1))];// ];
    NSLog(@"tavleViewcell=%@",cell);
    return cell;
}



@end
