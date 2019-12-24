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
    
    CGRect frame = self.bounds;
    self.lineLabel.frame = CGRectMake(0, 0, frame.size.width, 0.5);
    self.contentButton.frame = frame;
}

- (void)setContentButton:(NSString *)title icon:(NSString *)icon imagePosition:(imagePosition)imagePosition {
    [self.contentButton setTitle:title forState:UIControlStateNormal];
    [self.contentButton setImage:[UIImage imageNamed:icon] forState:UIControlStateNormal];
    [self.contentButton setImagePosition:imagePosition spacing:5];
}

@end
