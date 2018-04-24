//
//  NetTool.h
//  BaseProduct
//
//  Created by zhangyi on 2018/1/19.
//  Copyright © 2018年 zhangyi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetTool : NSObject


//get
+ (void)getWithUrl:(NSString *)url param:(NSDictionary *)param success:(NetSuccessBlock)success failure:(NetFailureBlock)failure;

//post
+ (void)postWithUrl:(NSString *)url param:(NSDictionary *)param success:(NetSuccessBlock)success failure:(NetFailureBlock)failure;

//put
+ (void)putWithUrl:(NSString *)url param:(NSDictionary *)param success:(NetSuccessBlock)success failure:(NetFailureBlock)failure;

//delete
+ (void)deleteWithUrl:(NSString *)url param:(NSDictionary *)param success:(NetSuccessBlock)success failure:(NetFailureBlock)failure;

//patch
+ (void)patchWithUrl:(NSString *)url param:(NSDictionary *)param success:(NetSuccessBlock)success failure:(NetFailureBlock)failure;


@end
