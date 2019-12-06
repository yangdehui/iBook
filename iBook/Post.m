//
//  Post.m
//  iBook
//
//  Created by zikeys on 2019/12/4.
//  Copyright © 2019 zikeys. All rights reserved.
//

#import "Post.h"

@implementation Post

- (instancetype)initWithUsername:(NSString *)username
                        comments:(NSArray<NSString *> *)comments {
    if (self = [super init]) {
        _username = [username copy];
        _comments = [comments copy];
    }
    return self;
}

#pragma mark - IGListDiffable

- (id<NSObject>)diffIdentifier {
    return self;
}

- (BOOL)isEqualToDiffableObject:(id)object {
    // since the diff identifier returns self, object should only be compared with same instance
    return self == object;
}

@end
