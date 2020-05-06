
#import "RNReactNativeToastie.h"

@implementation RNReactNativeToastie

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}

// overriding the main init method, which also means
// implementing requireMainQueueSetup to run on main thread
-(instancetype) init {
    self = [super init];
    if (self) {
        self.toast = [[Toast alloc] init];
    }
    
    return self;
}

+(BOOL) requiresMainQueueSetup {
    return YES;
}

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(show: (NSString *) text) {
    [self.toast showToast: text];
}
@end
  
