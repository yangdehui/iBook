//
//  YHBookInfoSectionFooterCell.m
//  iBook
//
//  Created by zikeys on 2019/12/19.
//  Copyright © 2019 zikeys. All rights reserved.
//

#import "YHBookInfoSectionFooterCell.h"

@interface YHBookInfoSectionFooterCell ()
@property (nonatomic, strong) UIButton *contentButton;
@property (nonatomic, strong) UILabel *lineLabel;
@end

@implementation YHBookInfoSectionFooterCell

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
    
    self.contentButton = [[UIButton alloc] init];
    self.contentButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.contentButton setTitleColor:TEXT_COLOR_A forState:UIControlStateNormal];
    [self.contentView addSubview:self.contentButton];
    
    self.lineLabel = [[UILabel alloc] init];
    self.lineLabel.backgroundColor = TEXT_COLOR_D;
    [self.contentView addSubview:self.lineLabel];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGRect rect = self.bounds;
    [self.lineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(self.contentView);
        make.height.mas_equalTo(0.5);
    }];
    [self.contentButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(rect.size.width, 30)).priorityHigh();
        make.top.bottom.mas_equalTo(self.contentView).inset(10);
        make.centerX.mas_equalTo(self.contentView);
    }];
    
}

- (void)setContentButton:(NSString *)title icon:(NSString *)icon {
    [self.contentButton setTitle:title forState:UIControlStateNormal];
    [self.contentButton setImage:[UIImage imageNamed:icon] forState:UIControlStateNormal];
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
