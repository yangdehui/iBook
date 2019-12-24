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
@property (nonatomic, strong) UILabel *lineLabel;
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
    self.leftImageView.image = [UIImage imageNamed:@"book_mulu"];
    [self.contentView addSubview:self.leftImageView];
    
    self.rightImageView = [[UIImageView alloc] init];
    self.rightImageView.image = [UIImage imageNamed:@"book_right"];
    [self.contentView addSubview:self.rightImageView];
    
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.textColor = TEXT_COLOR_A;
    self.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:self.titleLabel];
    
    self.descLabel = [[UILabel alloc] init];
    self.descLabel.textColor = TEXT_COLOR_C;
    self.descLabel.font = [UIFont systemFontOfSize:13];
    [self.contentView addSubview:self.descLabel];
    
    self.lineLabel = [[UILabel alloc] init];
    self.lineLabel.backgroundColor = TEXT_COLOR_D;
    [self.contentView addSubview:self.lineLabel];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGRect frame = self.bounds;
    self.leftImageView.frame = CGRectMake(self.insets.left, [self originY:self.imageSize.height], self.imageSize.width, self.imageSize.height);
    
    CGFloat titleOriginX = CGRectGetMaxX(self.leftImageView.frame) + self.insets.left;
    CGSize titleSize = [self.descLabel sizeThatFits:CGSizeMake(frame.size.width, 14)];
    self.titleLabel.frame = CGRectMake(titleOriginX, [self originY:14], titleSize.width, titleSize.height);
    
    CGFloat descOriginX = CGRectGetMaxX(self.titleLabel.frame) + self.insets.left;
    CGSize descSize = [self.descLabel sizeThatFits:CGSizeMake(frame.size.width, 13)];
    self.descLabel.frame = CGRectMake(descOriginX, [self originY:13], descSize.width, descSize.height);
    
    CGFloat rightImageOriginX = frame.size.width - self.imageSize.width - self.insets.left;
    self.rightImageView.frame = CGRectMake(rightImageOriginX, [self originY:self.imageSize.height], self.imageSize.width, self.imageSize.height);
    
    self.lineLabel.frame = CGRectMake(self.insets.left, frame.size.height - 0.5, frame.size.width - self.insets.left, 0.5);
}

- (CGFloat)originY:(CGFloat)height {
    return (self.bounds.size.height - height)/2;
}

- (CGSize)imageSize {
    return CGSizeMake(16, 16);
}

- (UIEdgeInsets)insets{
    return UIEdgeInsetsMake(8, 15, 8, 15);
}

- (void)setDirectoryModel:(YHBookHeaderViewModel *)directoryModel {
    self.titleLabel.text = @"目录";
    self.descLabel.text = [NSString stringWithFormat:@"共%ld章",directoryModel.chaptersCount];
}

@end
