//
//  AppDelegate.m
//  CollectionViewTest
//
//  Created by 刘艳芹 on 2020/5/17.
//  Copyright © 2020 刘艳芹. All rights reserved.
//

#import "AppDelegate.h"
#import "HGPersonalCenterViewController.h"



@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    HGPersonalCenterViewController *homeViewController = [[HGPersonalCenterViewController alloc] init];
    UINavigationController *rootNavigationController = [[UINavigationController alloc] initWithRootViewController:homeViewController];
    self.window.rootViewController = rootNavigationController;
    [self.window makeKeyAndVisible];
    self.window.backgroundColor = [UIColor whiteColor];
    return YES;
}


#pragma mark - UISceneSession lifecycle


@end
