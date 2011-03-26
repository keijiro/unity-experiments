#import <UIKit/UIKit.h>

@interface AppController : NSObject<UIAccelerometerDelegate, UIApplicationDelegate>
{
	UIWindow*			_window;
}
- (void) startUnity:(UIApplication*)application;
- (void) startRendering:(UIApplication*)application;

@end

#define NSTIMER_BASED_LOOP 0
#define THREAD_BASED_LOOP 1
#define EVENT_PUMP_BASED_LOOP 2
