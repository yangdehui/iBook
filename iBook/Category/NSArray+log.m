//
//  NSArray+log.m
//  DKusedCar
//
//  Created by li on 2018/5/27.
//  Copyright © 2018年 danke. All rights reserved.
//

#import "NSArray+log.h"

@implementation NSArray (log)
/// 打印数组和字典时会自动调用这个方法,不需要导入头文件
- (NSString *)descriptionWithLocale:(id)locale
{
    
    NSMutableString *stringM = [NSMutableString string];
    
    [stringM appendString:@"(\n"];
    
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [stringM appendFormat:@"\t%@,\n",obj];
    }];
    
    [stringM appendString:@")\n"];
    
    return stringM;
}
@end
@implementation NSDictionary (Log)

- (NSString *)descriptionWithLocale:(id)locale
{
    
    NSMutableString *stringM = [NSMutableString string];
    
    [stringM appendString:@"{\n"];
    
    [self enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        [stringM appendFormat:@"\t%@ = %@;\n",key,obj];
    }];
    
    [stringM appendString:@"}\n"];
    
    return stringM;
}

@end
