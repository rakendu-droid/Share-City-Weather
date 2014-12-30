//
//  UIAlertView+TRUAlertView.m
//  TRU Wish
//
//  Created by Anand Mundewadi on 7/19/14.
//  Copyright (c) 2014 HappiestMinds. All rights reserved.
//

#import "UIAlertView+TRUAlertView.h"

@implementation UIAlertView (TRUAlertView)

+ (id)showAlertWithTitle:(NSString *)title message:(NSString *)message error:(NSError *)error delegate:(id)delegate cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ... NS_REQUIRES_NIL_TERMINATION;
{
    UIAlertView *alertView;
    NSString *errorMessage = nil;
    
    //NSArray *keyArray = [NSArray arrayWithObjects: @"errorMessage", @"NSLocalizedDescription",nil];
    //if (error) {
    //    NSDictionary *userInfo = [error userInfo];
        //            if (userInfo) {
        //                NSString *msg = [userInfo objectForKeyWithNullCheck:@"errorMessage"];
        //                if ([msg length] > 0) {
        //                    errorMessage = msg;
        //                }
//        if (userInfo) {
//            for (int i=0; i<[keyArray count]; i++) {
//                NSString *msg = [userInfo objectForKeyWithNullCheck:[keyArray objectAtIndex:i]];
//                if ([msg length] > 0) {
//                    errorMessage = msg;
//                    break;
//                }
//            }
//        }
//    }
    
    if (!errorMessage)
    {
        errorMessage = message;
    }
    alertView =[[UIAlertView alloc] initWithTitle:title message:errorMessage delegate:delegate cancelButtonTitle:cancelButtonTitle otherButtonTitles:otherButtonTitles, nil];
    [alertView show];
    return alertView;
}

@end
