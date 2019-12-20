//
//  YHBookHeaderCell.m
//  iBook
//
//  Created by zikeys on 2019/12/13.
//  Copyright © 2019 zikeys. All rights reserved.
//

#import "YHBookHeaderCell.h"

@interface YHBookHeaderCell ()
@property (nonatomic, strong) UIImageView *maskImageView;
@property (nonatomic, strong) UIVisualEffectView *effectView;
@property (nonatomic, strong) UIImageView *coverImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *autherLabel;
@property (nonatomic, strong) UILabel *wordCountLabel;
@end

@implementation YHBookHeaderCell

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
    
    self.maskImageView = [[UIImageView alloc] init];
    self.maskImageView.userInteractionEnabled = true;
    [self.contentView addSubview:self.maskImageView];
    
    UIBlurEffect *blurEffect =[UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    self.effectView =[[UIVisualEffectView alloc]initWithEffect:blurEffect];
    [self.contentView addSubview:self.effectView];
    
    self.coverImageView = [[UIImageView alloc] init];
    self.coverImageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.contentView addSubview:self.coverImageView];

    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.textColor = UIColor.whiteColor;
    self.titleLabel.font = [UIFont boldSystemFontOfSize:18];
    [self.contentView addSubview:self.titleLabel];
    
    self.autherLabel = [[UILabel alloc] init];
    self.autherLabel.textColor = UIColor.flatGreenColor;;
    self.autherLabel.font = [UIFont systemFontOfSize:13];
    [self.contentView addSubview:self.autherLabel];
    
    self.wordCountLabel = [[UILabel alloc] init];
    self.wordCountLabel.textColor = UIColor.flatWhiteColor;
    self.wordCountLabel.font = [UIFont systemFontOfSize:13];
    [self.contentView addSubview:self.wordCountLabel];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGRect bounds = self.contentView.bounds;
    [self.maskImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(bounds.size.width, 150));
        make.top.centerX.mas_equalTo(self.contentView);
        make.bottom.mas_equalTo(self.contentView).mas_offset(-30);
    }];
    [self.effectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(self.maskImageView);
        make.top.centerX.mas_equalTo(self.contentView);
    }];
    [self.coverImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(65, 100));
        make.left.mas_equalTo(self.contentView).mas_offset(15);
        make.top.mas_equalTo(self.maskImageView.mas_bottom).mas_offset(-80);
    }];
    [self.wordCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.coverImageView.mas_right).mas_offset(15);
        make.right.mas_equalTo(self.contentView).mas_offset(-15);
        make.bottom.mas_equalTo(self.maskImageView).mas_offset(-5);
    }];
    [self.autherLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.coverImageView.mas_right).mas_offset(15);
        make.right.mas_equalTo(self.contentView).mas_offset(-15);
        make.bottom.mas_equalTo(self.wordCountLabel.mas_top).mas_offset(-8);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.coverImageView.mas_right).mas_offset(15);
        make.right.mas_equalTo(self.contentView).mas_offset(-15);
        make.bottom.mas_equalTo(self.autherLabel.mas_top).mas_offset(-8);
    }];
    
}

- (void)setHeaderInfo:(YHBookHeaderViewModel *)headerInfo {
    
    [_maskImageView sd_setImageWithURL:[NSURL URLWithString:headerInfo.coverUrl]];
    [_coverImageView sd_setImageWithURL:[NSURL URLWithString:headerInfo.coverUrl]];
    _titleLabel.text = headerInfo.title;
    _autherLabel.text = headerInfo.author;
    _wordCountLabel.text = [NSString stringWithFormat:@"%ld万字",headerInfo.wordCount/10000];
}

-(UICollectionViewLayoutAttributes *)preferredLayoutAttributesFittingAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes{
    [super setNeedsLayout];
    [super layoutIfNeeded];
    CGSize size = [self.contentView systemLayoutSizeFittingSize:layoutAttributes.size];
    CGRect newFrame = layoutAttributes.frame;
    // 注意: 不要修改宽度
    newFrame.size.height = ceil(size.height);
    layoutAttributes.frame = newFrame;
    return layoutAttributes;
}

@end
