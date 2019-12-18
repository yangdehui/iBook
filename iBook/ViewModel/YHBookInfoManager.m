//
//  YHBookInfoManager.m
//  iBook
//
//  Created by zikeys on 2019/12/13.
//  Copyright © 2019 zikeys. All rights reserved.
//

#import "YHBookInfoManager.h"

@interface YHBookInfoManager ()

@property (nonatomic, copy) NSString *bookId;

@end

@implementation YHBookInfoManager

- (instancetype)initWithBookId:(NSString *)bookId {
    
    self = [super init];
    if (self) {
        self.bookId = [bookId copy];
    }
    return self;
}

- (void)configBookInfoDataSoure:(void (^)(NSArray<id<IGListDiffable>> * _Nonnull))success fail:(void (^)(NSError * _Nonnull))fail {
    
    __block BOOL info = false;
    __block BOOL review = false;
    __block BOOL recommend = false;
    NSMutableArray *mutableArray = [[NSMutableArray alloc] init];
    dispatch_group_t group = dispatch_group_create();
    dispatch_group_enter(group);
    dispatch_group_enter(group);
    dispatch_group_enter(group);
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        if (info && review) {
            
            !success ?: success(mutableArray);
        }else{
        
        }
    });
    
    [YMZXClient.sharedClient getBookInfoWithBookId:_bookId success:^(YHBookInfoModel * _Nonnull bookInfo) {
        
        [mutableArray insertObject:[[YHBookTagsViewModel alloc] initWithBookInfo:bookInfo] atIndex:0];
        [mutableArray insertObject:[[YHBookHeaderViewModel alloc] initWithBookInfo:bookInfo] atIndex:0];
        info = true;
        dispatch_group_leave(group);
    } fail:^(NSError * _Nonnull error) {
        dispatch_group_leave(group);
    }];
    
    [YMZXClient.sharedClient getBookShortReviewWithBookId:_bookId pageCount:1 success:^(YHBookReviewResponse * _Nonnull reviewModel) {
        
        [mutableArray addObject:reviewModel];
        review = true;
        dispatch_group_leave(group);
    } fail:^(NSError * _Nonnull error) {
        dispatch_group_leave(group);
    }];
    
    [YMZXClient.sharedClient getBooksWithRecommend:_bookId success:^(NSArray<YHBookInfoModel *> * _Nonnull bookArray) {
        
        recommend = true;
        dispatch_group_leave(group);
    } fail:^(NSError * _Nonnull error) {
        dispatch_group_leave(group);
    }];

}



@end
