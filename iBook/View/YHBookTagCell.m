//
//  YHBookTagCell.m
//  iBook
//
//  Created by zikeys on 2019/12/17.
//  Copyright © 2019 zikeys. All rights reserved.
//

#import "YHBookTagCell.h"

@interface YHBookTagCell ()
@property (nonatomic, strong) UILabel *tagLabel;
@end

@implementation YHBookTagCell

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
    
    self.tagLabel = [[UILabel alloc] init];
    self.tagLabel.font = [UIFont systemFontOfSize:13];
    self.tagLabel.textAlignment = NSTextAlignmentCenter;
    self.tagLabel.layer.borderWidth = 0.6;
    self.tagLabel.layer.cornerRadius = 3;
    self.tagLabel.layer.masksToBounds = YES;
    [self.contentView addSubview:self.tagLabel];
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.tagLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.contentView);
    }];
    
}

- (void)setTagsModel:(YHBookTagsViewModel *)tagsModel index:(NSInteger)index {
    self.tagLabel.text = tagsModel.tagsArray[index];
    self.tagLabel.textColor = [tagsModel tagColorWithIndex:index];;
    self.tagLabel.layer.borderColor = [tagsModel tagColorWithIndex:index].CGColor;
}

-(UICollectionViewLayoutAttributes *)preferredLayoutAttributesFittingAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes{
    [super setNeedsLayout];
    [super layoutIfNeeded];
    CGSize size = [self.contentView systemLayoutSizeFittingSize:layoutAttributes.size];
    CGRect newFrame = layoutAttributes.frame;
    newFrame.size.width = ceil(size.width) + 10;
    layoutAttributes.frame = newFrame;
    return layoutAttributes;
}

@end
