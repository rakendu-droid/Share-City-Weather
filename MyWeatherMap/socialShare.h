//
//  socialShare.h
//  MyWeatherMap
//
//  Created by rakendu on 29/12/14.
//  Copyright (c) 2014 rakendu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MessageUI/MessageUI.h>
#import <Social/Social.h>
#import "UIAlertView+TRUAlertView.h"

@interface socialShare : NSObject<UIScrollViewDelegate>

- (void)showSMS:(NSString*)file;
@end
