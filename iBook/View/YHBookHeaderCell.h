//
//  YHBookHeaderCell.h
//  iBook
//
//  Created by zikeys on 2019/12/13.
//  Copyright © 2019 zikeys. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YHBookHeaderViewModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface YHBookHeaderCell : UICollectionViewCell

- (void)setHeaderInfo:(YHBookHeaderViewModel *)headerInfo;
@end

NS_ASSUME_NONNULL_END
