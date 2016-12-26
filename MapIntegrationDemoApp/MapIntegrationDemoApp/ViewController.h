//
//  ViewController.h
//  MapIntegrationDemoApp
//
//  Created by vinod bisht on 21/12/16.
//  Copyright © 2016 vinod bisht. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController<MKMapViewDelegate,CLLocationManagerDelegate>
{
    CLLocationManager *objLocationManager;
    double latitude_UserLocation, longitude_UserLocation;
}
@property (weak, nonatomic) IBOutlet UISegmentedControl *segControlForColor;
- (IBAction)segBtnTap:(id)sender;
@property(nonatomic,strong)NSMutableArray *categoryData;
@property (nonatomic, strong) IBOutlet MKMapView *mapView;

@end

