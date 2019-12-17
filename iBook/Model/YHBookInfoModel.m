//
//  YHBookInfoModel.m
//  iBook
//
//  Created by zikeys on 2019/12/12.
//  Copyright © 2019 zikeys. All rights reserved.
//

#import "YHBookInfoModel.h"

@implementation YHBookInfoModel

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"bookId" : @"_id",
             @"ratingCount" : @"rating.count"
             };
}

- (NSString *)cover {
    NSString *str = [_cover stringByRemovingPercentEncoding];
    if ([str containsString:@"/agent/"]) {
        str = [str stringByReplacingOccurrencesOfString:@"/agent/" withString:@""];
    }
    return str;
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


@implementation YHBookHeaderViewModel

- (instancetype)initWithBookInfo:(YHBookInfoModel *)bookInfo {
    self = [super init];
    if (self) {
        _coverUrl = [bookInfo.cover copy];
        _title = [bookInfo.title copy];
        _author = [bookInfo.author copy];
        _longIntro = [bookInfo.longIntro copy];
        _wordCount = bookInfo.wordCount;
        _chaptersCount = bookInfo.chaptersCount;
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


@implementation YHBookTagsViewModel

- (instancetype)initWithBookInfo:(YHBookInfoModel *)bookInfo {
    self = [super init];
    if (self) {
        _tagsArray = [bookInfo.tags copy];
    }
    return self;
}

- (UIColor *)tagColorWithIndex:(NSInteger)index {
    
    UIColor *color = [@[UIColor.flatRedColor,
                        UIColor.flatGreenColor,
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
