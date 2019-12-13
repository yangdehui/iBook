//
//  YMHTTPSessionManager.m
//  ZXIMChat
//
//  Created by ooxx on 2019/6/5.
//  Copyright © 2019 zikeys. All rights reserved.
//

#import "YMHTTPSessionManager.h"
#import "YMJSONResponseSerializer.h"

@implementation YMHTTPSessionManager

- (NSURLSessionDataTask *)GET:(NSString *)URLString
                   parameters:(id)parameters
                     progress:(void (^)(NSProgress * _Nonnull))downloadProgress
                      success:(void (^)(NSURLSessionDataTask * _Nonnull, id _Nullable))success
                      failure:(void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull))failure{
    
//    void (^sblock)(NSURLSessionDataTask * task, YMResponse *response) = ^(NSURLSessionDataTask * task, YMResponse *response){
//
//        success(task, response);
//    };
    void (^sblock)(NSURLSessionDataTask * task, id response) = ^(NSURLSessionDataTask * task, id response){
        
        success(task, response);
    };

    void (^fblock)(NSURLSessionDataTask * task, NSError *error) = ^(NSURLSessionDataTask * task, NSError *error){
        if (error.code == -1004) {
            //未连接服务器
        }
        
        failure(task, error);
    };
    return [super GET:URLString parameters:parameters progress:downloadProgress success:sblock failure:fblock];
}

- (NSURLSessionDataTask *)POST:(NSString *)URLString
                    parameters:(id)parameters
                      progress:(void (^)(NSProgress * _Nonnull))uploadProgress
                       success:(void (^)(NSURLSessionDataTask * _Nonnull, id _Nullable))success
                       failure:(void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull))failure{
    
    void (^sblock)(NSURLSessionDataTask * task, YMResponse *response) = ^(NSURLSessionDataTask * task, YMResponse *response){
        if(response.type == 0){
            NSError *error = [NSError errorWithDomain:@"" code:-1 userInfo:@{NSLocalizedDescriptionKey : response.message}];
            failure(task,error);
        }else{
            success(task, response);
        }
    };
    return [super POST:URLString parameters:parameters progress:uploadProgress success:sblock failure:failure];
}

- (NSURLSessionDataTask *)POST:(NSString *)URLString
                    parameters:(id)parameters
     constructingBodyWithBlock:(void (^)(id <AFMultipartFormData> formData))block
                      progress:(nullable void (^)(NSProgress * _Nonnull))uploadProgress
                       success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                       failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure{
    
    void (^sblock)(NSURLSessionDataTask * task, YMResponse *response) = ^(NSURLSessionDataTask * task, YMResponse *response){
        if(response.type == 0){
            NSError *error = [NSError errorWithDomain:@"" code:-1 userInfo:@{NSLocalizedDescriptionKey : response.message}];
            failure(task,error);
        }else{
            success(task, response);
        }
    };
    return [super POST:URLString parameters:parameters constructingBodyWithBlock:block progress:uploadProgress success:sblock failure:failure];
}
@end
