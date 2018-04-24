//
//  OrderApi.m
//  BaseProduct
//
//  Created by zhangyi on 2018/3/8.
//  Copyright © 2018年 zhangyi. All rights reserved.
//

#import "OrderApi.h"

@implementation OrderApi

+ (void)getOrderListWithPage:(NSUInteger)page success:(NetSuccessListBlock)success failure:(NetFailureBlock)failure
{
    NSMutableDictionary * paramDic = [NSMutableDictionary dictionary];
    [paramDic setObject:@(page) forKey:@"page"];
    
    [NetTool getWithUrl:Order_List param:paramDic success:^(id responseObj) {
        NSArray * orderArray = [NSArray yy_modelArrayWithClass:[OrderModel class] json:responseObj];
        if (success) {
            success(orderArray);
        }
        
    } failure:failure];
}



@end
