//
//  BaseTableViewController.m
//  BaseProduct
//
//  Created by zhangyi on 2017/9/29.
//  Copyright © 2017年 zhangyi. All rights reserved.
//

#import "BaseTableViewController.h"

@interface BaseTableViewController ()

@end

@implementation BaseTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark -- getter
- (UITableView *)tableView
{
    if (!_tableView) {
        CGRect frame = CGRectMake(0, [self getYFromJudgeTranslucent], SCREEN_W, SCREEN_H - TOPBAR_H - [self getBotHeight]);
        _tableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
        _tableView.tableFooterView = [[UIView alloc] init];
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0.01)];
        _tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0.01)];
        _tableView.sectionFooterHeight = 0.01;
        _tableView.sectionHeaderHeight = 0.01;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

/**
 更新scrollView的frame
 */
- (void)updateScrollViewFrame
{
    if (self.mode == BaseViewModeNavBar) {
        self.tableView.frame = CGRectMake(0, [self getYFromJudgeTranslucent] + self.offsetTop, SCREEN_W, SCREEN_H - TOPBAR_H - [self getBotHeight] - self.offsetTop - self.offsetBot);
        
    }else if (self.mode == BaseViewModeNavAndTabBar){
        self.tableView.frame = CGRectMake(0, [self getYFromJudgeTranslucent] + self.offsetTop, SCREEN_W, SCREEN_H - TOPBAR_H - TABBAR_H - self.offsetTop - self.offsetBot);
        
    }else if (self.mode == BaseViewModeNone) {
        self.tableView.frame = CGRectMake(0, self.offsetTop, SCREEN_W, SCREEN_H - [self getBotHeight] - self.offsetTop - self.offsetBot);
        
    }else if (self.mode == BaseViewModeTabBar){
        self.tableView.frame = CGRectMake(0, self.offsetTop, SCREEN_W, SCREEN_H - TABBAR_H - self.offsetTop - self.offsetBot);
    }
}




@end
