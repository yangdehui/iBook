//
//  YHBookReviewViewModel.m
//  iBook
//
//  Created by zikeys on 2019/12/19.
//  Copyright © 2019 zikeys. All rights reserved.
//

#import "YHBookReviewViewModel.h"

@implementation YHBookReviewViewModel

- (instancetype)initWithLeftHeader:(NSString *)leftTitle rightHeader:(NSString *)rightTitle rightIcon:(NSString *)rightIcon footerTitle:(NSString *)footerTitle reviews:(NSArray<YHBookReviewModel *> *)reviews sort:(NSInteger)sort {
    if (self = [super init]) {
        self.leftTitle = [leftTitle copy];
        self.rightTitle = [rightTitle copy];
        self.rightIcon = [rightIcon copy];
        self.footerTitle = [footerTitle copy];
        self.reviewArray = [reviews copy];
        self.sort = sort;
    }
    return self;
}

#pragma mark - IGListDiffable
- (id<NSObject>)diffIdentifier {
    return self;
}

- (BOOL)isEqualToDiffableObject:(id)object {
    return self == object;
}
@end
