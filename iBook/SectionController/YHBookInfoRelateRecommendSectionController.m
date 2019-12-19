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
//        self.inset = UIEdgeInsetsMake(0, 7.5, 0, 7.5);
    }
    return self;
}

#pragma mark - IGListSectionController Overrides

- (NSInteger)numberOfItems {
    return 10;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    const CGFloat width = self.collectionContext.containerSize.width;
    CGSize size = CGSizeZero;
    if (index == 0 || index == 9) {
        size = CGSizeMake(width, 60);
    } else {
        size = CGSizeMake(floor(width / 4), 150);
    }
    return size;
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    Class cellClass;
    if (index == 0) {
        cellClass = [YHBookInfoSectionHeaderCell class];
    } else if (index == 9) {
        cellClass = [YHBookInfoSectionFooterCell class];
    } else {
        cellClass = [YHBookInfoCoverCell class];
    }
    id cell = [self.collectionContext dequeueReusableCellOfClass:cellClass forSectionController:self atIndex:index];
    if ([cell isKindOfClass:[YHBookInfoSectionHeaderCell class]]) {
        [(YHBookInfoSectionHeaderCell *)cell setLeftTitle:_recommendViewModel.header];
    }else if ([cell isKindOfClass:[YHBookInfoCoverCell class]]) {
        [(YHBookInfoCoverCell *)cell setBookInfoCover:_recommendViewModel.bookInfoArray[index - 1]];
    }
    else if ([cell isKindOfClass:[YHBookInfoSectionFooterCell class]]) {
        [(YHBookInfoSectionFooterCell *)cell setContentButton:_recommendViewModel.footer icon:_recommendViewModel.footerIcon];
    }
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
    return @[UICollectionElementKindSectionHeader];
}

-(UICollectionReusableView *)viewForSupplementaryElementOfKind:(NSString *)elementKind atIndex:(NSInteger)index{
    UICollectionReusableView *view =[self.collectionContext dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader forSectionController:self class:UICollectionReusableView.class atIndex:index];
    view.backgroundColor = UIColor.flatWhiteColor;
    return view;
}

-(CGSize)sizeForSupplementaryViewOfKind:(NSString *)elementKind atIndex:(NSInteger)index{
    return CGSizeMake([self.collectionContext containerSize].width, 8);
}
@end
