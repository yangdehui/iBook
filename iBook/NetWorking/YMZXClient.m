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
        !fail ?: fail(error);
    }];
}

- (void)getBookShortReviewWithBookId:(NSString *)bookId pageCount:(NSInteger)pageCount success:(void (^)(YHBookReviewResponse * _Nonnull))success fail:(void (^)(NSError * _Nonnull))fail {
    NSInteger limitCount = pageCount == 0 ? 20 : 20*pageCount;
    NSInteger startCount = pageCount == 0 ? 0 : 20*(pageCount - 1);
    //sortType:(lastUpdated | newest | mostlike), //排序方式
    NSString *api = [NSString stringWithFormat:@"/post/short-review?book=%@&sortType=mostlike&start=%ld&limit=%ld",bookId,startCount,limitCount];
    [self.manager GET:api parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        YHBookReviewResponse *reviewModel = [YHBookReviewResponse modelWithJSON:responseObject];
        if (reviewModel.ok) {
            !success ?: success(reviewModel);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        !fail ?: fail(error);
    }];
}

- (void)getBooksWithRecommend:(NSString *)bookId success:(void (^)(NSArray<YHBookInfoModel *> * _Nonnull))success fail:(void (^)(NSError * _Nonnull))fail {
    
    NSString *api = [NSString stringWithFormat:@"/book/%@/recommend",bookId];
    [self.manager GET:api parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        YHBookRecommendResponse *model = [YHBookRecommendResponse modelWithJSON:responseObject];
        if (model.ok) {
            !success ?: success(model.books);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        !fail ?: fail(error);
    }];
}

@end
