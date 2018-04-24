//
//  BaseSearchViewController.m
//  BaseProduct
//
//  Created by zhangyi on 2017/9/30.
//  Copyright © 2017年 zhangyi. All rights reserved.
//

#import "BaseSearchViewController.h"

@interface BaseSearchViewController ()

@end

@implementation BaseSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (void)dealloc
{
    [_searchController.searchResultsController.view removeObserver:self forKeyPath:@"hidden"];
}

- (UISearchController *)searchViewController
{
    if (!_searchController) {
        _searchController = [[UISearchController alloc] initWithSearchResultsController:_resultVC];
        [_searchController.searchBar sizeToFit];
        _searchController.searchBar.barTintColor = [UIColor redColor];
        _searchController.searchBar.backgroundColor = [UIColor yellowColor];
        self.definesPresentationContext = NO;
        //设置显示搜索结果的控制器
        _searchController.searchBar.keyboardType = UIKeyboardAppearanceDefault;
        _searchController.searchBar.placeholder = @"请输入城市关键字";
        /**
         使用KVO可能会造成崩溃，所以慎用。KVO可能造成崩溃的原因
         1. 对象已经销毁KVO监听依然存在
         2. 过多的删除KVO的监听
         */
        [_searchController.searchResultsController.view addObserver:self forKeyPath:@"hidden" options:NSKeyValueObservingOptionNew context:nil];
//        _searchController.searchBar.frame = CGRectMake(0, 0, SCREEN_W, 56);
    }
    return _searchController;
}

- (void)setResultVC:(UIViewController *)resultVC
{
    _resultVC = resultVC;
    self.tableView.tableHeaderView = self.searchViewController.searchBar;
}


- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context
{
    if ( object == self.searchController.searchResultsController.view &&
        [keyPath isEqualToString:@"hidden"] &&
        self.searchController.searchResultsController.view.hidden &&
        self.searchController.searchBar.isFirstResponder)
    {
        self.searchController.searchResultsController.view.hidden = NO;
    }
}




@end
