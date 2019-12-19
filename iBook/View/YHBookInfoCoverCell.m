//
//  YHBookInfoCoverCell.m
//  iBook
//
//  Created by zikeys on 2019/12/19.
//  Copyright © 2019 zikeys. All rights reserved.
//

#import "YHBookInfoCoverCell.h"

@interface YHBookInfoCoverCell ()
@property (nonatomic, strong) UIImageView *coverImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *authorLabel;
@end

@implementation YHBookInfoCoverCell

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
    
    self.coverImageView = [[UIImageView alloc] init];
    [self.contentView addSubview:self.coverImageView];
    
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.font = [UIFont systemFontOfSize:14];
    self.titleLabel.textColor = TEXT_COLOR_A;
    [self.contentView addSubview:self.titleLabel];
    
    self.authorLabel = [[UILabel alloc] init];
    self.authorLabel.font = [UIFont systemFontOfSize:13];
    self.authorLabel.textColor = TEXT_COLOR_C;
    [self.contentView addSubview:self.authorLabel];
}

- (void)layoutSubviews {
    [super layoutSubviews];

    CGRect rect = self.bounds;
    [self.coverImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(rect.size.width, 100)).priorityHigh();
        make.top.left.right.mas_equalTo(self.contentView);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.coverImageView.mas_bottom).mas_offset(10);
        make.left.right.mas_equalTo(self.coverImageView);
    }];
    [self.authorLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.titleLabel.mas_bottom).mas_offset(10);
        make.left.right.mas_equalTo(self.coverImageView);
        make.bottom.mas_equalTo(self.contentView);
    }];
    
}

- (void)setBookInfoCover:(YHBookInfoModel *)bookInfo {
    [self.coverImageView sd_setImageWithURL:[NSURL URLWithString:bookInfo.cover] placeholderImage:nil];
    self.titleLabel.text = bookInfo.title;
    self.authorLabel.text = bookInfo.author;
}

-(UICollectionViewLayoutAttributes *)preferredLayoutAttributesFittingAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes{
    [super setNeedsLayout];
    [super layoutIfNeeded];
    CGSize size = [self.contentView systemLayoutSizeFittingSize:layoutAttributes.size];
    CGRect newFrame = layoutAttributes.frame;
    newFrame.size.height = ceil(size.height);
    newFrame.size.width = ceil(size.width);
    layoutAttributes.frame = newFrame;
    return layoutAttributes;
}

@end
