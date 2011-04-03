#import <UIKit/UIKit.h>

@interface OverlayViewController : UIViewController {
}

@property (nonatomic, retain) IBOutlet UITextView *textView;
@property (readonly) BOOL visible;

- (IBAction)close;

- (void)showWithText:(NSString *)text;

@end
