//
//  UIAlertView+TRUAlertView.h
//  TRU Wish
//
//  Created by Anand Mundewadi on 7/19/14.
//  Copyright (c) 2014 HappiestMinds. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertView (TRUAlertView)
+ (id)showAlertWithTitle:(NSString *)title message:(NSString *)message error:(NSError *)error delegate:(id)delegate cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ... NS_REQUIRES_NIL_TERMINATION;

@end
