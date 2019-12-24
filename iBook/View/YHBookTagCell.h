//
//  YHBookTagCell.h
//  iBook
//
//  Created by zikeys on 2019/12/17.
//  Copyright © 2019 zikeys. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YHBookTagsViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface YHBookTagCell : UICollectionViewCell

- (void)setTagsModel:(YHBookTagsViewModel *)tagsModel index:(NSInteger)index;

+(CGFloat)textWidth:(NSString *)text width:(CGFloat)width;

@end

NS_ASSUME_NONNULL_END
