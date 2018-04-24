//
//  PersonalCenterViewController.m
//  Yum
//
//  Created by zhangyi on 2018/4/24.
//  Copyright © 2018年 zhangyi. All rights reserved.
//

#import "PersonalCenterViewController.h"

@interface PersonalCenterViewController ()

@property (nonatomic, assign) AuthenticationType        authType;

@end

@implementation PersonalCenterViewController

- (instancetype)initWithAuthType:(AuthenticationType)authType
{
    self = [super init];
    if (self) {
        _authType = authType;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializeUserInterface];
}


- (void)initializeUserInterface
{
    
}

@end
