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
