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
    [self.contentView addSubview:self.maskImageView];
    
    UIBlurEffect *blurEffect =[UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    self.effectView =[[UIVisualEffectView alloc]initWithEffect:blurEffect];
    [self.contentView addSubview:self.effectView];
    
    self.coverImageView = [[UIImageView alloc] init];
    [self.contentView addSubview:self.coverImageView];

    
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.textColor = [UIColor colorWithRed:0.59 green:0.59 blue:0.57 alpha:1.0];
    self.titleLabel.font = [UIFont systemFontOfSize:18];
    [self.contentView addSubview:self.titleLabel];
    
    self.autherLabel = [[UILabel alloc] init];
    self.autherLabel.textColor = [UIColor colorWithRed:0.59 green:0.59 blue:0.57 alpha:1.0];
    self.autherLabel.font = [UIFont systemFontOfSize:13];
    [self.contentView addSubview:self.autherLabel];
    
    self.wordCountLabel = [[UILabel alloc] init];
    self.wordCountLabel.textColor = [UIColor colorWithRed:0.59 green:0.59 blue:0.57 alpha:1.0];
    self.wordCountLabel.font = [UIFont systemFontOfSize:13];
    [self.contentView addSubview:self.wordCountLabel];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGRect bounds = self.contentView.bounds;
    CGFloat leftPadding = 8.0;
    self.maskImageView.frame = CGRectMake(0, 0, bounds.size.width, 150);
    self.effectView.frame = self.maskImageView.frame;
    self.coverImageView.frame = CGRectMake(leftPadding *2, CGRectGetMaxY(self.maskImageView.frame) - 80, 65, 100);
    
    CGFloat textMaxWidth = bounds.size.width - self.coverImageView.frame.size.width - leftPadding *2;
    CGSize titleSize = [self.titleLabel sizeThatFits:CGSizeMake(textMaxWidth, MAXFLOAT)];
    self.titleLabel.frame = CGRectMake(CGRectGetMaxX(self.coverImageView.frame) + leftPadding, CGRectGetMinY(self.coverImageView.frame) + leftPadding, titleSize.width, titleSize.height);
    
    CGSize autherSize = [self.autherLabel sizeThatFits:CGSizeMake(textMaxWidth, MAXFLOAT)];
    self.autherLabel.frame = CGRectMake(CGRectGetMaxX(self.coverImageView.frame) + leftPadding, CGRectGetMaxY(self.titleLabel.frame) + leftPadding, autherSize.width, autherSize.height);

    CGSize wordSize = [self.wordCountLabel sizeThatFits:CGSizeMake(textMaxWidth, MAXFLOAT)];
    self.wordCountLabel.frame = CGRectMake(CGRectGetMaxX(self.coverImageView.frame) + leftPadding, CGRectGetMaxY(self.autherLabel.frame) + leftPadding, wordSize.width, wordSize.height);
    
}

- (void)setBookInfo:(YHBookInfoModel *)bookInfo {
    
    [_maskImageView sd_setImageWithURL:[NSURL URLWithString:bookInfo.cover]];
    [_coverImageView sd_setImageWithURL:[NSURL URLWithString:bookInfo.cover]];
    _titleLabel.text = bookInfo.title;
    _autherLabel.text = bookInfo.author;
    _wordCountLabel.text = [NSString stringWithFormat:@"%ld万字",bookInfo.wordCount/10000];
}

@end
