//
//  YHBookInfoReviewSectionController.m
//  iBook
//
//  Created by zikeys on 2019/12/18.
//  Copyright © 2019 zikeys. All rights reserved.
//

#import "YHBookInfoReviewSectionController.h"
#import "YHBookInfoSectionHeaderCell.h"
#import "YHBookInfoReviewContentCell.h"
#import "YHBookInfoSectionFooterCell.h"

@interface YHBookInfoReviewSectionController ()<IGListSupplementaryViewSource>
@property (nonatomic, strong) YHBookReviewViewModel *reviewModel;

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
        cellClass = [YHBookInfoSectionHeaderCell class];
    } else if (index == 1) {
        cellClass = [YHBookInfoReviewContentCell class];
    }else if (index == 2) {
        cellClass = [YHBookInfoSectionFooterCell class];
    }
    id cell = [self.collectionContext dequeueReusableCellOfClass:cellClass forSectionController:self atIndex:index];
    if ([cell isKindOfClass:[YHBookInfoSectionHeaderCell class]]) {
        [(YHBookInfoSectionHeaderCell *)cell setLeftTitle:_reviewModel.leftTitle];
        [(YHBookInfoSectionHeaderCell *)cell setRightButton:_reviewModel.rightTitle icon:_reviewModel.rightIcon];
    }else if ([cell isKindOfClass:[YHBookInfoReviewContentCell class]]) {
        [(YHBookInfoReviewContentCell *)cell setReviewViewModels:_reviewModel.reviewArray];
        [(YHBookInfoReviewContentCell *)cell setUserInteractionEnabled:false];
    }
    else if ([cell isKindOfClass:[YHBookInfoSectionFooterCell class]]) {
        [(YHBookInfoSectionFooterCell *)cell setContentButton:_reviewModel.footerTitle icon:@""];
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
    return @[UICollectionElementKindSectionFooter];
}

-(UICollectionReusableView *)viewForSupplementaryElementOfKind:(NSString *)elementKind atIndex:(NSInteger)index{
    UICollectionReusableView *view =[self.collectionContext dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter forSectionController:self class:UICollectionReusableView.class atIndex:index];
    view.backgroundColor = UIColor.flatWhiteColor;
    return view;
}

-(CGSize)sizeForSupplementaryViewOfKind:(NSString *)elementKind atIndex:(NSInteger)index{
    return CGSizeMake([self.collectionContext containerSize].width, 8);
}
@end
