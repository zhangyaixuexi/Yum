//
//  AlertHelper.m
//  BaseProduct
//
//  Created by zhangyi on 2017/11/21.
//  Copyright © 2017年 zhangyi. All rights reserved.
//

#import "AlertHelper.h"

@implementation AlertHelper


/**
 全局提示弹框
 
 @param text 提示内容
 */
+ (void)showAlertViewWithText:(NSString *)text
{
    UIAlertController  * alertController = [UIAlertController alertControllerWithTitle:nil message:text preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction * sureAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alertController addAction:sureAction];
    [[AppDelegate getCurrentVC] presentViewController:alertController animated:YES completion:nil];
}


/**
 全局提示,包含确定，取消按钮，回调
 
 @param message 提示信息
 @param sureBlock 回调
 */
+ (void)showAlertViewTwoButWithMessage:(NSString *)message sureBlock:(AlertSureClickBlock)sureBlock
{
    UIAlertController  * alertController = [UIAlertController alertControllerWithTitle:nil message:message preferredStyle:UIAlertControllerStyleAlert];
    NSString * resultTitle = @"确定";
    UIAlertAction * sureAction = [UIAlertAction actionWithTitle:resultTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (sureBlock) {
            sureBlock();
        }
    }];
    UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [alertController addAction:sureAction];
    [alertController addAction:cancelAction];
    
    [[AppDelegate getCurrentVC] presentViewController:alertController animated:YES completion:nil];
}



@end
