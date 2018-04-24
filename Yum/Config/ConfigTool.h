
//
//  ConfigTool.h
//  BaseProduct
//
//  Created by zhangyi on 2017/9/12.
//  Copyright © 2017年 zhangyi. All rights reserved.
//

#ifndef ConfigTool_h
#define ConfigTool_h

/* DEBUG下输出 release不输出 */
#ifdef DEBUG
#define NSLog(...) NSLog(__VA_ARGS__)
#else
#define NSLog(...)
#endif


/* tool */
#define _window        ((AppDelegate *)[UIApplication sharedApplication].delegate).window

#define SYSTEM_11      ([[[UIDevice currentDevice] systemVersion] floatValue] >=11.0)           //系统是否大于等于11
#define IPHONE_X       (SCREEN_H == 812)                                                        //是否是iPhone X

#define weakify(var)    __weak typeof(var) weakSelf = var
#define strongify(var)  __strong typeof(var) strongSelf = var

/* 系统控件常量 */
#define SCREEN_H       [UIScreen mainScreen].bounds.size.height
#define SCREEN_W       [UIScreen mainScreen].bounds.size.width

#define TOPBAR_H       ([UIApplication sharedApplication].statusBarFrame.size.height + 44)      //statusBar + navBar
#define TABBAR_H       (IPHONE_X ? 83 : 49)                                                     //tabBar
#define IPHONE_X_BOT_H  (IPHONE_X ? 34 : 0)                                                      //iPhone X 底部不安全区域

#define SEARCH_BAR_H   (SYSTEM_11 ? 56 : 44)

/* 比例适配 */
#define RATIO           NOW_SCR_W/320.0


/* 全局常量 */
#define LEADING     10.f        //左边距
#define TRAILING    10.f        //右边距


/* 字体 */
#define FONT_N      16.f        //正文字体
#define FONT_S      13.f        //字体偏小
#define FONT_B      20.f        //字体偏大


/* notif name */
#define AppDelegate_ChangeAuthType_Notif @"AppDelegate_ChangeAuthType_Notif"

#endif /* ConfigTool_h */




