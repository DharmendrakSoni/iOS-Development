//
//  JSONParseViewController.m
//  JsonAndXmlParsingApp
//
//  Created by vinod bisht on 20/12/16.
//  Copyright © 2016 vinod bisht. All rights reserved.
//

#import "JSONParseViewController.h"
#import "JSONParseTableViewCell.h"
#import "RawJsonViewController.h"

@interface JSONParseViewController ()
{
    UIActivityIndicatorView *activityView ;
}
@end

@implementation JSONParseViewController
@synthesize categoryData,categoryTableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    activityView = [[UIActivityIndicatorView alloc]                                         initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
   [self.navigationItem.backBarButtonItem setTitle:@""];
    activityView.center=self.view.center;
    [activityView startAnimating];
    [self.view addSubview:activityView];
    UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithTitle:@"ShowRawData" style:UIBarButtonItemStylePlain target:self action:@selector(refreshPropertyList)];
    self.navigationItem.rightBarButtonItem = anotherButton;
   
    
    // Do any additional setup after loading the view, typically     
}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
     [self callApiWithUrl:@"Your URL" ];
}
-(void)callApiWithUrl:(NSString*)urlString
{
    NSURL *url=[NSURL URLWithString:urlString];
    NSURLSessionDataTask *dataTask=[[NSURLSession sharedSession]dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _response, NSError *_Nullable error){
        NSError*parserError=nil;
        NSString *jsonStr=[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"Data String :%@",jsonStr);
        NSArray *splitArray=[jsonStr componentsSeparatedByString:@"~"];
        NSString *splittedValue=[splitArray objectAtIndex:1];
        NSData *cleanJsonData=[[splitArray objectAtIndex:0]dataUsingEncoding:NSUTF8StringEncoding];
        categoryData=[[NSMutableArray alloc]init];
        categoryData=[NSJSONSerialization JSONObjectWithData:cleanJsonData options:0 error:&parserError];
        
        if(parserError){
            NSLog(@"Error on Parsing:%@",[parserError description]);
        }else{
            NSLog(@"JSON After Parsing:%lu",(unsigned long)[categoryData count]);
            dispatch_async(dispatch_get_main_queue(),^{[categoryTableView reloadData];
            });
        }
    }];
    [dataTask resume];
    
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
}
-(void)refreshPropertyList
{
   
    [self.activityIndicatorView startAnimating];
    RawJsonViewController *viewXml=[[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:@"RawJsonViewController"];
    [self.navigationController pushViewController:viewXml animated:YES];
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [categoryData count];
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier=@"Cell";
    JSONParseTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    NSString *catName=[[categoryData objectAtIndex:indexPath.row]valueForKey:@"name"];
    cell.lblId.text=[[categoryData objectAtIndex:indexPath.row]valueForKey:@"id"];
    cell.lblParentId.text=[[categoryData objectAtIndex:indexPath.row]valueForKey:@"description"];
         [activityView stopAnimating];
    return cell;
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
