//
//  ViewController.m
//  MyWeatherMap
//
//  Created by rakendu on 27/12/14.
//  Copyright (c) 2014 rakendu. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController{
    GMSMapView *mapView;
    UIActivityIndicatorView *activityIndicator;
    __block MyWeather *currentWeather;

}

- (void)loadView{
    
    
    
        GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:12.92
                                                                longitude:77.6
                                                                     zoom:6];
        mapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];
        mapView.myLocationEnabled = YES;
        self.view = mapView;
    
    
        GMSMarker *marker = [[GMSMarker alloc] init];
        marker.position = CLLocationCoordinate2DMake(-33.86, 151.20);
        marker.title = @"Sydney";
        marker.snippet = @"Australia";
        marker.map = mapView;
    mapView.delegate =self;
    
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    

}

-(void)mapView:(GMSMapView *)mapView didTapAtCoordinate:(CLLocationCoordinate2D)coordinate{
    
    
    NSString *latitude = [NSString stringWithFormat:@"%f",coordinate.latitude];
    NSString *longitude =[NSString stringWithFormat:@"%f",coordinate.longitude];
    
    activityIndicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    activityIndicator.frame = CGRectMake(0.0, 0.0, 140.0, 140.0);
    activityIndicator.center = self.view.center;
    [activityIndicator setColor:[UIColor grayColor]];
    [self.view addSubview:activityIndicator];
    [activityIndicator bringSubviewToFront:self.view];
    [activityIndicator startAnimating];
    
    NetworkOperation *netOperation =  [[NetworkOperation alloc]init];
    
    [netOperation getWeatherDetails:latitude Coordinates:longitude
                  WithCallBackBlock:^(NSString *responseData,NSURLResponse *response) {
                      NSHTTPURLResponse* httpResponse = (NSHTTPURLResponse*)response;
                      NSLog(@"DEBUG:respose callback %@ %ld",responseData,(long)[httpResponse statusCode]);
                      if([httpResponse statusCode]==200)
                      {
                          currentWeather = [[MyWeather alloc]init];
                          NSDictionary *JSON =
                          [NSJSONSerialization JSONObjectWithData: [responseData dataUsingEncoding:NSUTF8StringEncoding]
                                                          options: NSJSONReadingMutableContainers
                                                            error: nil];
                          
                          if(JSON)
                          {
                              currentWeather.temprature =[JSON valueForKeyPath:@"main.temp"];
                              currentWeather.tempratureMax = [JSON valueForKeyPath:@"main.temp_max"];
                              currentWeather.tempratureMin = [JSON valueForKeyPath:@"main.temp_min"];
                              currentWeather.cityName = [JSON valueForKey:@"name"];
                          }
                      }
                      //[netOperation getWeatherDetails:@"12.98" Coordinates:@"77.6"];
                      
                      [activityIndicator stopAnimating];
                      UIAlertView *weatherPopUp = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"%@'s weather",currentWeather.cityName] message:[NSString stringWithFormat:@"Temprature:%@ \n Max Temprature: %@ \n Min Temprature:%@",currentWeather.temprature, currentWeather.tempratureMax,currentWeather.tempratureMin] delegate:self cancelButtonTitle:@"Got It" otherButtonTitles:@"Share", nil];
                      [weatherPopUp show];
                  }];

    
    
    
    //[activityIndicator stopAnimating];
}

-(void)mapView:(GMSMapView *)mapView didLongPressAtCoordinate:(CLLocationCoordinate2D)coordinate{

    float latitude = coordinate.latitude;
    float longitude =coordinate.longitude;
    NSLog(@"Coordinate %f  %f",latitude,longitude);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if(buttonIndex==1)
    {
        //share button pressed
        [self performSegueWithIdentifier:@"sharePush" sender:nil];
    }
}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"sharePush"]) {
        
        //pass weather referance
        SocialViewController *share = (SocialViewController *)segue.destinationViewController;
        
        share.currentWeather  = self->currentWeather;
        
    }
   
    
}


@end
