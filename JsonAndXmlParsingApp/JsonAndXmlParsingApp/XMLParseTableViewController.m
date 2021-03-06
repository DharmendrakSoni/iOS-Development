//
//  XMLParseTableViewController.m
//  JsonAndXmlParsingApp
//
//  Created by vinod bisht on 20/12/16.
//  Copyright © 2016 vinod bisht. All rights reserved.
//

#import "XMLParseTableViewController.h"

@interface XMLParseTableViewController ()
{
    UIActivityIndicatorView *activityView ;
}
@end

@implementation XMLParseTableViewController
@synthesize marrXMLData;
@synthesize mstrXMLString;
@synthesize mdictXMLPart;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:@"XML Parsing"];
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]
                                             initWithTitle:@"Notes" style:UIBarButtonItemStylePlain
                                             target:nil action:nil];
    activityView = [[UIActivityIndicatorView alloc]                                         initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
//[self.navigationItem.backBarButtonItem setTitle:@""];
    activityView.center=self.view.center;
    [activityView startAnimating];
    [self.view addSubview:activityView];

    
    //[self startParsing];
}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
  [self startParsing];
}
- (void)startParsing
{
    NSXMLParser *xmlparser = [[NSXMLParser alloc] initWithContentsOfURL:[NSURL URLWithString:@"http://images.apple.com/main/rss/hotnews/hotnews.rss#sthash.TyhRD7Zy.dpuf"]];
    [xmlparser setDelegate:self];
    [xmlparser parse];
    if (marrXMLData.count != 0) {
        [self.tableView reloadData];
    }
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict;
{
    if([elementName isEqualToString:@"rss"])
        marrXMLData = [[NSMutableArray alloc] init];
    if([elementName isEqualToString:@"item"])
        mdictXMLPart = [[NSMutableDictionary alloc] init];
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string;
{
    if(!mstrXMLString)
        mstrXMLString = [[NSMutableString alloc] initWithString:string];
    else
        [mstrXMLString appendString:string];
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName;
{
    if([elementName isEqualToString:@"title"] || [elementName isEqualToString:@"pubDate"])
    {
        [mdictXMLPart setObject:mstrXMLString forKey:elementName];
    }
    if([elementName isEqualToString:@"item"])
        [marrXMLData addObject:mdictXMLPart];
    mstrXMLString = nil;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [marrXMLData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    cell.textLabel.text = [[[marrXMLData objectAtIndex:indexPath.row] valueForKey:@"title"] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    cell.detailTextLabel.text = [[[marrXMLData objectAtIndex:indexPath.row] valueForKey:@"pubDate"] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    [activityView stopAnimating];

    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//#pragma mark - Table view data source
//
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
//    return 0;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
//    return 0;
//}
//
/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
