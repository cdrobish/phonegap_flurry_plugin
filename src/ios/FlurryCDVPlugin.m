#import <Cordova/CDV.h>
#import "Flurry.h"
#import "FlurryCDVPlugin.h"

@implementation FlurryCDVPlugin

- (void)startSession:(CDVInvokedUrlCommand *)command
{
    CDVPluginResult* pluginResult = nil;
    NSString* apiKey = [command.arguments objectAtIndex:0];

    if (apiKey != nil) {
        NSLog(@"starting flurry Session: %@",apiKey);
        [Flurry setDebugLogEnabled:YES];
        [Flurry setCrashReportingEnabled:YES];
        [Flurry setEventLoggingEnabled:YES];
        [Flurry startSession:apiKey];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Arg was null"];
    }
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}
    
- (void)logEvent:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    NSString* eventName = [command.arguments objectAtIndex:0];

    if (eventName != nil) {
        [Flurry logEvent:eventName];
        NSLog(@"FlurryCDVPlugin.logEvent: %@",eventName);
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Arg was null"];
    }
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

-(void) logPageView:(CDVInvokedUrlCommand*)command
{
    [Flurry logPageView];
}

@end