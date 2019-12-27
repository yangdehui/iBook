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
    self.avatarImageView.layer.cornerRadius = 10;
    self.avatarImageView.layer.masksToBounds = YES;
    self.contentMode = UIViewContentModeScaleAspectFill;
    [self.contentView addSubview:self.avatarImageView];
    
    self.nicknameLabel = [[UILabel alloc] init];
    self.nicknameLabel.font = [UIFont systemFontOfSize:13];
    self.nicknameLabel.textColor = TEXT_COLOR_C;
    self.nicknameLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:self.nicknameLabel];
    
    self.contentLabel = [[UILabel alloc] init];
    self.contentLabel.font = [UIFont systemFontOfSize:14];
    self.contentLabel.textColor = TEXT_COLOR_A;
    self.contentLabel.numberOfLines = 2;
    self.contentLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:self.contentLabel];
}

- (void)layoutSubviews {
    [super layoutSubviews];

    CGRect frame = self.bounds;
    self.avatarImageView.frame = CGRectMake(self.insets.left, self.insets.left, 20, 20);
    
    CGSize nickSize = CGSizeMake(frame.size.width - self.avatarImageView.frame.size.width - self.insets.left*3, 13);
    CGFloat nickOriginX = self.avatarImageView.frame.size.width + self.insets.left*2;
    CGFloat nickOriginY = (self.avatarImageView.frame.size.height - nickSize.height)/2 + self.insets.left;
    self.nicknameLabel.frame = CGRectMake(nickOriginX, nickOriginY, nickSize.width, nickSize.height);
    
    CGSize contentSize = CGSizeMake(frame.size.width - self.avatarImageView.frame.size.width - self.insets.left*3, 35);
    CGFloat contentOriginY = CGRectGetMaxY(self.nicknameLabel.frame) + self.insets.top;
    self.contentLabel.frame = CGRectMake(nickOriginX, contentOriginY, contentSize.width, contentSize.height);
}

- (UIEdgeInsets)insets{
    return UIEdgeInsetsMake(8, 15, 8, 15);
}

- (void)setBookReviewModel:(YHBookReviewModel *)reviewModel {
    [self.avatarImageView sd_setImageWithURL:[NSURL URLWithString:reviewModel.avatar]];
    self.nicknameLabel.text = reviewModel.nickname;
    self.contentLabel.text = reviewModel.content;
}

@end


@interface YHBookReviewScrollView ()
@property (nonatomic, copy) NSArray <YHBookReviewModel *>*reviewArray;
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

- (instancetype)initScrollViewWithFrame:(CGRect)frame reviewArray:(NSArray<YHBookReviewModel *> *)reviewArray {
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

- (void)setReviewViewModels:(NSArray<YHBookReviewModel *> *)reviewViewModels {
 
    _reviewArray = [reviewViewModels copy];
    NSArray *array = NSArray.array;
    for (YHBookReviewModel *model in reviewViewModels) {
        array = [array arrayByAddingObject:model.reviewId];
    }
    self.imageURLStringsGroup = array;
}

@end
