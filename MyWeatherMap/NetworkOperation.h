//
//  NetworkOperation.h
//  MyWeatherMap
//
//  Created by rakendu on 29/12/14.
//  Copyright (c) 2014 rakendu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyWeather.h"

typedef void (^CallBackBlock)(NSString *responseData,NSURLResponse *response);
@interface NetworkOperation : NSObject 
{
    NSString *responseString;
}



-(void)getWeatherDetails:(NSString *)latitude Coordinates:(NSString *)lonitude WithCallBackBlock:(CallBackBlock)callBackBlock;
@end
