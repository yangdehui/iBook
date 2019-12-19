//
//  YHBookHeaderViewModel.m
//  iBook
//
//  Created by zikeys on 2019/12/19.
//  Copyright © 2019 zikeys. All rights reserved.
//

#import "YHBookHeaderViewModel.h"

@implementation YHBookHeaderViewModel

- (instancetype)initWithBookInfo:(YHBookInfoModel *)bookInfo sort:(NSInteger)sort {
    self = [super init];
    if (self) {
        _coverUrl = [bookInfo.cover copy];
        _title = [bookInfo.title copy];
        _author = [bookInfo.author copy];
        _longIntro = [bookInfo.longIntro copy];
        _wordCount = bookInfo.wordCount;
        _chaptersCount = bookInfo.chaptersCount;
        _sort = sort;
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
