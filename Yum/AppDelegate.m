//
//  AppDelegate.m
//  Yum
//
//  Created by zhangyi on 2018/4/24.
//  Copyright © 2018年 zhangyi. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegateHelper.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [self setRootVC];
    
    //通知->切换认证身份
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeAuthTypeNotif:) name:AppDelegate_ChangeAuthType_Notif object:nil];
    
    return YES;
}

- (void)setRootVC
{
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    UITabBarController * tabbar = [[UITabBarController alloc] init];
    tabbar.viewControllers = [AppDelegateHelper getViewControllersWithAuthType:AuthenticationTypeUser];
    self.window.rootViewController = tabbar;
    [self.window makeKeyAndVisible];
    
    if (@available(iOS 11, *)) {
        [UIScrollView appearance].contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever; //iOS11 解决SafeArea的问题，同时能解决pop时上级页面scrollView抖动的问题
    }
}

#pragma mark -- notif
- (void)changeAuthTypeNotif:(NSNotification *)notif
{
    AuthenticationType authType = [notif.object integerValue];

    UITabBarController * tabbar = (UITabBarController *)self.window.rootViewController;
    tabbar.viewControllers = [AppDelegateHelper getViewControllersWithAuthType:authType];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
