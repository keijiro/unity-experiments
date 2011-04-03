#import <QuartzCore/QuartzCore.h>
#import "OverlayViewController.h"

@implementation OverlayViewController

@synthesize textView;

- (BOOL)visible {
    return !self.view.hidden;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // テキストビューの角を丸める。
    self.textView.layer.cornerRadius = 5;
    self.textView.clipsToBounds = YES;
    // 非表示状態で始める。
    self.view.hidden = YES;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)close {
    self.view.hidden = YES;
}

- (void)showWithText:(NSString *)text {
    self.textView.text = text;
    self.view.hidden = NO;
}

@end
