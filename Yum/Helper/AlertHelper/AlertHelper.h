//
//  AlertHelper.h
//  BaseProduct
//
//  Created by zhangyi on 2017/11/21.
//  Copyright © 2017年 zhangyi. All rights reserved.
//

#import <Foundation/Foundation.h>

#define DIS_TIME 1.0            //提示框自动消失时间

typedef void(^AlertSureClickBlock)(void);

@interface AlertHelper : NSObject

/**
 全局提示弹框
 
 @param text 提示内容
 */
+ (void)showAlertViewWithText:(NSString *)text;


/**
 全局提示,包含确定，取消按钮，回调
 
 @param message 提示信息
 @param sureBlock 回调
 */
+ (void)showAlertViewTwoButWithMessage:(NSString *)message sureBlock:(AlertSureClickBlock)sureBlock;




@end
