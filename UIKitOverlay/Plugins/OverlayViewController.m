#import <UIKit/UIView.h>
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
    return self;
}

- (void)dealloc
{
    [super dealloc];
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

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)showWithText:(NSString *)text
{
    // テキストの設定。
    self.textView.text = text;
    // ビューを画面外に配置する。
    float bottom = self.view.superview.frame.size.height;
    self.view.center = CGPointMake(self.view.center.x,bottom + self.view.frame.size.height / 2);
    self.view.hidden = NO;
    // 下からスライドするアニメーション。
    [UIView animateWithDuration:0.4 animations:^{
        self.view.center = CGPointMake(self.view.center.x, bottom - self.view.frame.size.height / 2);
    }];
}

- (IBAction)close
{
    // 画面下へスライドするアニメーション。終了時に非表示化する。
    float bottom = self.view.superview.frame.size.height;
    [UIView animateWithDuration:0.4 animations:^{
        self.view.center = CGPointMake(self.view.center.x, bottom + self.view.frame.size.height / 2);
    } completion:^(BOOL finished){
        self.view.hidden = YES;
    }];
}

@end
