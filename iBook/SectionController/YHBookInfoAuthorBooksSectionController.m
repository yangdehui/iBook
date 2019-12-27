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
        self.inset = UIEdgeInsetsMake(0, 15, 10, 15);
        self.minimumInteritemSpacing = 15;
        self.minimumLineSpacing = 12;
    }
    return self;
}

#pragma mark - IGListSectionController Overrides

- (NSInteger)numberOfItems {
    NSInteger count = _authorBooksViewModel.bookInfoArray.count + 1;
    return count > 9 ? 9 : count;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    const CGFloat width = self.collectionContext.containerSize.width;
    CGSize size = index == 0 ? CGSizeMake(width, 50) : CGSizeMake(floor((width - 75) / 4), 140);
    return size;
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    UICollectionViewCell *cell = [self.collectionContext dequeueReusableCellOfClass:index == 0 ? [YHBookInfoSectionHeaderCell class] : [YHBookInfoFullWidthCoverCell class] forSectionController:self atIndex:index];
    if (index == 0) {
        [(YHBookInfoSectionHeaderCell *)cell setLeftTitle:_authorBooksViewModel.header];
        [(YHBookInfoSectionHeaderCell *)cell setLineHidden];
    } else {
        [(YHBookInfoFullWidthCoverCell *)cell setBookInfoCover:_authorBooksViewModel.bookInfoArray[index - 1]];
    }
    return cell;
}

- (void)didUpdateToObject:(id)object {
    _authorBooksViewModel = object;
}

- (void)didSelectItemAtIndex:(NSInteger)index {
    YHBookInfoModel *bookInfo = _authorBooksViewModel.bookInfoArray[index - 1];
    YHBookDetailViewController *bookDetailVC = [[YHBookDetailViewController alloc] initWithBookID:bookInfo.bookId];
    [self.viewController.navigationController pushViewController:bookDetailVC animated:true];
}

#pragma mark - IGListSupplementaryViewSource

-(NSArray<NSString *> *)supportedElementKinds{
    return @[UICollectionElementKindSectionHeader];
}

-(UICollectionReusableView *)viewForSupplementaryElementOfKind:(NSString *)elementKind atIndex:(NSInteger)index{
    UICollectionReusableView *view = [self.collectionContext dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader forSectionController:self class:UICollectionReusableView.class atIndex:index];
    view.backgroundColor = UIColor.flatWhiteColor;
    return view;
}

-(CGSize)sizeForSupplementaryViewOfKind:(NSString *)elementKind atIndex:(NSInteger)index{
    return CGSizeMake([self.collectionContext containerSize].width, 8);
}
@end
