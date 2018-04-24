//
//  BaseScrollViewController.h
//  BaseProduct
//
//  Created by zhangyi on 2017/9/28.
//  Copyright © 2017年 zhangyi. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseScrollViewController:BaseViewController

@property (nonatomic, strong) UIScrollView          * scrollView;

/**
 设置scrollView的contentSize
 
 @param view 最底部的view
 */
- (void)setContentSizeWithLastView:(UIView *)view offset:(CGFloat)offset;


@end
