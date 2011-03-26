#import <UIKit/UIKit.h>

#include "RegisterClasses.h"
#include "RegisterMonoModules.h"


void UnityParseCommandLine(int argc, char *argv[]);

int main(int argc, char *argv[])
{
	UnityParseCommandLine(argc, argv);

	RegisterMonoModules();
	NSLog(@"-> registered mono modules\n");
	
	NSAutoreleasePool*		pool = [NSAutoreleasePool new];
	
	UIApplicationMain(argc, argv, nil, @"AppController");
	
	[pool release];
	
	return 0;
}
