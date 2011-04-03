#import <Foundation/Foundation.h>
#import "OverlayViewController.h"

static OverlayViewController *overlayViewController;

// Null終端文字列をNSStringに変換する。
static NSString* CreateNSString (const char* string) {
    return [NSString stringWithUTF8String:(string ? string : "")];
}

extern "C" void _OverlayWindowInstall() {
    overlayViewController = [[OverlayViewController alloc] init];
    [[UIApplication sharedApplication].keyWindow addSubview:overlayViewController.view];
}

extern "C" void _OverlayWindowUninstall() {
    [overlayViewController release];
    overlayViewController = nil;
}

extern "C" void _OverlayWindowShow(const char *text) {
    [overlayViewController showWithText:CreateNSString(text)];
}

extern "C" void _OverlayWindowHide() {
    [overlayViewController close];
}

extern "C" BOOL _OverlayWindowUpdate() {
    return overlayViewController.visible;
}
