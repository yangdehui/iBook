//
//  YHBookInfoRelateRecommendSectionController.m
//  iBook
//
//  Created by zikeys on 2019/12/19.
//  Copyright © 2019 zikeys. All rights reserved.
//

#import "YHBookInfoRelateRecommendSectionController.h"
#import "YHBookInfoSectionHeaderCell.h"
#import "YHBookInfoFlowLayoutCoverCell.h"
#import "YHBookInfoSectionFooterCell.h"
#import "YHBookDetailViewController.h"

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
        self.minimumInteritemSpacing = 15;
        self.minimumLineSpacing = 12;
    }
    return self;
}

#pragma mark - IGListSectionController Overrides

- (NSInteger)numberOfItems {
    NSInteger count = _recommendViewModel.bookInfoArray.count;
    return count > 8 ? 8 : count;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    const CGFloat width = self.collectionContext.containerSize.width;
    CGSize size = CGSizeMake(floor((width - 75) / 4), 140);
    return size;
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    YHBookInfoFlowLayoutCoverCell * cell = [self.collectionContext dequeueReusableCellOfClass:YHBookInfoFlowLayoutCoverCell.class forSectionController:self atIndex:index];
    [cell setBookInfoCover:_recommendViewModel.bookInfoArray[index]];
    return cell;
}

- (void)didUpdateToObject:(id)object {
    _recommendViewModel = object;
}

- (void)didSelectItemAtIndex:(NSInteger)index {
    YHBookInfoModel *bookInfo = _recommendViewModel.bookInfoArray[index];
    YHBookDetailViewController *bookDetailVC = [[YHBookDetailViewController alloc] initWithBookID:bookInfo.bookId];
    [self.viewController.navigationController pushViewController:bookDetailVC animated:true];
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
        [(YHBookInfoSectionFooterCell *)view setContentButton:_recommendViewModel.footer icon:_recommendViewModel.footerIcon imagePosition:imagePositionRight];
    }
    return view;
}

-(CGSize)sizeForSupplementaryViewOfKind:(NSString *)elementKind atIndex:(NSInteger)index{
    return CGSizeMake([self.collectionContext containerSize].width, 50);
}
@end
