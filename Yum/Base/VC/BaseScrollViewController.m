//
//  BaseScrollViewController.m
//  BaseProduct
//
//  Created by zhangyi on 2017/9/28.
//  Copyright © 2017年 zhangyi. All rights reserved.
//

#import "BaseScrollViewController.h"

#define CONTENT_SIZE_OFFSET 0.25
#define DEFAULT_OFFSET 10

@interface BaseScrollViewController ()

@end

@implementation BaseScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark -- getter
- (UIScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, [self getYFromJudgeTranslucent], SCREEN_W, SCREEN_H - TOPBAR_H - IPHONE_X_BOT_H)];
        [self.view addSubview:_scrollView];
        [self setDefaultContentSize];
    }
    return _scrollView;
}

/**
 更新scrollView的frame
 */
- (void)updateScrollViewFrame
{
    if (self.mode == BaseViewModeNavBar) {
        self.scrollView.frame = CGRectMake(0, [self getYFromJudgeTranslucent] + self.offsetTop, SCREEN_W, SCREEN_H - TOPBAR_H - [self getBotHeight] - self.offsetTop - self.offsetBot);
        
    }else if (self.mode == BaseViewModeNavAndTabBar){
        self.scrollView.frame = CGRectMake(0, [self getYFromJudgeTranslucent] + self.offsetTop, SCREEN_W, SCREEN_H - TOPBAR_H - TABBAR_H - self.offsetTop - self.offsetBot);
        
    }else if (self.mode == BaseViewModeNone) {
        self.scrollView.frame = CGRectMake(0, self.offsetTop, SCREEN_W, SCREEN_H - [self getBotHeight] - self.offsetTop - self.offsetBot);
        
    }else if (self.mode == BaseViewModeTabBar){
        self.scrollView.frame = CGRectMake(0, self.offsetTop, SCREEN_W, SCREEN_H - TABBAR_H - self.offsetTop - self.offsetBot);
    }
    
    [self setDefaultContentSize];
}


#pragma mark -- method
/**
 设置scrollView的contentSize
 
 @param view 最底部的view
 */
- (void)setContentSizeWithLastView:(UIView *)view offset:(CGFloat)offset
{
    CGFloat contentSizeHeight = CGRectGetMaxY(view.frame) + offset;
    CGFloat scrollViewHeight = self.scrollView.frame.size.height;
    if (scrollViewHeight > contentSizeHeight) {
        contentSizeHeight = scrollViewHeight + CONTENT_SIZE_OFFSET;
    }
    _scrollView.contentSize = CGSizeMake(SCREEN_W, contentSizeHeight);
}


/**
 设置默认的contentSize
 */
- (void)setDefaultContentSize
{
    CGFloat scrollViewHeight = self.scrollView.frame.size.height;
    _scrollView.contentSize = CGSizeMake(SCREEN_W, scrollViewHeight + CONTENT_SIZE_OFFSET);
}

@end

