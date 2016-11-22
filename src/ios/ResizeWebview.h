#import <Cordova/CDV.h>

@interface ResizeWebview : CDVPlugin 

- (void) getFrame:(CDVInvokedUrlCommand*)command;
- (void) setFrame:(CDVInvokedUrlCommand*)command;

@end
