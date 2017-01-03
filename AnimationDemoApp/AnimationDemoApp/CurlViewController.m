//
//  CurlViewController.m
//  AnimationDemoApp
//
//  Created by vinod bisht on 30/12/16.
//  Copyright © 2016 dev. All rights reserved.
//

#import "CurlViewController.h"

@interface CurlViewController ()

@end

@implementation CurlViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setUpView];
}
-(void)setUpView{
    view1 = [[UIView alloc]initWithFrame:self.view.frame];
    view1.backgroundColor = [UIColor lightTextColor];
    view2 = [[UIView alloc]initWithFrame:self.view.frame];
    view2.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:view1];
    [self.view sendSubviewToBack:view1];
    
}

-(void)doTransitionWithType:(UIViewAnimationTransition)animationTransitionType{
    if ([[self.view subviews] containsObject:view2 ]) {
        [UIView transitionFromView:view2
                            toView:view1
                          duration:2                           options:animationTransitionType
                        completion:^(BOOL finished){
                            [view2 removeFromSuperview];
                        }];
        [self.view addSubview:view1];
        [self.view sendSubviewToBack:view1];
    }
    else{
        
        [UIView transitionFromView:view1
                            toView:view2
                          duration:2
                           options:animationTransitionType
                        completion:^(BOOL finished){
                            [view1 removeFromSuperview];
                        }];
        [self.view addSubview:view2];
        [self.view sendSubviewToBack:view2];
        
    }
}


-(IBAction)curlUp:(id)sender{
  
    [self doTransitionWithType:UIViewAnimationOptionTransitionCurlUp];
    
}
-(IBAction)curlDown:(id)sender{
    
    [self doTransitionWithType:UIViewAnimationOptionTransitionCurlDown];
    
}
-(IBAction)dissolve:(id)sender{
    
    [self doTransitionWithType:UIViewAnimationOptionTransitionCrossDissolve];
    
}
-(IBAction)noTransition:(id)sender{
    
    [self doTransitionWithType:UIViewAnimationOptionTransitionNone];
    
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
