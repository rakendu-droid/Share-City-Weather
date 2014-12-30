//
//  socialShare.m
//  MyWeatherMap
//
//  Created by rakendu on 29/12/14.
//  Copyright (c) 2014 rakendu. All rights reserved.
//

#import "socialShare.h"

@implementation socialShare


//- (void)showSMS:(NSString*)file {
//    
//    if(![MFMessageComposeViewController canSendText]) {
//        [UIAlertView showAlertWithTitle:NSLocalizedString(@"Configure Text Message", @"Configure Message") message:[NSString stringWithFormat:@"Check out at Toys”R”Us"] error:nil delegate:nil cancelButtonTitle:NSLocalizedString(@"OK", @"OK") otherButtonTitles: nil];
//        return;
//    }
//    
//    // NSArray *recipents = @[@"12345678", @"72345524"];
//    NSString *message = [NSString stringWithFormat:@"Check out mesage"] ;
//    
//    MFMessageComposeViewController *messageController = [[MFMessageComposeViewController alloc] init];
//    messageController.messageComposeDelegate = self;
//    // [messageController setRecipients:recipents];
//    [messageController setBody:message];
//    
//    // Present message view controller on screen
//    [self presentViewController:messageController animated:YES completion:nil];
//}

- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult) result
{
    switch (result) {
        case MessageComposeResultCancelled:
            break;
            
        case MessageComposeResultFailed:
        {
//            [UIAlertView showAlertWithTitle:NSLocalizedString(@"Failed To Send SMS", @"Failed To Send SMS") message:NSLocalizedString(@"Please configure your SMS and try again.", @"Please configure your SMS and try again.") error:nil delegate:nil cancelButtonTitle:NSLocalizedString(@"OK", @"OK") otherButtonTitles: nil];
            break;
        }
            
        case MessageComposeResultSent:
            break;
        default:
            break;
    }
   // [self dismissViewControllerAnimated:YES completion:nil];
}


@end
