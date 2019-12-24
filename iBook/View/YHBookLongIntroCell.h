//
//  YHBookLongIntroCell.h
//  iBook
//
//  Created by zikeys on 2019/12/16.
//  Copyright © 2019 zikeys. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YHBookHeaderViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface YHBookLongIntroCell : UICollectionViewCell

@property (nonatomic, assign) NSInteger numberOfLines;

@property (nonatomic, strong) YHBookHeaderViewModel *longIntro;

+(CGFloat)textHeight:(NSString *)text width:(CGFloat)width;
+(CGFloat)singleLineHeight;

@end

NS_ASSUME_NONNULL_END
