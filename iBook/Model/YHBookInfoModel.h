//
//  YHBookInfoModel.h
//  iBook
//
//  Created by zikeys on 2019/12/12.
//  Copyright © 2019 zikeys. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YHBookInfoModel : NSObject

/** 书籍ID*/
@property (nonatomic, copy) NSString *bookId;

/** 书评人数*/
@property (nonatomic, assign) NSInteger *ratingCount;

/** 标签*/
@property (nonatomic, copy) NSArray *tags;

/** 最后一张*/
@property (nonatomic, copy) NSString *lastChapter;

/** 章数*/
@property (nonatomic, assign) NSInteger chaptersCount;

/** 留存率*/
@property (nonatomic, assign) CGFloat retentionRatio;

/** 总字数*/
@property (nonatomic, assign) NSInteger wordCount;




@end


NS_ASSUME_NONNULL_END
