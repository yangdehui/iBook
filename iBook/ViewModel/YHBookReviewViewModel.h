//
//  YHBookReviewViewModel.h
//  iBook
//
//  Created by zikeys on 2019/12/19.
//  Copyright © 2019 zikeys. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YHBookReviewViewModel : NSObject<IGListDiffable>

@property (nonatomic, copy) NSString *leftTitle;
@property (nonatomic, copy) NSString *rightTitle;
@property (nonatomic, copy) NSString *rightIcon;
@property (nonatomic, copy) NSString *footerTitle;
@property (nonatomic, copy) NSArray <YHBookReviewModel *>*reviewArray;

@property (nonatomic, assign) NSInteger sort;

- (instancetype)initWithLeftHeader:(NSString *)leftTitle rightHeader:(NSString *)rightTitle rightIcon:(NSString *)rightIcon footerTitle:(NSString *)footerTitle reviews:(NSArray <YHBookReviewModel *>*)reviews sort:(NSInteger)sort;
@end

NS_ASSUME_NONNULL_END
