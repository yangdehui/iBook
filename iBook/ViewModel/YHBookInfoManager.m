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
    
    [YMZXClient.sharedClient getBookInfoWithBookId:_bookId success:^(YHBookInfoModel * _Nonnull bookInfo) {
        
        NSArray *array = @[bookInfo];
        !success ?: success(array);
    } fail:fail];
}
@end
