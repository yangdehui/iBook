//
//  YMHTTPRequestSerializer.m
//  NewWoring
//
//  Created by ooxx on 2019/6/1.
//  Copyright © 2019 ooxx. All rights reserved.
//

#import "YMHTTPRequestSerializer.h"
#import "NetworkHelper.h"

@implementation YMHTTPRequestSerializer
-(NSMutableURLRequest *)requestWithMethod:(NSString *)method URLString:(NSString *)URLString parameters:(id)parameters error:(NSError *__autoreleasing  _Nullable *)error{
    if ([NetworkHelper networkStatus] == NotReachable) {
//        dispatch_async(dispatch_get_main_queue(),^{
//            [HUDHelper showText:@"已与网络断开连接,请求失败"];
//        });
//        *error = [NSError errorWithDomain:@"NotReachable" code:-1 userInfo:@{NSLocalizedDescriptionKey : @"与网络断开连接,请求失败"}];
    }
    return [super requestWithMethod:method URLString:URLString parameters:parameters error:error];
}
@end
