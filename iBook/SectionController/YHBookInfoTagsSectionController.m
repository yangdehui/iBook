//
//  YHBookInfoTagsSectionController.m
//  iBook
//
//  Created by zikeys on 2019/12/18.
//  Copyright © 2019 zikeys. All rights reserved.
//

#import "YHBookInfoTagsSectionController.h"
#import "YHBookTagCell.h"

@interface YHBookInfoTagsSectionController ()<IGListSupplementaryViewSource>
@property (nonatomic, strong) YHBookTagsViewModel *tagsViewModel;

@end

@implementation YHBookInfoTagsSectionController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.inset = UIEdgeInsetsMake(10, 15, 10, 10);
        self.minimumLineSpacing = 5;
        self.minimumInteritemSpacing = 5;
        self.supplementaryViewSource = self;
    }
    return self;
}

#pragma mark - IGListSectionController Overrides

- (NSInteger)numberOfItems {
    return self.tagsViewModel.tagsArray.count;
}

//- (CGSize)sizeForItemAtIndex:(NSInteger)index {
////    CGFloat width = self.collectionContext.containerSize.width;
//    return CGSizeMake(60, 20);
//}
- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    CGFloat width = self.collectionContext.containerSize.width;
    NSString *text = _tagsViewModel.tagsArray[index];
    return CGSizeMake([YHBookTagCell textWidth:text width:width], 20);
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    YHBookTagCell * cell = [self.collectionContext dequeueReusableCellOfClass:[YHBookTagCell class] forSectionController:self atIndex:index];
    [cell setTagsModel:_tagsViewModel index:index];
    return cell;
}

- (void)didUpdateToObject:(id)object {
    _tagsViewModel = object;
}

- (void)didSelectItemAtIndex:(NSInteger)index {
    return;
}

#pragma mark - IGListSupplementaryViewSource

-(NSArray<NSString *> *)supportedElementKinds{
    return @[UICollectionElementKindSectionFooter];
}

-(UICollectionReusableView *)viewForSupplementaryElementOfKind:(NSString *)elementKind atIndex:(NSInteger)index{
    UICollectionReusableView *view=[self.collectionContext dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter forSectionController:self class:UICollectionReusableView.class atIndex:index];
    view.backgroundColor = UIColor.flatWhiteColor;
    return view;
}

-(CGSize)sizeForSupplementaryViewOfKind:(NSString *)elementKind atIndex:(NSInteger)index{
    return CGSizeMake([self.collectionContext containerSize].width, 8);
}

@end
