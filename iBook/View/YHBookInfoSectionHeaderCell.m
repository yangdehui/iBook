//
//  YHBookInfoSectionHeaderCell.m
//  iBook
//
//  Created by zikeys on 2019/12/19.
//  Copyright © 2019 zikeys. All rights reserved.
//

#import "YHBookInfoSectionHeaderCell.h"

@interface YHBookInfoSectionHeaderCell ()
@property (nonatomic, strong) UILabel *separatorLabel;
@property (nonatomic, strong) UILabel *leftLabel;
@property (nonatomic, strong) UIButton *rightButton;
@property (nonatomic, strong) UILabel *lineLabel;
@end

@implementation YHBookInfoSectionHeaderCell

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
    
    self.leftLabel = [[UILabel alloc] init];
    self.leftLabel.font = [UIFont systemFontOfSize:14];
    self.leftLabel.textColor = TEXT_COLOR_A;
    [self.contentView addSubview:self.leftLabel];
    
    self.rightButton = [[UIButton alloc] init];
    [self.rightButton setTitleColor:UIColor.flatGreenColor forState:UIControlStateNormal];
    [self.rightButton.titleLabel setFont:[UIFont systemFontOfSize:12]];
    self.rightButton.contentMode = UIViewContentModeRight;
    [self.contentView addSubview:self.rightButton];
    
    self.lineLabel = [[UILabel alloc] init];
    self.lineLabel.backgroundColor = TEXT_COLOR_D;
    [self.contentView addSubview:self.lineLabel];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGRect frame = self.bounds;
    CGSize separatorSize = CGSizeMake(3, 13);
    self.separatorLabel.frame = CGRectMake(0, (frame.size.height - separatorSize.height)/2, separatorSize.width, separatorSize.height);
    
    CGSize leftSize = [self.leftLabel sizeThatFits:CGSizeMake(frame.size.width, 14)];
    self.leftLabel.frame = CGRectMake(self.insets.left, (frame.size.height - leftSize.height)/2, leftSize.width, leftSize.height);
    
    CGSize rightSize = [self.rightButton sizeThatFits:CGSizeMake(frame.size.width, 12)];
    self.rightButton.frame = CGRectMake(frame.size.width - self.insets.left - rightSize.width, (frame.size.height - rightSize.height)/2, rightSize.width, rightSize.height);
    
    self.lineLabel.frame = CGRectMake(0, frame.size.height - 0.5, frame.size.width, 0.5);
}

- (UIEdgeInsets)insets{
    return UIEdgeInsetsMake(8, 15, 8, 15);
}

- (void)setLeftTitle:(NSString *)title {
    self.leftLabel.text = title;
}

- (void)setRightButton:(NSString *)title icon:(NSString *)icon {
    [self.rightButton setTitle:title forState:UIControlStateNormal];
    [self.rightButton setImage:[UIImage imageNamed:icon] forState:UIControlStateNormal];
}

- (void)setLineHidden {
    self.lineLabel.hidden = YES;
}

@end
