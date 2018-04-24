//
//  AppDelegateHelper.m
//  Yum
//
//  Created by zhangyi on 2018/4/24.
//  Copyright © 2018年 zhangyi. All rights reserved.
//

#import "AppDelegateHelper.h"
#import "U_NearbyViewController.h"
#import "U_CollectViewController.h"
#import "U_OrderViewController.h"
#import "PersonalCenterViewController.h"
#import "B_OrderViewController.h"
#import "B_MenuViewController.h"
#import "B_StatisticsViewController.h"

@implementation AppDelegateHelper


/**
 根据身份获取界面

 @param type 用户/商户
 */
+ (NSArray <UIViewController *> *)getViewControllersWithAuthType:(AuthenticationType)type
{
    //个人中心
    PersonalCenterViewController * personalCenter = [[PersonalCenterViewController alloc] initWithAuthType:type];
    BaseNavigationController * personalCenterNav = [[BaseNavigationController alloc] initWithRootViewController:personalCenter];
    personalCenterNav.tabBarItem.title = @"我的";
    
        //用户认证
    if (type == AuthenticationTypeUser) {
        //附近
        U_NearbyViewController * nearby = [[U_NearbyViewController alloc] init];
        BaseNavigationController * nearbyNav = [[BaseNavigationController alloc] initWithRootViewController:nearby];
        nearbyNav.tabBarItem.title = @"附近";
        
        //收藏
        U_CollectViewController * collect = [[U_CollectViewController alloc] init];
        BaseNavigationController * collectNav = [[BaseNavigationController alloc] initWithRootViewController:collect];
        collectNav.tabBarItem.title = @"收藏";
        
        //订单
        U_OrderViewController * userOrder = [[U_OrderViewController alloc] init];
        BaseNavigationController * userOrderNav = [[BaseNavigationController alloc] initWithRootViewController:userOrder];
        userOrderNav.tabBarItem.title = @"订单";
        
        return @[nearbyNav,collectNav,userOrderNav,personalCenterNav];
      
        //商户认证
    }else{
        //订单
        B_OrderViewController * merchantOrder = [[B_OrderViewController alloc] init];
        BaseNavigationController * merchantOrderNav = [[BaseNavigationController alloc] initWithRootViewController:merchantOrder];
        merchantOrderNav.tabBarItem.title = @"订单";
        
        //菜单
        B_MenuViewController * menu = [[B_MenuViewController alloc] init];
        BaseNavigationController * menuNav = [[BaseNavigationController alloc] initWithRootViewController:menu];
        menuNav.tabBarItem.title = @"菜单";
        
        //统计
        B_StatisticsViewController * statistics = [[B_StatisticsViewController alloc] init];
        BaseNavigationController * statisticsNav = [[BaseNavigationController alloc] initWithRootViewController:statistics];
        statisticsNav.tabBarItem.title = @"统计";
        
        return @[merchantOrderNav,menuNav,statisticsNav,personalCenterNav];
    }
}

@end
