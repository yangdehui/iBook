//
//  YMZXClient.h
//  NewWoring
//
//  Created by ooxx on 2019/6/1.
//  Copyright © 2019 ooxx. All rights reserved.
//

#import <Foundation/Foundation.h>

#define BaseURL @"http://101.201.72.32:80/"
//#define BaseURL @"http://121.194.117.77:8800/"

NS_ASSUME_NONNULL_BEGIN

@interface YMZXClient : NSObject

+(instancetype)sharedClient;

@end

NS_ASSUME_NONNULL_END
