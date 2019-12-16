//
//  YHBookLongIntroCell.m
//  iBook
//
//  Created by zikeys on 2019/12/16.
//  Copyright © 2019 zikeys. All rights reserved.
//

#import "YHBookLongIntroCell.h"

@interface YHBookLongIntroCell ()
@property (nonatomic, strong) UILabel *longIntroLabel;
@end

@implementation YHBookLongIntroCell

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
    
    self.longIntroLabel = [[UILabel alloc] init];
    self.longIntroLabel.textColor = [UIColor colorWithRed:0.59 green:0.59 blue:0.57 alpha:1.0];
    self.longIntroLabel.font = [UIFont systemFontOfSize:13];
    self.longIntroLabel.numberOfLines = 4;
    [self.contentView addSubview:self.longIntroLabel];
}

- (void)layoutSubviews {
    [super layoutSubviews];

    [self.longIntroLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView).mas_offset(10);
        make.left.mas_equalTo(self.contentView).mas_offset(15);
        make.right.mas_equalTo(self.contentView).mas_offset(-15);
        make.bottom.mas_equalTo(self.contentView).mas_offset(-15);
    }];
}

- (void)setLongIntro:(YHBookInfoModel *)longIntro {
    
    _longIntroLabel.text = longIntro.longIntro;
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
