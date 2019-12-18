//
//  YHBookInfoReviewHeaderCell.m
//  iBook
//
//  Created by zikeys on 2019/12/18.
//  Copyright © 2019 zikeys. All rights reserved.
//

#import "YHBookInfoReviewHeaderCell.h"

@interface YHBookInfoReviewHeaderCell ()
@property (nonatomic, strong) UILabel *separatorLabel;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIButton *reviewButton;
@property (nonatomic, strong) UILabel *lineLabel;
@end

@implementation YHBookInfoReviewHeaderCell

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
    
    self.separatorLabel = [[UILabel alloc] init];
    self.separatorLabel.layer.cornerRadius = 1;
    self.separatorLabel.layer.masksToBounds = true;
    self.separatorLabel.backgroundColor = UIColor.flatGreenColor;
    [self.contentView addSubview:self.separatorLabel];
    
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.font = [UIFont systemFontOfSize:13];
    self.titleLabel.textColor = TEXT_COLOR_B;
    self.titleLabel.text = @"书友评价";
    [self.contentView addSubview:self.titleLabel];
    
    self.reviewButton = [[UIButton alloc] init];
    [self.reviewButton setTitleColor:UIColor.flatGreenColor forState:UIControlStateNormal];
    [self.reviewButton.titleLabel setFont:[UIFont systemFontOfSize:9]];
    [self.contentView addSubview:self.reviewButton];
    
    self.lineLabel = [[UILabel alloc] init];
    self.lineLabel.backgroundColor = TEXT_COLOR_D;
    [self.contentView addSubview:self.lineLabel];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.separatorLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(3, 13));
        make.left.centerY.mas_equalTo(self.contentView);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).mas_offset(15);
        make.centerY.mas_equalTo(self.contentView);
        make.top.bottom.mas_equalTo(self.contentView).inset(15);
    }];
    [self.reviewButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(60, 30));
        make.right.mas_equalTo(self.contentView).mas_offset(10);
        make.centerY.mas_equalTo(self.contentView);
    }];
    [self.lineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.mas_equalTo(self.contentView);
        make.height.mas_equalTo(0.5);
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
