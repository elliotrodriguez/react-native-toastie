//
//  Toast.h
//  RNNativeToastLibrary
//
//  Created by Elliot Rodriguez on 5/5/20.
//  Copyright © 2020 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Toast : NSObject

-(void) showToast: (NSString *)message;
-(void) showToast: (NSString *)message duration:(double) duration;

@end

NS_ASSUME_NONNULL_END
