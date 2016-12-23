//
//  AppDelegate.h
//  StopWatchApp
//
//  Created by vinod bisht on 23/12/16.
//  Copyright © 2016 vinod bisht. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

