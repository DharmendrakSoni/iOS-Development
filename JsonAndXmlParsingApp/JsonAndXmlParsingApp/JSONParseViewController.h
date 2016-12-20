//
//  JSONParseViewController.h
//  JsonAndXmlParsingApp
//
//  Created by vinod bisht on 20/12/16.
//  Copyright © 2016 vinod bisht. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JSONParseViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *categoryTableView;
@property(nonatomic,strong)NSMutableArray *categoryData;
@end
