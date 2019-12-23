//
//  YHBookInfoManager.m
//  iBook
//
//  Created by zikeys on 2019/12/13.
//  Copyright © 2019 zikeys. All rights reserved.
//

#import "YHBookInfoManager.h"

@interface YHBookInfoManager ()

@property (nonatomic, copy) NSString *bookId;

@end

@implementation YHBookInfoManager

- (instancetype)initWithBookId:(NSString *)bookId {
    
    self = [super init];
    if (self) {
        self.bookId = [bookId copy];
    }
    return self;
}

- (void)configBookInfoDataSoure:(void (^)(NSArray<id<IGListDiffable>> * _Nonnull))success fail:(void (^)(NSError * _Nonnull))fail {
    
    __block BOOL infoBool = false;
    __block BOOL reviewBool = false;
    __block BOOL recommendBool = false;
    __block BOOL authorBool = false;

    NSMutableArray *mutableArray = [[NSMutableArray alloc] init];
    dispatch_group_t group = dispatch_group_create();
    dispatch_group_enter(group);
    dispatch_group_enter(group);
    dispatch_group_enter(group);
    dispatch_group_enter(group);
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        if (infoBool && reviewBool && recommendBool && authorBool) {
            
            NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"sort" ascending:YES];
            
            NSArray *newArr = [mutableArray sortedArrayUsingDescriptors:[NSArray arrayWithObject:sortDescriptor]];
            !success ?: success(newArr);
        }else{
        
        }
    });

    __block void(^authorBooks)(NSString *author) = ^(NSString *author) {
        [YMZXClient.sharedClient getAuthorBooksWith:author success:^(NSArray<YHBookInfoModel *> * _Nonnull bookArray) {
            
            if (bookArray.count) {
                [mutableArray addObject:[[YHAuthorBooksViewModel alloc] initWithHeader:@"作者的其他作品" footer:@"" icon:@"" books:bookArray sort:4]];
            }
            authorBool = true;
            dispatch_group_leave(group);
        } fail:^(NSError * _Nonnull error) {
            dispatch_group_leave(group);
        }];
    };
    
    [YMZXClient.sharedClient getBookInfoWithBookId:_bookId success:^(YHBookInfoModel * _Nonnull bookInfo) {
        
        authorBooks (bookInfo.author);
        [mutableArray addObject:[[YHBookHeaderViewModel alloc] initWithBookInfo:bookInfo sort:0]];
        [mutableArray addObject:[[YHBookTagsViewModel alloc] initWithBookInfo:bookInfo sort:1]];
        infoBool = true;
        dispatch_group_leave(group);
    } fail:^(NSError * _Nonnull error) {
        dispatch_group_leave(group);
    }];
    
    [YMZXClient.sharedClient getBookShortReviewWithBookId:_bookId pageCount:1 success:^(YHBookReviewResponse * _Nonnull reviewModel) {
        
        if (reviewModel.reviews.count) {
            [mutableArray addObject:[[YHBookReviewViewModel alloc] initWithLeftHeader:@"书友评论" rightHeader:@"写评论" rightIcon:@"" footerTitle:[NSString stringWithFormat:@"查看全部评论（%ld条）",reviewModel.reviews.count] reviews:reviewModel.reviews sort:2]];
        }
        reviewBool = true;
        dispatch_group_leave(group);
    } fail:^(NSError * _Nonnull error) {
        dispatch_group_leave(group);
    }];
    
    [YMZXClient.sharedClient getBooksWithRecommend:_bookId success:^(NSArray<YHBookInfoModel *> * _Nonnull bookArray) {
        
        [mutableArray addObject:[[YHBookRecommendViewModel alloc] initWithHeader:@"看过本书的人还在看" footer:@"换一换" icon:@"book_shuaxin" books:bookArray sort:3]];
        recommendBool = true;
        dispatch_group_leave(group);
    } fail:^(NSError * _Nonnull error) {
        dispatch_group_leave(group);
    }];

}



@end
