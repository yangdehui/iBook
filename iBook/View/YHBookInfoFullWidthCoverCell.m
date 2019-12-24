//
//  YHBookInfoFullWidthCoverCell.m
//  iBook
//
//  Created by zikeys on 2019/12/24.
//  Copyright © 2019 zikeys. All rights reserved.
//

#import "YHBookInfoFullWidthCoverCell.h"

static CGFloat spacing = 8;

@interface YHBookInfoFullWidthCoverCell ()
@property (nonatomic, strong) UIImageView *coverImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@end

@implementation YHBookInfoFullWidthCoverCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews {
    
    self.coverImageView = [[UIImageView alloc] init];
    self.contentMode = UIViewContentModeScaleAspectFill;
    [self.contentView addSubview:self.coverImageView];
    
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.font = [UIFont systemFontOfSize:13];
    self.titleLabel.textColor = TEXT_COLOR_A;
    [self.contentView addSubview:self.titleLabel];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGRect frame = self.bounds;
    CGSize coverSize = CGSizeMake(frame.size.width, frame.size.height - spacing*2 - 30);
    self.coverImageView.frame = CGRectMake(0, 0, coverSize.width, coverSize.height);
    
    CGFloat titleOriginY = CGRectGetMaxY(self.coverImageView.frame) + spacing;
    CGSize titleSize = [self.titleLabel sizeThatFits:CGSizeMake(frame.size.width, 13)];
    self.titleLabel.frame = CGRectMake(0, titleOriginY, frame.size.width, ceil(titleSize.height));
    
}

- (void)setBookInfoCover:(YHBookInfoModel *)bookInfo {
    [self.coverImageView sd_setImageWithURL:[NSURL URLWithString:bookInfo.cover] placeholderImage:nil];
    self.titleLabel.text = bookInfo.title;
}

@end
