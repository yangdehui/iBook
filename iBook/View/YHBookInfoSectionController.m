//
//  YHBookInfoSectionController.m
//  iBook
//
//  Created by zikeys on 2019/12/13.
//  Copyright © 2019 zikeys. All rights reserved.
//

#import "YHBookInfoSectionController.h"
#import "YHBookInfoModel.h"
#import "YHBookHeaderCell.h"
#import "YHBookDirectoryCell.h"
#import "YHBookTagsCell.h"

@interface YHBookInfoSectionController ()
@property (nonatomic, strong) YHBookInfoModel *bookInfo;
@end
@implementation YHBookInfoSectionController

#pragma mark - IGListSectionController Overrides

- (NSInteger)numberOfItems {
    return 1;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    const CGFloat width = self.collectionContext.containerSize.width;
    CGFloat height = 50;
    if (index == 0) {
        height = 150;
    }
    return CGSizeMake(width, height);
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    Class cellClass;
    if (index == 0) {
        cellClass = [YHBookHeaderCell class];
    } else if (index == 1) {
        cellClass = [YHBookDirectoryCell class];
    } else {
        cellClass = [YHBookTagsCell class];
    }
    id cell = [self.collectionContext dequeueReusableCellOfClass:cellClass forSectionController:self atIndex:index];
    if ([cell isKindOfClass:[YHBookHeaderCell class]]) {
        [(YHBookHeaderCell *)cell setBookInfo:_bookInfo];
    } else if ([cell isKindOfClass:[YHBookDirectoryCell class]]) {
        [(YHBookDirectoryCell *)cell setDirectoryModel:_bookInfo];
    } else {
        [(YHBookTagsCell *)cell setTagsModel:_bookInfo];
    }
    return cell;
}

- (void)didUpdateToObject:(id)object {
    _bookInfo = object;
}

@end
