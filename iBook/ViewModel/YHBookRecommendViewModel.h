//
//  YHBookRecommendViewModel.h
//  iBook
//
//  Created by zikeys on 2019/12/18.
//  Copyright © 2019 zikeys. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YHBookRecommendViewModel : NSObject<IGListDiffable>
@property (nonatomic, copy) NSString *header;
@property (nonatomic, copy) NSString *footer;
@property (nonatomic, copy) NSString *footerIcon;
@property (nonatomic, copy) NSArray <YHBookInfoModel *>*bookInfoArray;

- (instancetype)initWithHeader:(NSString *)header footer:(NSString *)footer icon:(NSString *)icon books:(NSArray <YHBookInfoModel *>*)books;
@end

NS_ASSUME_NONNULL_END
