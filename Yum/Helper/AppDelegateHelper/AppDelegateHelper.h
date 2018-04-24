//
//  AppDelegateHelper.h
//  Yum
//
//  Created by zhangyi on 2018/4/24.
//  Copyright © 2018年 zhangyi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppDelegateHelper : NSObject

/**
 根据身份获取界面
 
 @param type 用户/商户
 */
+ (NSArray <UIViewController *> *)getViewControllersWithAuthType:(AuthenticationType)type;


@end
