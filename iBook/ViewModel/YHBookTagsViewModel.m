//
//  YHBookTagsViewModel.m
//  iBook
//
//  Created by zikeys on 2019/12/19.
//  Copyright © 2019 zikeys. All rights reserved.
//

#import "YHBookTagsViewModel.h"

@implementation YHBookTagsViewModel

- (instancetype)initWithBookInfo:(YHBookInfoModel *)bookInfo sort:(NSInteger)sort {
    self = [super init];
    if (self) {
        _tagsArray = [bookInfo.tags copy];
        _sort = sort;
    }
    return self;
}

- (UIColor *)tagColorWithIndex:(NSInteger)index {
    
    UIColor *color = [@[UIColor.flatPurpleColor,
                        UIColor.flatTealColor,
                        UIColor.flatBlueColor,
                        UIColor.flatYellowColor].mutableCopy objectAtIndex:index%4];
    return color;
}
#pragma mark - IGListDiffable
- (id<NSObject>)diffIdentifier {
    return self;
}

- (BOOL)isEqualToDiffableObject:(id)object {
    return self == object;
}
@end
