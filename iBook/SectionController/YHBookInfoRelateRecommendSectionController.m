//
//  YHBookInfoRelateRecommendSectionController.m
//  iBook
//
//  Created by zikeys on 2019/12/19.
//  Copyright © 2019 zikeys. All rights reserved.
//

#import "YHBookInfoRelateRecommendSectionController.h"
#import "YHBookInfoSectionHeaderCell.h"
#import "YHBookInfoCoverCell.h"
#import "YHBookInfoSectionFooterCell.h"

@interface YHBookInfoRelateRecommendSectionController ()<IGListSupplementaryViewSource>
@property (nonatomic, strong) YHBookRecommendViewModel *recommendViewModel;

@end

@implementation YHBookInfoRelateRecommendSectionController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.supplementaryViewSource = self;
        self.inset = UIEdgeInsetsMake(0, 15, 10, 15);
        self.minimumInteritemSpacing = 10;
        self.minimumLineSpacing = 10;
    }
    return self;
}

#pragma mark - IGListSectionController Overrides

- (NSInteger)numberOfItems {
    return 8;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    const CGFloat width = self.collectionContext.containerSize.width;
    CGSize size = CGSizeMake(floor((width - 60) / 4), 160);
    return size;
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    YHBookInfoCoverCell * cell = [self.collectionContext dequeueReusableCellOfClass:YHBookInfoCoverCell.class forSectionController:self atIndex:index];
    [cell setBookInfoCover:_recommendViewModel.bookInfoArray[index]];
    return cell;
}

- (void)didUpdateToObject:(id)object {
    _recommendViewModel = object;
}

- (void)didSelectItemAtIndex:(NSInteger)index {
    return;
}

#pragma mark - IGListSupplementaryViewSource

-(NSArray<NSString *> *)supportedElementKinds{
    return @[UICollectionElementKindSectionHeader,UICollectionElementKindSectionFooter];
}

-(UICollectionReusableView *)viewForSupplementaryElementOfKind:(NSString *)elementKind atIndex:(NSInteger)index{
    UICollectionReusableView *view = nil;
    if ([elementKind isEqualToString:UICollectionElementKindSectionHeader]) {
        view = [self.collectionContext dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader forSectionController:self class:YHBookInfoSectionHeaderCell.class atIndex:index];
        [(YHBookInfoSectionHeaderCell *)view setLeftTitle:_recommendViewModel.header];
        [(YHBookInfoSectionHeaderCell *)view setLineHidden];
    } else if ([elementKind isEqualToString:UICollectionElementKindSectionFooter]) {
        view = [self.collectionContext dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter forSectionController:self class:YHBookInfoSectionFooterCell.class atIndex:index];
        [(YHBookInfoSectionFooterCell *)view setContentButton:_recommendViewModel.footer icon:_recommendViewModel.footerIcon];
    }
    return view;
}

-(CGSize)sizeForSupplementaryViewOfKind:(NSString *)elementKind atIndex:(NSInteger)index{
    return CGSizeMake([self.collectionContext containerSize].width, 50);
}
@end
