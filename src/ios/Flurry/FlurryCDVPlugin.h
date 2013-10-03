#import <Cordova/CDV.h>

@interface FlurryCDVPlugin : CDVPlugin;

- (void)startSession:(CDVInvokedUrlCommand*)command;
- (void)logEvent:(CDVInvokedUrlCommand*)command;
- (void)logPageView:(CDVInvokedUrlCommand*)command;

@end