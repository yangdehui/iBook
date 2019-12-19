//
//  YHBookTagsViewModel.h
//  iBook
//
//  Created by zikeys on 2019/12/19.
//  Copyright © 2019 zikeys. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YHBookTagsViewModel : NSObject<IGListDiffable>
@property (nonatomic, copy) NSArray *tagsArray;

@property (nonatomic, assign) NSInteger sort;

- (UIColor *)tagColorWithIndex:(NSInteger)index;
- (instancetype)initWithBookInfo:(YHBookInfoModel *)bookInfo sort:(NSInteger)sort;

@end

NS_ASSUME_NONNULL_END
