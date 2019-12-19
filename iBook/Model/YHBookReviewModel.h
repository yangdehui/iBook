//
//  YHBookReviewModel.h
//  iBook
//
//  Created by dehui on 2019/12/17.
//  Copyright © 2019 zikeys. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class YHBookReviewModel;
@interface YHBookReviewResponse : NSObject<IGListDiffable>

@property (nonatomic, assign) NSInteger today;

@property (nonatomic, copy) NSArray <YHBookReviewModel *>*reviews;

@property (nonatomic, assign) BOOL ok;

@end

@interface YHBookReviewModel : NSObject

@property (nonatomic, copy) NSString *reviewId;

@property (nonatomic, assign) NSInteger rating;

@property (nonatomic, copy) NSString *userId;

@property (nonatomic, copy) NSString *nickname;

@property (nonatomic, copy) NSString *avatar;

@property (nonatomic, assign) NSInteger likeCount;

@property (nonatomic, copy) NSString *content;

@property (nonatomic, copy) NSString *created;

@end

NS_ASSUME_NONNULL_END
