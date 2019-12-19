//
//  YHBookReviewModel.m
//  iBook
//
//  Created by dehui on 2019/12/17.
//  Copyright © 2019 zikeys. All rights reserved.
//

#import "YHBookReviewModel.h"

@implementation YHBookReviewResponse

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"reviews" : @"docs"};
}

- (BOOL)modelCustomTransformFromDictionary:(NSDictionary *)dic {
    
    _reviews = [NSArray modelArrayWithClass:YHBookReviewModel.class json:dic[@"docs"]];
    return YES;
}

@end


@implementation YHBookReviewModel

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"reviewId" : @"_id",
             @"userId" : @"author._id",
             @"nickname" : @"author.nickname",
             @"avatar" : @"author.avatar"};
}

- (BOOL)modelCustomTransformFromDictionary:(NSDictionary *)dic {
    
    return YES;
}

- (NSString *)avatar {
    return [NSString stringWithFormat:@"http://api.zhuishushenqi.com%@",_avatar];
}

@end

