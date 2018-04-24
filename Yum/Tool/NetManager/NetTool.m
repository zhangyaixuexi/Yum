//
//  NetTool.m
//  BaseProduct
//
//  Created by zhangyi on 2018/1/19.
//  Copyright © 2018年 zhangyi. All rights reserved.
//

#import "NetTool.h"

@implementation NetTool

//get
+ (void)getWithUrl:(NSString *)url param:(NSDictionary *)param success:(NetSuccessBlock)success failure:(NetFailureBlock)failure
{
    [[NetManager shareManager] accessServerWithUrl:url param:param netType:NetTypeGet requestType:NetRequestTypeNone progress:nil success:success failure:failure];
}

//post
+ (void)postWithUrl:(NSString *)url param:(NSDictionary *)param success:(NetSuccessBlock)success failure:(NetFailureBlock)failure
{
    [[NetManager shareManager] accessServerWithUrl:url param:param netType:NetTypePost requestType:NetRequestTypeNone progress:nil success:success failure:failure];
}

//put
+ (void)putWithUrl:(NSString *)url param:(NSDictionary *)param success:(NetSuccessBlock)success failure:(NetFailureBlock)failure
{
    [[NetManager shareManager] accessServerWithUrl:url param:param netType:NetTypePut requestType:NetRequestTypeNone progress:nil success:success failure:failure];
}

//delete
+ (void)deleteWithUrl:(NSString *)url param:(NSDictionary *)param success:(NetSuccessBlock)success failure:(NetFailureBlock)failure
{
    [[NetManager shareManager] accessServerWithUrl:url param:param netType:NetTypeDelete requestType:NetRequestTypeNone progress:nil success:success failure:failure];
}

//patch 
+ (void)patchWithUrl:(NSString *)url param:(NSDictionary *)param success:(NetSuccessBlock)success failure:(NetFailureBlock)failure
{
    [[NetManager shareManager] accessServerWithUrl:url param:param netType:NetTypePatch requestType:NetRequestTypeNone progress:nil success:success failure:failure];
}



@end
