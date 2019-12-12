//
//  YMZXClient.h
//  NewWoring
//
//  Created by ooxx on 2019/6/1.
//  Copyright © 2019 ooxx. All rights reserved.
//

#import <Foundation/Foundation.h>

#define BaseURL @"http://api.zhuishushenqi.com"

NS_ASSUME_NONNULL_BEGIN

@interface YMZXClient : NSObject

+(instancetype)sharedClient;

- (void)getBookInfoWithBookId:(NSString *)bookId success:(void (^)(NSString *string))success fail:(void (^)(NSError *error))fail;

@end

NS_ASSUME_NONNULL_END
