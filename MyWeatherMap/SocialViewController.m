//
//  SocialViewController.m
//  MyWeatherMap
//
//  Created by rakendu on 29/12/14.
//  Copyright (c) 2014 rakendu. All rights reserved.
//

#import "SocialViewController.h"

@interface SocialViewController ()
{
    NSString * title;
    NSString *message;
}
@end

@implementation SocialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"current weather %@",self.currentWeather.temprature);
    // Do any additional setup after loading the view.
    title = [NSString stringWithFormat:@"%@'s weather",self.currentWeather.cityName];
    message = [NSString stringWithFormat:@"Temprature:%@ \n Max Temprature: %@ \n Min Temprature:%@",self.currentWeather.temprature, self.currentWeather.tempratureMax,self.currentWeather.tempratureMin];
    NSLog(@"Message %@",message);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)messageClick:(id)sender {
    
    [self showSMS:@"null"];
}

- (void)showSMS:(NSString*)file {
    
    
    
    if(![MFMessageComposeViewController canSendText]) {
        [UIAlertView showAlertWithTitle:NSLocalizedString(title, title) message:message error:nil delegate:nil cancelButtonTitle:NSLocalizedString(@"OK", @"OK") otherButtonTitles: nil];
        return;
    }
    
    
    
    MFMessageComposeViewController *messageController = [[MFMessageComposeViewController alloc] init];
    messageController.messageComposeDelegate = self;
    
    [messageController setBody:message];
    
    // Present message view controller on screen
    [self presentViewController:messageController animated:YES completion:nil];
}

- (IBAction)emailClick:(id)sender {
    
    NSLog(@"Email");
    if ([MFMailComposeViewController canSendMail]) {
        
        NSLog(@"IF");
        // device is configured to send mail
        MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
        mc.mailComposeDelegate = self;
        
        [mc setSubject:title];
        [mc setMessageBody:message isHTML:NO];
        
        [self presentViewController:mc animated:YES completion:NULL];
    }
    else{
        NSLog(@"ELSE");
        [UIAlertView showAlertWithTitle:NSLocalizedString(@"Configure Mail", @"Configure Mail") message:NSLocalizedString(@"Please configure your mail and try again.", @"Please configure your mail and try again.") error:nil delegate:nil cancelButtonTitle:NSLocalizedString(@"OK", @"OK") otherButtonTitles: nil];
        
    }

}
- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail sent");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail sent failure: %@", [error localizedDescription]);
            break;
        default:
            break;
    }
    
    // Close the Mail Interface
    [self dismissViewControllerAnimated:YES completion:NULL];
    
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
