//
//  YHBookInfoModel.h
//  iBook
//
//  Created by zikeys on 2019/12/12.
//  Copyright © 2019 zikeys. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YHBookInfoModel : NSObject <IGListDiffable>

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

/** 长简介*/
@property (nonatomic, copy) NSString *longIntro;

/** 作者*/
@property (nonatomic, copy) NSString *author;

/** 父分类*/
@property (nonatomic, copy) NSString *majorCate;

/** 子分类*/
@property (nonatomic, copy) NSString *minorCate;

/** 书名*/
@property (nonatomic, copy) NSString *title;

/** 封面*/
@property (nonatomic, copy) NSString *cover;


@end


@interface YHBookHeaderViewModel : NSObject<IGListDiffable>
@property (nonatomic, copy) NSString *coverUrl;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *author;
@property (nonatomic, copy) NSString *longIntro;
@property (nonatomic, assign) NSInteger wordCount;
@property (nonatomic, assign) NSInteger chaptersCount;
- (instancetype)initWithBookInfo:(YHBookInfoModel *)bookInfo;
@end

@interface YHBookTagsViewModel : NSObject<IGListDiffable>
@property (nonatomic, copy) NSArray *tagsArray;
- (UIColor *)tagColorWithIndex:(NSInteger)index;
- (instancetype)initWithBookInfo:(YHBookInfoModel *)bookInfo;
@end
NS_ASSUME_NONNULL_END
