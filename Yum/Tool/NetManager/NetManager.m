//
//  NetManager.m
//  BaseProduct
//
//  Created by zhangyi on 2018/1/19.
//  Copyright © 2018年 zhangyi. All rights reserved.
//

#import "NetManager.h"
#import <AFNetworking.h>

@interface NetManager ()

@property (nonatomic, strong) AFHTTPSessionManager          * manager;

@end

@implementation NetManager

+ (NetManager *)shareManager
{
    static NetManager * netManager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        netManager = [[NetManager alloc] init];
        [netManager monitorNetworkChanged];
    });
    return netManager;
}

#pragma mark -- getter
- (AFHTTPSessionManager *)manager
{
    if (!_manager) {
        _manager = [[AFHTTPSessionManager alloc] init];
    }
    return _manager;
}


#pragma mark -- base
- (void)accessServerWithUrl:(NSString *)url param:(NSDictionary *)param netType:(NetType)netType requestType:(NetRequestType)requestType progress:(NetProgressBlock)progress success:(NetSuccessBlock)success failure:(NetFailureBlock)failure
{
    url = [NSString stringWithFormat:@"%@%@",BASE_URL,url];
    NSLog(@"url -- %@ \n param -- %@",url,param);
    
    //请求格式
    if (requestType == NetRequestTypeJson) {
        self.manager.requestSerializer = [AFJSONRequestSerializer serializer];
    }else{
        self.manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    }
    
    switch (netType) {
        case NetTypeGet:
        {
            [self.manager GET:url parameters:param progress:^(NSProgress * _Nonnull downloadProgress) {
                if (progress) {
                    progress(downloadProgress);
                }
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                NSLog(@"task2 -- %@",self.manager.tasks);
                if (success) {
                    success(responseObject);
                }
                
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                NSLog(@"task3 -- %@",self.manager.tasks);
                if (failure) {
                    failure(error);
                }
                
            }];
            NSLog(@"task1 -- %@",self.manager.tasks);
        }
            break;
        case NetTypePost:
        {
            [self.manager POST:url parameters:param progress:^(NSProgress * _Nonnull uploadProgress) {
                if (progress) {
                    progress(uploadProgress);
                }
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                if (success) {
                    success(responseObject);
                }
                
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                if (failure) {
                    failure(error);
                }
                
            }];
        }
            break;
        case NetTypePut:
        {
            [self.manager PUT:url parameters:param success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                if (success) {
                    success(responseObject);
                }
                
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                if (failure) {
                    failure(error);
                }
                
            }];
        }
            break;
        case NetTypePatch:
        {
            [self.manager PATCH:url parameters:param success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                if (success) {
                    success(responseObject);
                }
                
                
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                if (failure) {
                    failure(error);
                }
                
            }];
        }
            break;
        case NetTypeDelete:
        {
            [self.manager DELETE:url parameters:param success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                if (success) {
                    success(responseObject);
                }
                
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                if (failure) {
                    failure(error);
                }
                
            }];
        }
            break;
        default:
            break;
    }
}

#pragma mark -- 监听网络变化
- (void)monitorNetworkChanged
{
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        
        switch (status) {
                //不知道网络情况
                case AFNetworkReachabilityStatusUnknown:
            {
                
            }
                break;
                //网络不可用
                case AFNetworkReachabilityStatusNotReachable:
            {
                
            }
                break;
                //移动网络
                case AFNetworkReachabilityStatusReachableViaWWAN:
            {
                
            }
                break;
                
                //wifi
                case AFNetworkReachabilityStatusReachableViaWiFi:
            {
                
            }
                break;
                
            default:
                break;
        }
    }];
}


#pragma mark -- 取消网络请求
//取消所有网络请求
- (void)cancelAllRequest
{
    [self.manager.tasks enumerateObjectsUsingBlock:^(NSURLSessionTask * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj cancel];
    }];
//    [self.manager.operationQueue cancelAllOperations];
}


//取消该url的所有网络请求
- (void)cancelRequestWithUrlString:(NSString *)url
{
    [self.manager.tasks enumerateObjectsUsingBlock:^(NSURLSessionTask * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj.originalRequest.URL.absoluteString isEqualToString:url]) {
            [obj cancel];
        }
    }];
}

@end
