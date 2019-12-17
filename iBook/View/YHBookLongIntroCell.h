//
//  YHBookLongIntroCell.h
//  iBook
//
//  Created by zikeys on 2019/12/16.
//  Copyright © 2019 zikeys. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YHBookLongIntroCell : UICollectionViewCell

- (void)setLongIntro:(YHBookHeaderViewModel *)longIntro;
- (void)updateHeight:(BOOL)expanded;
@end

NS_ASSUME_NONNULL_END
