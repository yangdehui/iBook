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

@interface YHBookInfoHeaderSectionController ()<IGListSupplementaryViewSource>
@property (nonatomic, strong) YHBookHeaderViewModel *headerViewModel;
@property (nonatomic, assign) BOOL expanded;

@end
@implementation YHBookInfoHeaderSectionController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.supplementaryViewSource = self;
    }
    return self;
}
#pragma mark - IGListSectionController Overrides

- (NSInteger)numberOfItems {
    return 1;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    const CGFloat width = self.collectionContext.containerSize.width;
    return CGSizeMake(width, 60);
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {

    YHBookLongIntroCell * cell = [self.collectionContext dequeueReusableCellOfClass:YHBookLongIntroCell.class forSectionController:self atIndex:index];
    [cell setLongIntro:_headerViewModel];
    [cell updateHeight:_expanded];
    return cell;
}

- (void)didUpdateToObject:(id)object {
    _headerViewModel = object;
}

- (void)didSelectItemAtIndex:(NSInteger)index {
    _expanded = !_expanded;
    [self.collectionContext performBatchAnimated:false updates:^(id<IGListBatchContext>  _Nonnull batchContext) {
        [batchContext reloadInSectionController:self atIndexes:[NSIndexSet indexSetWithIndex:0]];
    } completion:nil];
//    [self.collectionContext invalidateLayoutForSectionController:self completion:nil];
}

#pragma mark - IGListSupplementaryViewSource

-(NSArray<NSString *> *)supportedElementKinds{
    return @[UICollectionElementKindSectionHeader, UICollectionElementKindSectionFooter];
}

-(UICollectionReusableView *)viewForSupplementaryElementOfKind:(NSString *)elementKind atIndex:(NSInteger)index{
    UICollectionReusableView *view = nil;
    if ([elementKind isEqualToString:UICollectionElementKindSectionHeader]) {
        view = [self.collectionContext dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader forSectionController:self class:YHBookHeaderCell.class atIndex:index];
        [(YHBookHeaderCell *)view setHeaderInfo:_headerViewModel];
    }
    if ([elementKind isEqualToString:UICollectionElementKindSectionFooter]) {
        view = [self.collectionContext dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter forSectionController:self class:YHBookDirectoryCell.class atIndex:index];
        [(YHBookDirectoryCell *)view setDirectoryModel:_headerViewModel];
    }
    return view;
}

-(CGSize)sizeForSupplementaryViewOfKind:(NSString *)elementKind atIndex:(NSInteger)index{
    CGFloat height = 0;
    if ([elementKind isEqualToString:UICollectionElementKindSectionHeader]) {
        height = 180;
    }
    if ([elementKind isEqualToString:UICollectionElementKindSectionFooter]) {
        height = 50;
    }
    return CGSizeMake([self.collectionContext containerSize].width, height);
}

@end
