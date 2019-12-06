//
//  YMZXClient.h
//  NewWoring
//
//  Created by ooxx on 2019/6/1.
//  Copyright © 2019 ooxx. All rights reserved.
//

#import <Foundation/Foundation.h>

#define BaseURL @"http://novel.juhe.im/"

NS_ASSUME_NONNULL_BEGIN

@interface YMZXClient : NSObject

+(instancetype)sharedClient;

- (void)getCategories;

- (void)getSubCategories;

@end

NS_ASSUME_NONNULL_END
