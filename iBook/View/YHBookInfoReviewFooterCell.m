//
//  YHBookInfoReviewFooterCell.m
//  iBook
//
//  Created by zikeys on 2019/12/18.
//  Copyright © 2019 zikeys. All rights reserved.
//

#import "YHBookInfoReviewFooterCell.h"

@interface YHBookInfoReviewFooterCell ()
@property (nonatomic, strong) UILabel *reviewLabel;
@property (nonatomic, strong) UILabel *lineLabel;
@end

@implementation YHBookInfoReviewFooterCell

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
    
    self.reviewLabel = [[UILabel alloc] init];
    self.reviewLabel.font = [UIFont systemFontOfSize:14];
    self.reviewLabel.textAlignment = NSTextAlignmentCenter;
    self.reviewLabel.textColor = TEXT_COLOR_A;
    self.reviewLabel.text = @"查看全部评论";
    [self.contentView addSubview:self.reviewLabel];
    
    self.lineLabel = [[UILabel alloc] init];
    self.lineLabel.backgroundColor = TEXT_COLOR_D;
    [self.contentView addSubview:self.lineLabel];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.lineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(self.contentView);
        make.height.mas_equalTo(0.5);
    }];
    [self.reviewLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(self.contentView).mas_offset(15);
        make.centerX.mas_equalTo(self.contentView);
    }];

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
