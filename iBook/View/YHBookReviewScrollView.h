//
//  YHBookReviewScrollView.h
//  iBook
//
//  Created by zikeys on 2019/12/18.
//  Copyright © 2019 zikeys. All rights reserved.
//

#import "SDCycleScrollView.h"
#import "YHBookReviewViewModel.h"

NS_ASSUME_NONNULL_BEGIN
@interface YHBookReviewScrollCell : UICollectionViewCell
- (void)setBookReviewModel:(YHBookReviewModel *)reviewModel;
@end

@interface YHBookReviewScrollView : SDCycleScrollView<SDCycleScrollViewDelegate>

- (instancetype)initScrollViewWithFrame:(CGRect)frame reviewArray:(NSArray <YHBookReviewViewModel *>*)reviewArray;
- (void)setReviewViewModels:(NSArray <YHBookReviewModel *>*)reviewViewModels;
@end

NS_ASSUME_NONNULL_END
