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
    overlayViewController.view.hidden = YES;
}

extern "C" void _OverlayWindowUninstall() {
    [overlayViewController release];
    overlayViewController = nil;
}

extern "C" void _OverlayWindowShow(const char *text) {
    overlayViewController.textView.text = CreateNSString(text);
    overlayViewController.view.hidden = NO;
}

extern "C" void _OverlayWindowHide() {
    overlayViewController.view.hidden = YES;
}

extern "C" BOOL _OverlayWindowUpdate() {
    return !overlayViewController.view.hidden;
}
