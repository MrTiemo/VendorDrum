//
//  AppDelegate.m
//  VendorDrum
//
//  Created by 爱尚家 on 16/7/8.
//  Copyright © 2016年 爱尚家. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
//    if(![[NSUserDefaults standardUserDefaults] boolForKey:@"firstLaunch"]){
//        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"firstLaunch"];
//        NSLog(@"第一次启动");
//        WelcomeViewController *lo = [[WelcomeViewController alloc] init];
//        self.window.rootViewController = lo ;
//    }else{
//        NSLog(@"已经不是第一次启动了");
//        LoginViewController *lo = [[LoginViewController alloc] init];
//        self.window.rootViewController = lo ;
//    }

    APP_DELEGATE.window.rootViewController = [NSClassFromString(@"MainTabbar")new];
    [self.window makeKeyAndVisible];
    //初始化应用，appKey和appSecret从后台申请得
    [SMSSDK registerApp:@"14dfc6e8e9478" withSecret:@"a5294383fd6be4f68cc166d95177d8af"];
    
//    [NSThread sleepForTimeInterval:0.0];//设置启动页面时间
    
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
