//
//  Toast.m
//  RNNativeToastLibrary
//
//  Created by Elliot Rodriguez on 5/5/20.
//  Copyright © 2020 Facebook. All rights reserved.
//

#import "Toast.h"
#import <UIKit/UIKit.h>

@implementation Toast : NSObject

// default toast duration
static double const DEFAULT_TOAST_DURATION_SECONDS = 3.5;

// when a duration isnt provided,
-(void) showToast: (NSString *) message {
    [self showToast:message duration: DEFAULT_TOAST_DURATION_SECONDS];
}

-(void) showToast:(NSString *)message duration:(double)duration {
    UIWindow *window = [[UIWindow alloc] initWithFrame: UIScreen.mainScreen.bounds];
    UIViewController *rootVC = [[UIViewController alloc] init];
    
    // if no viewcontroller or window, just return
    if (rootVC == nil || window || nil) {
        return;
    }
    
    // ENHANCEMENT, take color as prop
    window.backgroundColor = [UIColor clearColor];
    window.rootViewController = rootVC;
    [window makeKeyAndVisible]; // show the window and make it the key window
    
    // leverage the alert controller and present the viewcontroller as the actual alert like an action sheet
    UIAlertController *alert = [UIAlertController alertControllerWithTitle: nil message:message preferredStyle:UIAlertControllerStyleActionSheet];
    
    // why does this message not allow for dot notqtion?
    [rootVC presentViewController:alert animated:YES completion:nil];
    [self closeToast:window alert:alert duration:duration];
    
}

-(void) closeToast: (UIWindow *) window alert:(UIAlertController *) alert duration: (double) duration {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(duration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //[alert dismissModalViewControllerAnimated:YES completion:nil];
        [alert dismissViewControllerAnimated:YES completion:nil];
        [window removeFromSuperview];
    });
}

@end
