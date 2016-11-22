#import "ResizeWebview.h"
#import <Cordova/CDV.h>

@implementation ResizeWebview

- (void) getFrame:(CDVInvokedUrlCommand*)command {
    
    CGRect bounds = self.webView.bounds;
    NSLog(@"%f by %f", bounds.size.width, bounds.size.height);
    
    [self.commandDelegate sendPluginResult:
     [CDVPluginResult resultWithStatus:CDVCommandStatus_OK
                   messageAsDictionary:@{
                                         @"x": @(bounds.origin.x),
                                         @"y": @(bounds.origin.y),
                                         @"width": @(bounds.size.width),
                                         @"height": @(bounds.size.height)
                                         }
      ] callbackId:command.callbackId];    
}

- (void) setFrame:(CDVInvokedUrlCommand*)command {
    CGFloat x = (CGFloat)[command.arguments[0] floatValue];
    CGFloat y = (CGFloat)[command.arguments[1] floatValue];
    CGFloat width = (CGFloat)[command.arguments[2] floatValue];
    CGFloat height = (CGFloat)[command.arguments[3] floatValue];
    
//    CGRect window = self.webView.window.frame;
    CGRect window = CGRectMake(x, y, width, height);
    
    self.webView.bounds = window;
    self.webView.frame = window;

    [self.commandDelegate sendPluginResult:
     [CDVPluginResult resultWithStatus:CDVCommandStatus_OK
                   messageAsDictionary:@{
                                         @"x": @(window.origin.x),
                                         @"y": @(window.origin.y),
                                         @"width": @(window.size.width),
                                         @"height": @(window.size.height)
                                         }
      ] callbackId:command.callbackId];
}

@end
