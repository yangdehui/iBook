//
//  YHBookDirectoryCell.m
//  iBook
//
//  Created by zikeys on 2019/12/13.
//  Copyright © 2019 zikeys. All rights reserved.
//

#import "YHBookDirectoryCell.h"

@interface YHBookDirectoryCell ()
@property (nonatomic, strong) UIImageView *leftImageView;
@property (nonatomic, strong) UIImageView *rightImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *descLabel;
@end

@implementation YHBookDirectoryCell

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
    
    self.leftImageView = [[UIImageView alloc] init];
    [self.contentView addSubview:self.leftImageView];
    
    self.rightImageView = [[UIImageView alloc] init];
    [self.contentView addSubview:self.rightImageView];
    
    
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.textColor = [UIColor colorWithRed:0.59 green:0.59 blue:0.57 alpha:1.0];
    self.titleLabel.font = [UIFont systemFontOfSize:18];
    [self.contentView addSubview:self.titleLabel];
    
    self.descLabel = [[UILabel alloc] init];
    self.descLabel.textColor = [UIColor colorWithRed:0.59 green:0.59 blue:0.57 alpha:1.0];
    self.descLabel.font = [UIFont systemFontOfSize:13];
    [self.contentView addSubview:self.descLabel];
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(30, 30));
        make.top.bottom.mas_equalTo(self.contentView).inset(10);
        make.left.mas_equalTo(self.contentView).mas_offset(15);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.leftImageView.mas_right).mas_offset(10);
        make.centerY.mas_equalTo(self.contentView);
    }];
    [self.descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.titleLabel.mas_right).mas_offset(10);
        make.centerY.mas_equalTo(self.contentView);
        make.right.lessThanOrEqualTo(self.rightImageView.mas_left).mas_offset(10);
    }];
    [self.rightImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(30, 30));
        make.right.mas_equalTo(self.contentView).mas_offset(-15);
        make.centerY.mas_equalTo(self.contentView);
    }];
    
}

- (void)setDirectoryModel:(YHBookInfoModel *)directoryModel {
    self.titleLabel.text = @"目录";
    self.descLabel.text = [NSString stringWithFormat:@"共%ld章",directoryModel.chaptersCount];
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
