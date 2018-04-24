//
//  OrderApi.h
//  BaseProduct
//
//  Created by zhangyi on 2018/3/8.
//  Copyright © 2018年 zhangyi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OrderModel.h"

@interface OrderApi : NSObject

+ (void)getOrderListWithPage:(NSUInteger)page success:(NetSuccessListBlock)success failure:(NetFailureBlock)failure;

@end
