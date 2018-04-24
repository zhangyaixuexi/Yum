//
//  BaseViewController.m
//  BaseProduct
//
//  Created by zhangyi on 2017/9/28.
//  Copyright © 2017年 zhangyi. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //返回title
    UIBarButtonItem * barbutton = [[UIBarButtonItem alloc] init];
    barbutton.title = @"返回";
    self.navigationItem.backBarButtonItem = barbutton;
    
    _offsetTop = 0;
    _offsetBot = 0;
    
    _mode = BaseViewModeNavBar;
    
    //iOS 11以前 
    if (!SYSTEM_11) {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
}

#pragma mark -- set
- (void)setMode:(BaseViewMode)mode
{
    _mode = mode;
    
    [self updateScrollViewFrame];
}

/**
 底部偏移
 
 @param offsetBot 偏移量
 */
- (void)setOffsetBot:(CGFloat)offsetBot
{
    _offsetBot = offsetBot;
    
    [self updateScrollViewFrame];
}

/**
 顶部偏移
 
 @param offsetTop 偏移量
 */
- (void)setOffsetTop:(CGFloat)offsetTop
{
    _offsetTop = offsetTop;
    
    [self updateScrollViewFrame];
}

- (void)updateScrollViewFrame
{
    
}

#pragma mark -- other
- (CGFloat)getBotHeight
{
    if (_showBotAll) {
        return 0;
    }
    return IPHONE_X_BOT_H;
}

/**
 根据导航栏是否透明，设置y坐标
 */
- (CGFloat)getYFromJudgeTranslucent
{
    if (self.navigationController) {
        if (self.navigationController.navigationBar.translucent) {
            return TOPBAR_H;
        }
    }
    return 0;
}



@end
