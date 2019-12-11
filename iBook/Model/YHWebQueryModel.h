//
//  YHWebQueryModel.h
//  iBook
//
//  Created by zikeys on 2019/12/11.
//  Copyright © 2019 zikeys. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, YHJumpType) {
    YHJumpType_Unknown    = 0,
    /** 原生*/
    YHJumpType_Native     = 1,
    /** WebView*/
    YHJumpType_WebView    = 2,
};

typedef NS_ENUM(NSUInteger, YHPageType) {
    /** 分类*/
    YHPageType_Category,
    /** 排行*/
    YHPageType_Ranking,
    /** 排行*/
    YHPageType_BookList,
    /** 书籍详情*/
    YHPageType_BookDetail,
    /** 帖子*/
    YHPageType_Post,
    /** 书荒*/
    YHPageType_BookShortage,
};

@interface YHWebQueryModel : NSObject

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *link;

@property (nonatomic, copy) NSString *bookId;

@property (nonatomic, assign) YHJumpType jumpType;

@property (nonatomic, assign) YHPageType pageType;

@end

NS_ASSUME_NONNULL_END
