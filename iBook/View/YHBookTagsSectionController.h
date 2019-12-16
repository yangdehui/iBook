//
//  YHBookTagsSectionController.h
//  iBook
//
//  Created by zikeys on 2019/12/16.
//  Copyright © 2019 zikeys. All rights reserved.
//

#import "IGListSectionController.h"

NS_ASSUME_NONNULL_BEGIN
@interface YHBookTagCell : UICollectionViewCell
@property (nonatomic, copy) NSString *tag;
@end

@interface YHBookTagsSectionController : IGListSectionController

@end

NS_ASSUME_NONNULL_END
