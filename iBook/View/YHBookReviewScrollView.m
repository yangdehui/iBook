//
//  YHBookReviewScrollView.m
//  iBook
//
//  Created by zikeys on 2019/12/18.
//  Copyright © 2019 zikeys. All rights reserved.
//

#import "YHBookReviewScrollView.h"

@interface YHBookReviewScrollCell ()
@property (nonatomic, strong) UIImageView *avatarImageView;
@property (nonatomic, strong) UILabel *nicknameLabel;
@property (nonatomic, strong) UILabel *contentLabel;
@end

@implementation YHBookReviewScrollCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews {
    
    self.avatarImageView = [[UIImageView alloc] init];
    self.avatarImageView.layer.cornerRadius = 12.5;
    self.avatarImageView.layer.masksToBounds = YES;
    [self.contentView addSubview:self.avatarImageView];
    
    self.nicknameLabel = [[UILabel alloc] init];
    self.nicknameLabel.font = [UIFont systemFontOfSize:13];
    self.nicknameLabel.textColor = TEXT_COLOR_C;
    [self.contentView addSubview:self.nicknameLabel];
    
    self.contentLabel = [[UILabel alloc] init];
    self.contentLabel.font = [UIFont systemFontOfSize:14];
    self.contentLabel.textColor = TEXT_COLOR_A;
    self.contentLabel.numberOfLines = 2;
    [self.contentView addSubview:self.contentLabel];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.avatarImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(25, 25)).priorityHigh();
        make.top.left.mas_equalTo(self.contentView).mas_offset(20);
    }];
    [self.nicknameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.avatarImageView.mas_centerY);
        make.left.mas_equalTo(self.avatarImageView.mas_right).mas_offset(15);
        make.right.mas_equalTo(self.contentView).mas_offset(-15);
    }];
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.nicknameLabel.mas_bottom).mas_offset(10);
        make.left.mas_equalTo(self.nicknameLabel.mas_left);
        make.right.mas_equalTo(self.contentView).mas_offset(-20);
        make.bottom.mas_equalTo(self.contentView).mas_offset(-20);
    }];
    
}

- (void)setBookReviewModel:(YHBookReviewModel *)reviewModel {
    [self.avatarImageView sd_setImageWithURL:[NSURL URLWithString:reviewModel.avatar]];
    self.nicknameLabel.text = reviewModel.nickname;
    self.contentLabel.text = reviewModel.content;
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


@interface YHBookReviewScrollView ()
@property (nonatomic, strong) NSArray <YHBookReviewViewModel *>*reviewArray;
@end
@implementation YHBookReviewScrollView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.delegate = self;
        self.showPageControl = false;
        self.autoScrollTimeInterval = 3;
        self.backgroundColor = UIColor.whiteColor;
        self.scrollDirection = UICollectionViewScrollDirectionVertical;
        [self disableScrollGesture];
    }
    return self;
}

- (instancetype)initScrollViewWithFrame:(CGRect)frame reviewArray:(NSArray<YHBookReviewViewModel *> *)reviewArray {
    self = [super initWithFrame:frame];
    if (self) {
        self.delegate = self;
        self.showPageControl = false;
        self.autoScrollTimeInterval = 3;
        self.backgroundColor = UIColor.whiteColor;
        self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        self.reviewArray = [reviewArray copy];
        [self disableScrollGesture];
    }
    return self;
}

- (Class)customCollectionViewCellClassForCycleScrollView:(SDCycleScrollView *)view {
    return YHBookReviewScrollCell.class;
}

- (void)setupCustomCell:(UICollectionViewCell *)cell forIndex:(NSInteger)index cycleScrollView:(SDCycleScrollView *)view {
    [(YHBookReviewScrollCell *)cell setBookReviewModel:[self.reviewArray objectAtIndex:index]];
}

- (void)setReviewViewModels:(NSArray<YHBookReviewViewModel *> *)reviewViewModels {
    _reviewArray = [reviewViewModels copy];
    self.imageURLStringsGroup = @[@"",@"",@"",@""];
}

@end
