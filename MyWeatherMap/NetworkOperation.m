//
//  NetworkOperation.m
//  MyWeatherMap
//
//  Created by rakendu on 29/12/14.
//  Copyright (c) 2014 rakendu. All rights reserved.
//

#import "NetworkOperation.h"

@implementation NetworkOperation
{
    NSURLConnection *connection;
    
}

NSString *BASE_URL = @"http://api.openweathermap.org/data/2.5/weather";


-(void)getWeatherDetails:(NSString *)latitude Coordinates:(NSString *)lonitude WithCallBackBlock:(CallBackBlock)callBackBlock{
    
    
    NSString *parameters = [NSString stringWithFormat:@"?lat=%@&lon=%@",latitude,lonitude];
    NSString *fullUrl = [BASE_URL stringByAppendingString:parameters];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:fullUrl]];
    request.HTTPMethod = @"GET";
    //Send asynchronous request
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response,NSData *data,NSError *connectionError) {
        responseString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        callBackBlock(responseString,response);
        
    }];
    
}


@end
