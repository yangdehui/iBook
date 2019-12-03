//
//  NSString+Extension.m
//  DKusedCar
//
//  Created by li on 2018/5/27.
//  Copyright © 2018年 danke. All rights reserved.
//

#import "NSString+Extension.h"
#import "NSData+Extension.h"

@implementation NSString (Extension)

- (NSString *)md5String {
    return [[self dataUsingEncoding:NSUTF8StringEncoding] md5String];
}

- (NSDictionary *)parseUrlParams
{
    NSArray *components = [self componentsSeparatedByString:@"&"];
    NSMutableDictionary *result = [NSMutableDictionary dictionaryWithCapacity:[components count]];
    
    NSUInteger i;
    for (i = 0; i < [components count]; i++)
    {
        NSString *component = [components objectAtIndex:i];
        if ([component length] > 0)
        {
            NSRange range = [component rangeOfString:@"="];
            if (range.location != NSNotFound)
            {
                NSString *escapedKey = [component substringToIndex:(range.location + 0)];
                NSString *escapedValue = [component substringFromIndex:(range.location + 1)];
                
                if ([escapedKey length] > 0)
                {
                    CFStringRef k, v;
                    
                    k = CFURLCreateStringByReplacingPercentEscapes(NULL, (__bridge CFStringRef)escapedKey, CFSTR(""));
                    v = CFURLCreateStringByReplacingPercentEscapes(NULL, (__bridge CFStringRef)escapedValue, CFSTR(""));
                    
                    NSString *key, *value;
                    
                    key   = (__bridge  NSString *)k;
                    value = ( NSString *)CFBridgingRelease(v);
                    
                    if (key)
                    {
                        if (value)
                            [result setObject:value forKey:key];
                        else
                            [result setObject:[NSNull null] forKey:key];
                    }
                }
            }
        }
    }
    
    return result;
}

+(NSString *)notRounding:(float)price afterPoint:(int)position{
    return [[[NSString alloc]init] notRounding:price afterPoint:position];;
}

//如何只舍不入。比如 float price = 0.126，怎么样才能得到0.12？
-(NSString *)notRounding:(float)price afterPoint:(int)position{
    
    NSDecimalNumberHandler* roundingBehavior = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundDown scale:position raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:NO];
    
    NSDecimalNumber *ouncesDecimal;
    
    NSDecimalNumber *roundedOunces;
    ouncesDecimal = [[NSDecimalNumber alloc] initWithFloat:price];
    
    roundedOunces = [ouncesDecimal decimalNumberByRoundingAccordingToBehavior:roundingBehavior];
    
    return [NSString stringWithFormat:@"%@",roundedOunces];
}

+ (NSString *)formatDouble:(double)d
{
    if (fmodl(d, 1)==0) {//如果有一位小数点
        return [NSString stringWithFormat:@"%.0lf",d];
    } else if (fmodl(d*10, 1)==0) {//如果有两位小数点
        return [NSString stringWithFormat:@"%.1lf",d];
    } else {
        return [NSString notRounding:d afterPoint:1];
    }
    
}

+(NSString*)md5UrlWithKey:(NSString*)key params:(NSDictionary*)params{
    NSArray *keys = [params allKeys];
    NSMutableDictionary*dict=  [params mutableCopy];
    NSMutableString *contentString  =[NSMutableString string];
    //按字母顺序排序
    NSArray *sortedArray = [keys sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        return [obj1 compare:obj2 options:NSCaseInsensitiveSearch|NSNumericSearch|
                NSWidthInsensitiveSearch|NSForcedOrderingSearch];
    }];
    //拼接字符串
    for (NSString *categoryId in sortedArray) {
        if (![categoryId isEqualToString:@"sign"]){
            if ([[dict valueForKey:categoryId] length] > 0) {
                [contentString appendFormat:@"%@=%@&", categoryId,[dict valueForKey:categoryId]];
            }
        }
    }
    [contentString appendFormat:@"key=%@",key];
    NSString *md5str=[[contentString md5String] uppercaseString];
    
    return md5str;
}

+(NSString*)md5UrlWithKey:(NSString*)key urlStr:(NSString*)urlStr{
    
    NSArray * tepArray2 = [urlStr componentsSeparatedByString:@"?"];
    NSMutableDictionary*dict=  [[[tepArray2 lastObject] parseUrlParams] mutableCopy];
    NSMutableString *contentString  =[NSMutableString string];
    NSArray *keys = [dict allKeys];
    //按字母顺序排序
    NSArray *sortedArray = [keys sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        return [obj1 compare:obj2 options:NSCaseInsensitiveSearch|NSNumericSearch|
                NSWidthInsensitiveSearch|NSForcedOrderingSearch];
    }];
    //拼接字符串
    for (NSString *categoryId in sortedArray) {
        if (![categoryId isEqualToString:@"sign"]&&![categoryId isEqualToString:@"statId"]){
            if ([[dict valueForKey:categoryId] length]>0) {
                [contentString appendFormat:@"%@=%@&", categoryId, [dict valueForKey:categoryId]];
            }
        }
    }
    NSMutableString *useStr=[contentString mutableCopy];
    [contentString appendFormat:@"key=%@",key];
    NSString *md5str=[[contentString md5String] uppercaseString];
    [useStr appendFormat:@"sign=%@",md5str];
    urlStr= [[tepArray2 firstObject] stringByAppendingString:[NSString stringWithFormat:@"?%@",useStr]];
    return urlStr;
}
@end
