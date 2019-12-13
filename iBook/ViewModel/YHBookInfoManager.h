//
//  YHBookInfoManager.h
//  iBook
//
//  Created by zikeys on 2019/12/13.
//  Copyright © 2019 zikeys. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YHBookInfoManager : NSObject

- (instancetype)initWithBookId:(NSString *)bookId;

- (void)configBookInfoDataSoure:(void (^)(NSArray<id<IGListDiffable>> *data))success fail:(void (^)(NSError *error))fail;


@end

NS_ASSUME_NONNULL_END
