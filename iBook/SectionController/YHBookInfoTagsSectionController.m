//
//  YHBookInfoTagsSectionController.m
//  iBook
//
//  Created by zikeys on 2019/12/18.
//  Copyright © 2019 zikeys. All rights reserved.
//

#import "YHBookInfoTagsSectionController.h"
#import "YHBookTagCell.h"

@interface YHBookInfoTagsSectionController ()
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
    }
    return self;
}

#pragma mark - IGListSectionController Overrides

- (NSInteger)numberOfItems {
    return self.tagsViewModel.tagsArray.count;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    return CGSizeMake(50, 20);
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

@end
