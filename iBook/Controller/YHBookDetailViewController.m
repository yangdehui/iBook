//
//  YHBookDetailViewController.m
//  iBook
//
//  Created by zikeys on 2019/12/11.
//  Copyright © 2019 zikeys. All rights reserved.
//

#import "YHBookDetailViewController.h"
#import "YHBookInfoHeaderSectionController.h"
#import "YHBookTagsSectionController.h"
#import "YHBookInfoManager.h"
#import <IGListKit.h>

@interface YHBookDetailViewController () <IGListAdapterDataSource>

@property (nonatomic, copy) NSString *bookId;

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) IGListAdapter *adapter;
@property (nonatomic, copy) NSArray *dataSoure;
@property (nonatomic, strong) YHBookInfoManager *bookInfoManager;
@end

@implementation YHBookDetailViewController

- (instancetype)initWithBookID:(NSString *)bookId {
    
    self = [super init];
    if (self) {
        self.bookId = bookId;
    }
    return self;
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = kWhiteColor;
    self.hbd_barHidden = YES;
    [self loadData];
}

- (void)loadData {
    
    self.dataSoure = [[NSArray alloc] init];
    __weak typeof(self)weakSelf = self;
    [self.bookInfoManager configBookInfoDataSoure:^(NSArray<id<IGListDiffable>> * _Nonnull data) {
        
        weakSelf.dataSoure = data;
        [weakSelf setSubViews];
    } fail:^(NSError * _Nonnull error) {
        
    }];
}

- (void)setSubViews {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.estimatedItemSize = UICollectionViewFlowLayoutAutomaticSize;
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    self.collectionView.backgroundColor = kWhiteColor;
    [self.view addSubview:self.collectionView];
    self.adapter = [[IGListAdapter alloc] initWithUpdater:IGListAdapterUpdater.new viewController:self];
    self.adapter.collectionView = self.collectionView;
    self.adapter.dataSource = self;
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.collectionView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
}

#pragma mark - IGListAdapterDataSource

- (NSArray<id<IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter {
    return self.dataSoure;
}

- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object {
    if ([object isKindOfClass:YHBookHeaderViewModel.class]) {
        return [YHBookInfoHeaderSectionController new];
    } else if ([object isKindOfClass:YHBookTagsViewModel.class]) {
        return [YHBookTagsSectionController new];
    }
    return nil;
}

- (UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter {
    return nil;
}

#pragma mark - lazy loading
- (YHBookInfoManager *)bookInfoManager {
    
    if (!_bookInfoManager) {
        _bookInfoManager = [[YHBookInfoManager alloc] initWithBookId:self.bookId];
    }
    return _bookInfoManager;
}
@end
