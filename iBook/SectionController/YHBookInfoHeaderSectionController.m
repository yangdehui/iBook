//
//  YHBookInfoHeaderSectionController.m
//  iBook
//
//  Created by zikeys on 2019/12/13.
//  Copyright © 2019 zikeys. All rights reserved.
//

#import "YHBookInfoHeaderSectionController.h"
#import "YHBookInfoModel.h"
#import "YHBookHeaderCell.h"
#import "YHBookLongIntroCell.h"
#import "YHBookDirectoryCell.h"

@interface YHBookInfoHeaderSectionController ()
@property (nonatomic, strong) YHBookHeaderViewModel *headerViewModel;
@property (nonatomic, assign) BOOL expanded;

@end
@implementation YHBookInfoHeaderSectionController

#pragma mark - IGListSectionController Overrides

- (NSInteger)numberOfItems {
    return 3;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    const CGFloat width = self.collectionContext.containerSize.width;
    CGFloat height = 50;
    if (index == 0) {
        height = 180;
    } else if (index == 1) {
        height = 60;
    }
    return CGSizeMake(width, height);
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    Class cellClass;
    if (index == 0) {
        cellClass = [YHBookHeaderCell class];
    } else if (index == 1) {
        cellClass = [YHBookLongIntroCell class];
    }else if (index == 2) {
        cellClass = [YHBookDirectoryCell class];
    }
    id cell = [self.collectionContext dequeueReusableCellOfClass:cellClass forSectionController:self atIndex:index];
    if ([cell isKindOfClass:[YHBookHeaderCell class]]) {
        [(YHBookHeaderCell *)cell setHeaderInfo:_headerViewModel];
    }else if ([cell isKindOfClass:[YHBookLongIntroCell class]]) {
        [(YHBookLongIntroCell *)cell setLongIntro:_headerViewModel];
        [(YHBookLongIntroCell *)cell updateHeight:_expanded];
    }else if ([cell isKindOfClass:[YHBookDirectoryCell class]]) {
        [(YHBookDirectoryCell *)cell setDirectoryModel:_headerViewModel];
    }
    return cell;
}

- (void)didUpdateToObject:(id)object {
    _headerViewModel = object;
}

- (void)didSelectItemAtIndex:(NSInteger)index {
    if (index == 1) {
        _expanded = !_expanded;
        [self.collectionContext performBatchAnimated:false updates:^(id<IGListBatchContext>  _Nonnull batchContext) {
            [batchContext reloadInSectionController:self atIndexes:[NSIndexSet indexSetWithIndex:index]];
        } completion:^(BOOL finished) {
            
        }];
    }
}

@end
