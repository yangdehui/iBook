//
//  YHBookInfoAuthorBooksSectionController.m
//  iBook
//
//  Created by zikeys on 2019/12/23.
//  Copyright © 2019 zikeys. All rights reserved.
//

#import "YHBookInfoAuthorBooksSectionController.h"
#import "YHBookInfoSectionHeaderCell.h"
#import "YHBookInfoCoverCell.h"
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
        self.minimumInteritemSpacing = 10;
        self.minimumLineSpacing = 10;
    }
    return self;
}

#pragma mark - IGListSectionController Overrides

- (NSInteger)numberOfItems {
    return _authorBooksViewModel.bookInfoArray.count;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    const CGFloat width = self.collectionContext.containerSize.width;
    CGSize size = CGSizeMake(floor((width - 60) / 4), 160);
    return size;
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    YHBookInfoCoverCell * cell = [self.collectionContext dequeueReusableCellOfClass:YHBookInfoCoverCell.class forSectionController:self atIndex:index];
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
    return view;
}

-(CGSize)sizeForSupplementaryViewOfKind:(NSString *)elementKind atIndex:(NSInteger)index{
    return CGSizeMake([self.collectionContext containerSize].width, 50);
}
@end
