//
//  AppDelegate.h
//  Yum
//
//  Created by zhangyi on 2018/4/24.
//  Copyright © 2018年 zhangyi. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 认证方式

 - AuthenticationTypeUser: 用户
 - AuthenticationTypeMerchant: 商家
 */
typedef NS_ENUM(NSInteger,AuthenticationType)
{
    AuthenticationTypeUser = 0,
    AuthenticationTypeMerchant
};

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;


@end

