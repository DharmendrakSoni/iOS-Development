//
//  ViewController.m
//  MapIntegrationDemoApp
//
//  Created by vinod bisht on 21/12/16.
//  Copyright © 2016 vinod bisht. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    CLLocation *newLocation;
    NSMutableArray *placesArray;
  
}
@end

@implementation ViewController
@synthesize mapView,categoryData;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.mapView.delegate = self;
    //for Type show standard mapview
    [mapView setMapType:MKMapTypeStandard];
    
    //for Type show sateliteView
    //[mapView setMapType:MKMapTypeSatellite];
    
    //for Type show HybridView
    //[mapView setMapType:MKMapTypeHybrid];

    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(foundTap:)];
    
    tapRecognizer.numberOfTapsRequired = 1;
    
    tapRecognizer.numberOfTouchesRequired = 1;
    
    [self.mapView addGestureRecognizer:tapRecognizer];
    
    [self loadUserLocation];
}

-(void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:YES];
    //self.mapView.delegate = self;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void) loadUserLocation
{
    objLocationManager = [[CLLocationManager alloc] init];
    objLocationManager.delegate = self;
    objLocationManager.distanceFilter = kCLDistanceFilterNone;
    objLocationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters;
    if ([objLocationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [objLocationManager requestWhenInUseAuthorization];
    }
    

    [objLocationManager startUpdatingLocation];
}
- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray *)locations __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_6_0)
{
    newLocation = [locations objectAtIndex:0];
    latitude_UserLocation = newLocation.coordinate.latitude;
    longitude_UserLocation = newLocation.coordinate.longitude;
    [objLocationManager stopUpdatingLocation];
    [self loadMapView];
}
- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error
{
    [objLocationManager stopUpdatingLocation];
}
- (void) loadMapView
{
    CLLocationCoordinate2D objCoor2D = {.latitude = latitude_UserLocation, .longitude = longitude_UserLocation};
    MKCoordinateSpan objCoorSpan = {.latitudeDelta = 0.01, .longitudeDelta = 0.01};
    MKCoordinateRegion objMapRegion = {objCoor2D, objCoorSpan};
    [mapView setRegion:objMapRegion];
    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
    point.coordinate = newLocation.coordinate;
    point.title = @"Noida";
    point.subtitle = @"LoginWorks Software Pvt.Ltd";
    [self.mapView addAnnotation:point];
    
    //for adding annotation
//    MKPointAnnotation *point1 = [[MKPointAnnotation alloc] init];
//    CLLocationCoordinate2D myCoordinate;
//    myCoordinate.latitude=28.565490 ;
//    myCoordinate.longitude=77.088920;
//    point1.coordinate=myCoordinate;
//    point1.title = @"Delhi";
//    point1.subtitle = @"Indira Gandhi International Airport";
//    [mapView addAnnotation:point1];
     [self callApiWithUrl:@"https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=28.616180,77.355038&radius=500&type=atm&key=AIzaSyCayfvQ3PAOSKa3oQIit5PsNPxNdHBs39I" ];
    
}
-(void)callApiWithUrl:(NSString*)urlString
{
     NSURL *url=[NSURL URLWithString:urlString];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSDictionary *placesDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        NSArray *keys = [[NSArray alloc]init];
        keys = [placesDictionary allKeys];
        placesArray = [placesDictionary mutableArrayValueForKey:@"results"];
        for (int placesIndex=0; placesIndex<[placesArray count]; placesIndex++) {
            NSDictionary *dict_coordinates = [[placesArray objectAtIndex:placesIndex] valueForKey:@"geometry"];
            NSString *icon_path = [[placesArray objectAtIndex:placesIndex] valueForKey:@"icon"];
             NSString *place_name = [[placesArray objectAtIndex:placesIndex] valueForKey:@"name"];
             NSString *place_address = [[placesArray objectAtIndex:placesIndex] valueForKey:@"vicinity"];
            
            NSDictionary *coordinatesDict = [dict_coordinates objectForKey:@"location"];
            double latitude = [[coordinatesDict objectForKey:@"lat"] doubleValue];
            double longitude = [[coordinatesDict objectForKey:@"lng"] doubleValue];
            
            NSLog(@"Places Object at : %d and Data : %f , %f and name = %@",placesIndex,latitude,longitude,place_name);
            MKPointAnnotation *point1 = [[MKPointAnnotation alloc] init];
            CLLocationCoordinate2D myCoordinate;
            myCoordinate.latitude= latitude ;
            myCoordinate.longitude= longitude;
            point1.coordinate=myCoordinate;
            point1.title = place_name;
            point1.subtitle = place_address;
           // point1.icon
            [mapView addAnnotation:point1];            
            
        }
        
    }];
    
    
     [dataTask resume];
}

-(IBAction)foundTap:(UITapGestureRecognizer *)recognizer
{
    CGPoint point = [recognizer locationInView:self.mapView];
    
    CLLocationCoordinate2D tapPoint = [self.mapView convertPoint:point toCoordinateFromView:self.view];
    
    MKPointAnnotation *point1 = [[MKPointAnnotation alloc] init];
    point1.coordinate = tapPoint;
     NSLog(@"Location found from Map: %f %f", tapPoint.latitude,tapPoint.longitude);
    
    //[self.mapView addAnnotation:point1];
}


- (IBAction)btnStandards:(id)sender {
    
// [mapView setMapType:MKMapTypeStandard];
//    [self loadUserLocation];
//    [mapView setMapType:MKMapTypeSatellite];
//   [self loadUserLocation];
    //[mapView setMapType:MKMapTypeHybrid];
    //[self loadUserLocation];
    
}
@end
