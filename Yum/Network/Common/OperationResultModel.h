//
//  OperationResultModel.h
//  BaseProduct
//
//  Created by zhangyi on 2018/3/13.
//  Copyright © 2018年 zhangyi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OperationResultModel : NSObject

@property (nonatomic, assign) NSInteger     statusCode;
@property (nonatomic, copy) NSString        * message;

@end
