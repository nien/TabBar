//
//  TabBarAppDelegate.m
//  TabBar
//
//  Created by David Nolen on 3/10/09.
//  Copyright David Nolen 2009. All rights reserved.
//  Modified by Nien Lam 2010
//

#import "TabBarAppDelegate.h"

@implementation TabBarAppDelegate

@synthesize window;


- (NSString *)dataFilePath 
{
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	return [documentsDirectory stringByAppendingPathComponent:kFileName];
}


- (void)applicationDidFinishLaunching:(UIApplication *)application 
{    
	[window addSubview:tabBarController.view];
	// Override point for customization after application launch
	[window makeKeyAndVisible];
	
	NSString *filePath = [self dataFilePath];

	if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
		NSArray * array = [[NSArray alloc] initWithContentsOfFile:filePath];

		tabBarController.selectedIndex = [[array objectAtIndex:0] intValue];
		[tabBarController.selectedViewController viewDidAppear:YES];
		
		[array release];
	}
}


- (void)applicationWillTerminate:(UIApplication *)application 
{
	NSLog(@"Application Terminating: %d",tabBarController.selectedIndex);

	NSNumber * tabIndex = [[NSNumber alloc] initWithInt:tabBarController.selectedIndex];
	NSMutableArray *array = [[NSMutableArray alloc] init];

	[array addObject:tabIndex];
	[array writeToFile:[self dataFilePath] atomically:YES];
	
	[tabIndex release];
	[array release];
}


- (void)dealloc {
  [window release];
  [super dealloc];
}


@end
