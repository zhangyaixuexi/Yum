//
//  BaseViewController.h
//  BaseProduct
//
//  Created by zhangyi on 2017/9/28.
//  Copyright © 2017年 zhangyi. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,BaseViewMode){
    BaseViewModeNone = 0,
    BaseViewModeNavBar,
    BaseViewModeTabBar,
    BaseViewModeNavAndTabBar,
};

@interface BaseViewController : UIViewController

/**
 类型，是否有navigationBar，tabBar。 default is BaseViewModeNavBar
 */
@property (nonatomic, assign) BaseViewMode          mode;

/**
 iPhoneX 底部显示全部
 */
@property (nonatomic, assign) BOOL                  showBotAll;

/**
 顶部偏移
 */
@property (nonatomic, assign) CGFloat               offsetTop;

/**
 底部偏移
 */
@property (nonatomic, assign) CGFloat               offsetBot;

/**
 设置顶部和底部偏移
 
 @param offsetTop 顶部偏移量
 @param offsetBot 底部偏移量
 */
- (void)setOffsetTop:(CGFloat)offsetTop offsetBot:(CGFloat)offsetBot;


- (CGFloat)getBotHeight;

/**
 根据导航栏是否透明，设置y坐标
 */
- (CGFloat)getYFromJudgeTranslucent;

- (void)updateScrollViewFrame;

@end
