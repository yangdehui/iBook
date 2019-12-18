//
//  YHBookRecommendViewModel.m
//  iBook
//
//  Created by zikeys on 2019/12/18.
//  Copyright © 2019 zikeys. All rights reserved.
//

#import "YHBookRecommendViewModel.h"

@implementation YHBookRecommendViewModel

- (instancetype)initWithHeader:(NSString *)header footer:(NSString *)footer icon:(NSString *)icon books:(NSArray<YHBookInfoModel *> *)books {
    if (self = [super init]) {
        self.header = header;
        self.footer = footer;
        self.footerIcon = icon;
        self.bookInfoArray = books;
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
