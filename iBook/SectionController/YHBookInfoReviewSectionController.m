//
//  YHBookInfoReviewSectionController.m
//  iBook
//
//  Created by zikeys on 2019/12/18.
//  Copyright © 2019 zikeys. All rights reserved.
//

#import "YHBookInfoReviewSectionController.h"
#import "YHBookInfoReviewHeaderCell.h"
#import "YHBookInfoReviewContentCell.h"
#import "YHBookInfoReviewFooterCell.h"

@interface YHBookInfoReviewSectionController ()<IGListSupplementaryViewSource>
@property (nonatomic, strong) YHBookReviewResponse *reviewModel;

@end

@implementation YHBookInfoReviewSectionController

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
    return 3;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    const CGFloat width = self.collectionContext.containerSize.width;
    return CGSizeMake(width, 60);
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    Class cellClass;
    if (index == 0) {
        cellClass = [YHBookInfoReviewHeaderCell class];
    } else if (index == 1) {
        cellClass = [YHBookInfoReviewContentCell class];
    }else if (index == 2) {
        cellClass = [YHBookInfoReviewFooterCell class];
    }
    id cell = [self.collectionContext dequeueReusableCellOfClass:cellClass forSectionController:self atIndex:index];
    if ([cell isKindOfClass:[YHBookInfoReviewHeaderCell class]]) {
    }else if ([cell isKindOfClass:[YHBookInfoReviewContentCell class]]) {
        [(YHBookInfoReviewContentCell *)cell setReviewViewModels:_reviewModel.reviews];
        [(YHBookInfoReviewContentCell *)cell setUserInteractionEnabled:false];
    }
    else if ([cell isKindOfClass:[YHBookInfoReviewFooterCell class]]) {
    }
    return cell;
}

- (void)didUpdateToObject:(id)object {
    _reviewModel = object;
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
