//
//  YHBookInfoReviewContentCell.h
//  iBook
//
//  Created by zikeys on 2019/12/18.
//  Copyright © 2019 zikeys. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YHBookReviewViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface YHBookInfoReviewContentCell : UICollectionViewCell
- (void)setReviewViewModels:(NSArray <YHBookReviewModel *>*)reviewViewModels;
@end

NS_ASSUME_NONNULL_END
