//
//  NetManager.h
//  BaseProduct
//
//  Created by zhangyi on 2018/1/19.
//  Copyright © 2018年 zhangyi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetManager : NSObject

/**
 请求方式
 */
typedef NS_ENUM(NSInteger,NetType)
{
    NetTypeGet = 0,
    NetTypePost,
    NetTypePut,
    NetTypeDelete,
    NetTypePatch
};

/**
 请求格式
 
 - RequestTypeNone: 默认表单
 - RequestTypeJson: json串
 */
typedef NS_ENUM(NSInteger,NetRequestType)
{
    NetRequestTypeNone = 0,
    NetRequestTypeJson
};

typedef void(^NetSuccessBlock)(id responseObj);
typedef void(^NetSuccessListBlock)(NSArray * dataArray);
typedef void(^NetSuccessOptionBlock)(NSArray * dataArray);

typedef void(^NetFailureBlock)(NSError * error);
typedef void(^NetFailureCustomBlock)(int errorCode,NSString * errorMsg);

typedef void(^NetProgressBlock)(NSProgress * progress);




+ (NetManager *)shareManager;

#pragma mark -- base
- (void)accessServerWithUrl:(NSString *)url param:(NSDictionary *)param netType:(NetType)netType requestType:(NetRequestType)requestType progress:(NetProgressBlock)progress success:(NetSuccessBlock)success failure:(NetFailureBlock)failure;

@end
