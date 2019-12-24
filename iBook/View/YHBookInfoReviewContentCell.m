//
//  YHBookInfoReviewContentCell.m
//  iBook
//
//  Created by zikeys on 2019/12/18.
//  Copyright © 2019 zikeys. All rights reserved.
//

#import "YHBookInfoReviewContentCell.h"
#import "YHBookReviewScrollView.h"

@interface YHBookInfoReviewContentCell ()
@property (nonatomic, strong) YHBookReviewScrollView *reviewScrollView;
@end

@implementation YHBookInfoReviewContentCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews {
    
    self.reviewScrollView = [[YHBookReviewScrollView alloc] init];
    [self.contentView addSubview:self.reviewScrollView];
}

- (void)layoutSubviews {
    [super layoutSubviews];

    self.reviewScrollView.frame = self.bounds;
}

- (void)setReviewViewModels:(NSArray<YHBookReviewModel *> *)reviewViewModels {
    [self.reviewScrollView setReviewViewModels:reviewViewModels];
}

@end
