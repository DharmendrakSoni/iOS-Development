//
//  ListOfTopicViewController.m
//  JsonAndXmlParsingApp
//
//  Created by vinod bisht on 20/12/16.
//  Copyright © 2016 vinod bisht. All rights reserved.
//

#import "ListOfTopicViewController.h"
#import "LoaderImageViewController.h"
#import "LoaderWithImageViewController.h"

@interface ListOfTopicViewController ()

@end

@implementation ListOfTopicViewController
@synthesize myTableViews,myArray;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    myTableViews.dataSource=self;
    myTableViews.delegate=self;
    myArray=@[@"LoaderWithText",@"LoaderImage"];

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
    [myTableViews registerClass:[UITableViewCell class] forCellReuseIdentifier:CellIdentifier];
    UITableViewCell *cell=[myTableViews dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
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
           LoaderImageViewController *viewXml=[[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:@"LoaderImageViewController"];
            [self.navigationController pushViewController:viewXml animated:YES];
        }
            break;
        case 1:{
            
            LoaderWithImageViewController *viewXml=[[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:@"LoaderWithImageViewController"];
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
