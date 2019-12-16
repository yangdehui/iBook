//
//  YHBookTagsCell.m
//  iBook
//
//  Created by zikeys on 2019/12/13.
//  Copyright © 2019 zikeys. All rights reserved.
//

#import "YHBookTagsCell.h"
#import "YHBookTagsSectionController.h"

@interface YHBookTagsCell () <IGListAdapterDataSource>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) IGListAdapter *adapter;
@end

@implementation YHBookTagsCell

- (instancetype)init {
    if (self = [super init]) {
        [self setupSubviews];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.estimatedItemSize = UICollectionViewFlowLayoutAutomaticSize;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.sectionInset = UIEdgeInsetsMake(0, 15, 0, 15);
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    self.collectionView.backgroundColor = kWhiteColor;
    [self addSubview:self.collectionView];

}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.collectionView.frame = self.bounds;
}

#pragma mark - IGListAdapterDataSource

- (NSArray<id<IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter {
    return self.tagsArray;
}

- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object {
    return [YHBookTagsSectionController new];
}

- (UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter {
    return nil;
}

#pragma mark - setter

- (void)setTagsArray:(NSArray *)tagsArray {
    _tagsArray = tagsArray;
    self.adapter = [[IGListAdapter alloc] initWithUpdater:IGListAdapterUpdater.new viewController:self];
    self.adapter.collectionView = self.collectionView;
    self.adapter.dataSource = self;
    
}

@end
