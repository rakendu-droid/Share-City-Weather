//
//  SocialViewController.h
//  MyWeatherMap
//
//  Created by rakendu on 29/12/14.
//  Copyright (c) 2014 rakendu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import <Social/Social.h>
#import "UIAlertView+TRUAlertView.h"
#import "MyWeather.h"

@interface SocialViewController : UIViewController<MFMailComposeViewControllerDelegate,MFMessageComposeViewControllerDelegate,UIAlertViewDelegate>

 @property (nonatomic,retain)MyWeather *currentWeather;
    

@end
