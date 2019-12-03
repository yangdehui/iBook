//
//  YMJSONResponseSerializer.h
//  NewWoring
//
//  Created by ooxx on 2019/6/1.
//  Copyright © 2019 ooxx. All rights reserved.
//

#import <AFNetworking.h>

NS_ASSUME_NONNULL_BEGIN

@interface YMResponse : NSObject
@property (nonatomic, assign) NSInteger type;
@property (nonatomic, copy) NSString *message;
@end

@interface YMJSONResponseSerializer : AFHTTPResponseSerializer

@end

NS_ASSUME_NONNULL_END
