//
//  YMZXClient.m
//  NewWoring
//
//  Created by ooxx on 2019/6/1.
//  Copyright © 2019 ooxx. All rights reserved.
//

#import "YMZXClient.h"
#import "YMJSONResponseSerializer.h"
#import "YMHTTPRequestSerializer.h"
#import "YMHTTPSessionManager.h"
#import <AFNetworking.h>


@interface YMZXClient()
@property(nonatomic, strong) YMHTTPSessionManager *manager;
@end

@implementation YMZXClient
+(instancetype)sharedClient {
    static YMZXClient *sharedClient;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedClient = YMZXClient.new;
        sharedClient.manager = [[YMHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:BaseURL]];
        sharedClient.manager.requestSerializer = YMHTTPRequestSerializer.new;
        sharedClient.manager.requestSerializer.timeoutInterval = 5;
        sharedClient.manager.responseSerializer = YMJSONResponseSerializer.new;
    });
    return sharedClient;
}

- (void)getBookInfoWithBookId:(NSString *)bookId success:(void (^)(YHBookInfoModel * _Nonnull))success fail:(void (^)(NSError * _Nonnull))fail {
    
    NSString *api = [NSString stringWithFormat:@"/book/%@",bookId];
    [self.manager GET:api parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        YHBookInfoModel *model = [YHBookInfoModel modelWithJSON:responseObject];
        !success ?: success(model);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

@end
