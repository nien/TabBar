//
//  TabBarAppDelegate.h
//  TabBar
//
//  Created by David Nolen on 3/10/09.
//  Copyright David Nolen 2009. All rights reserved.
//  Modified by Nien Lam 2010
//


#import <UIKit/UIKit.h>


#define kFileName    @"data.plist"


@interface TabBarAppDelegate : NSObject <UIApplicationDelegate> {
  IBOutlet UITabBarController *tabBarController;
  UIWindow *window;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

- (NSString *)dataFilePath;

@end

