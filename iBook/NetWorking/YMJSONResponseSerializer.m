//
//  YMJSONResponseSerializer.m
//  NewWoring
//
//  Created by ooxx on 2019/6/1.
//  Copyright © 2019 ooxx. All rights reserved.
//

#import "YMJSONResponseSerializer.h"

@implementation YMResponse

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"type" : @"errorCode", @"message" : @"errorMessage"};
}

@end

@implementation YMJSONResponseSerializer
- (instancetype)init{
    self = [super init];
    if (self) {
        NSMutableSet *mset = self.acceptableContentTypes.mutableCopy;
        [mset addObject:@"text/html"];
        self.acceptableContentTypes = mset;
    }
    return self;
}

- (id)responseObjectForResponse:(NSURLResponse *)response
                           data:(NSData *)data
                          error:(NSError *__autoreleasing *)error{
    
    NSData *responseData = [super responseObjectForResponse:response data:data error:error];
    
    NSError *serializationError = nil;
    
    NSMutableDictionary *responseObject = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableContainers error:&serializationError];
    
    if (responseObject) {
        YMResponse *respones = [YMResponse modelWithJSON:responseObject];
        
        return respones;
    }else{
    
        *error = [NSError errorWithDomain:@"YMJSONResponseSerializerError" code:-1 userInfo:@{NSLocalizedDescriptionKey : @"响应序列化失败"}];
        return nil;
    }
}
@end
