//
//  YHBookInfoSectionHeaderCell.h
//  iBook
//
//  Created by zikeys on 2019/12/19.
//  Copyright © 2019 zikeys. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YHBookInfoSectionHeaderCell : UICollectionViewCell
- (void)setLeftTitle:(NSString *)title;

- (void)setRightButton:(NSString *)title icon:(NSString *)icon;

- (void)setLineHidden;
@end

NS_ASSUME_NONNULL_END
