//
//  AppDelegate.m
//  CBLern
//
//  Created by Elaine on 15--5.
//  Copyright (c) 2015年 yinuo. All rights reserved.
//

#import "AppDelegate.h"
#import <objc/message.h>
#import "CBPopViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
//    CBPopViewController *cb = [CBPopViewController new];
//    [cb performSelector:@selector(woca) withObject:nil afterDelay:0];
//    
//    NSArray *array = [NSArray arrayWithObjects:@"01:00", @"15:00", @"12:00", @"09:00", @"23:00", nil];
//    NSArray *array1 = [array sortedArrayUsingSelector:@selector(compare:)];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
   
    
//    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"nav"] forBarPosition:UIBarPositionTop barMetrics:UIBarMetricsDefault];
    
    
    NSString *str1 = @"123456";
    NSString *str2 = [str1 substringWithRange:NSMakeRange(0, 1)];
    NSLog(@"-----%@", str2);
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
