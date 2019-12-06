//
//  Post.h
//  iBook
//
//  Created by zikeys on 2019/12/4.
//  Copyright © 2019 zikeys. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <IGListDiffKit/IGListDiffable.h>

NS_ASSUME_NONNULL_BEGIN

@interface Post : NSObject <IGListDiffable>

@property (nonatomic, strong, readonly) NSString *username;
@property (nonatomic, strong, readonly) NSArray<NSString *> *comments;

- (instancetype)initWithUsername:(NSString *)username
                        comments:(NSArray<NSString *> *)comments NS_DESIGNATED_INITIALIZER;

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
