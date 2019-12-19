//
//  YHBookHeaderViewModel.h
//  iBook
//
//  Created by zikeys on 2019/12/19.
//  Copyright © 2019 zikeys. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YHBookHeaderViewModel : NSObject<IGListDiffable>
@property (nonatomic, copy) NSString *coverUrl;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *author;
@property (nonatomic, copy) NSString *longIntro;
@property (nonatomic, assign) NSInteger wordCount;
@property (nonatomic, assign) NSInteger chaptersCount;

@property (nonatomic, assign) NSInteger sort;

- (instancetype)initWithBookInfo:(YHBookInfoModel *)bookInfo sort:(NSInteger)sort;

@end

NS_ASSUME_NONNULL_END
