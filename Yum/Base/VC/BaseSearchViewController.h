//
//  BaseSearchViewController.h
//  BaseProduct
//
//  Created by zhangyi on 2017/9/30.
//  Copyright © 2017年 zhangyi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseSearchViewController : BaseTableViewController

@property (nonatomic, strong) UISearchController    * searchController;

@property (nonatomic, strong) UIViewController      * resultVC;

@end
