
#if __has_include("RCTBridgeModule.h")
#import "RCTBridgeModule.h"
#else
#import <React/RCTBridgeModule.h>
#endif

#import "Toast.h"

@interface RNReactNativeToastie : NSObject <RCTBridgeModule>

@property(nonatomic, retain) Toast *toast;

@end
  
