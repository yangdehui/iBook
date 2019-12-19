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
    
    self.reviewScrollView = [[YHBookReviewScrollView alloc] init];
    [self.contentView addSubview:self.reviewScrollView];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGRect rect = self.bounds;
    [self.reviewScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(rect.size.width, 110)).priorityHigh();
        make.top.bottom.centerX.mas_equalTo(self.contentView);
    }];
}

- (void)setReviewViewModels:(NSArray<YHBookReviewModel *> *)reviewViewModels {
    [self.reviewScrollView setReviewViewModels:reviewViewModels];
}

-(UICollectionViewLayoutAttributes *)preferredLayoutAttributesFittingAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes{
    [super setNeedsLayout];
    [super layoutIfNeeded];
    CGSize size = [self.contentView systemLayoutSizeFittingSize:layoutAttributes.size];
    CGRect newFrame = layoutAttributes.frame;
    newFrame.size.height = ceil(size.height);
    layoutAttributes.frame = newFrame;
    return layoutAttributes;
}

@end
