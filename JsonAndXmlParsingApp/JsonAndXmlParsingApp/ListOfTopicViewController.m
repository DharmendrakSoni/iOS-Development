//
//  ListOfTopicViewController.m
//  JsonAndXmlParsingApp
//
//  Created by vinod bisht on 20/12/16.
//  Copyright © 2016 vinod bisht. All rights reserved.
//

#import "ListOfTopicViewController.h"
#import "JSONParseViewController.h"
#import "XMLParseTableViewController.h"
#import "RawJsonViewController.h"
#import "RawXMLViewController.h"


@interface ListOfTopicViewController ()

@end

@implementation ListOfTopicViewController
@synthesize myTableView,myArray;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    myTableView.dataSource=self;
    myTableView.delegate=self;
    myArray=@[@"JSON Parsing",@"XML Parsing"];

}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [myArray count];
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier=@"Cell Identifier";
    [myTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CellIdentifier];
    UITableViewCell *cell=[myTableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    NSString *strArr=[myArray objectAtIndex:indexPath.row];
    [cell.textLabel setText:strArr];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   // NSLog(@"Clikced Cell%ld",indexPath.row);
    switch (indexPath.row)
    {
        case 0:{
            NSLog(@"Cell 0");
           JSONParseViewController *viewXml=[[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:@"JSONParseViewController"];
            [self.navigationController pushViewController:viewXml animated:YES];
        }
            break;
        case 1:{
            
            XMLParseTableViewController *viewXml=[[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:@"XMLParseTableViewController"];
            [self.navigationController pushViewController:viewXml animated:YES];
            
            
        }
            break;
//        case 2:{
//            
//            RawJsonViewController *viewXml=[[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:@"RawJsonViewController"];
//            [self.navigationController pushViewController:viewXml animated:YES];
//            
//        }
//            break;
//        case 3:{
//            
//            RawXMLViewController *viewXml=[[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:@"RawXMLViewController"];
//            [self.navigationController pushViewController:viewXml animated:YES];
//            
//        }
            
            break;
        default:
            break;
            
    }
    
    
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
