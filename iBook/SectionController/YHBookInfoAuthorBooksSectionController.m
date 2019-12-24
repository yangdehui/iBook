//
//  YHBookInfoAuthorBooksSectionController.m
//  iBook
//
//  Created by zikeys on 2019/12/23.
//  Copyright © 2019 zikeys. All rights reserved.
//

#import "YHBookInfoAuthorBooksSectionController.h"
#import "YHBookInfoSectionHeaderCell.h"
#import "YHBookInfoFullWidthCoverCell.h"
#import "YHBookDetailViewController.h"

@interface YHBookInfoAuthorBooksSectionController ()<IGListSupplementaryViewSource>
@property (nonatomic, strong) YHAuthorBooksViewModel *authorBooksViewModel;
@end

@implementation YHBookInfoAuthorBooksSectionController

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
    return _authorBooksViewModel.bookInfoArray.count;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    const CGFloat width = self.collectionContext.containerSize.width;
    return CGSizeMake(width, 120);
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    YHBookInfoFullWidthCoverCell * cell = [self.collectionContext dequeueReusableCellOfClass:YHBookInfoFullWidthCoverCell.class forSectionController:self atIndex:index];
    [cell setBookInfoCover:_authorBooksViewModel.bookInfoArray[index]];
    return cell;
}

- (void)didUpdateToObject:(id)object {
    _authorBooksViewModel = object;
}

- (void)didSelectItemAtIndex:(NSInteger)index {
    YHBookInfoModel *bookInfo = _authorBooksViewModel.bookInfoArray[index];
    YHBookDetailViewController *bookDetailVC = [[YHBookDetailViewController alloc] initWithBookID:bookInfo.bookId];
    [self.viewController.navigationController pushViewController:bookDetailVC animated:true];
}

#pragma mark - IGListSupplementaryViewSource

-(NSArray<NSString *> *)supportedElementKinds{
    return @[UICollectionElementKindSectionHeader];
}

-(UICollectionReusableView *)viewForSupplementaryElementOfKind:(NSString *)elementKind atIndex:(NSInteger)index{
    YHBookInfoSectionHeaderCell *view = [self.collectionContext dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader forSectionController:self class:YHBookInfoSectionHeaderCell.class atIndex:index];
    [view setLeftTitle:_authorBooksViewModel.header];
    [view setLineHidden];
    return view;
}

-(CGSize)sizeForSupplementaryViewOfKind:(NSString *)elementKind atIndex:(NSInteger)index{
    return CGSizeMake([self.collectionContext containerSize].width, 50);
}
@end
