//
//  NSString+Extension.h
//  DKusedCar
//
//  Created by li on 2018/5/27.
//  Copyright © 2018年 danke. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Extension)

- (NSString *)md5String;
- (NSDictionary *)parseUrlParams;
+(NSString *)notRounding:(float)price afterPoint:(int)position;
+ (NSString *)formatDouble:(double)d;
+(NSString*)md5UrlWithKey:(NSString*)key urlStr:(NSString*)urlStr;
+(NSString*)md5UrlWithKey:(NSString*)key params:(NSDictionary*)params;
@end
