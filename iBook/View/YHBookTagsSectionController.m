//
//  YHBookTagsSectionController.m
//  iBook
//
//  Created by zikeys on 2019/12/16.
//  Copyright © 2019 zikeys. All rights reserved.
//

#import "YHBookTagsSectionController.h"

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
    self.tagLabel.textColor = [UIColor colorWithRed:0.59 green:0.59 blue:0.57 alpha:1.0];
    self.tagLabel.font = [UIFont systemFontOfSize:13];
    self.tagLabel.layer.cornerRadius = 8;
    self.tagLabel.layer.borderColor = kRedColor.CGColor;
    self.tagLabel.layer.masksToBounds = YES;
    [self.contentView addSubview:self.tagLabel];
    
}

- (void)layoutSubviews {
    [super layoutSubviews];

    [self.tagLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.contentView).insets(UIEdgeInsetsMake(5, 5, 5, 5));
    }];
    
}

- (void)setTag:(NSString *)tag {
    self.tagLabel.text = tag;
}

-(UICollectionViewLayoutAttributes *)preferredLayoutAttributesFittingAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes{
    [super setNeedsLayout];
    [super layoutIfNeeded];
    CGSize size = [self.contentView systemLayoutSizeFittingSize:layoutAttributes.size];
    CGRect newFrame = layoutAttributes.frame;
    newFrame.size.width = ceil(size.width);
    layoutAttributes.frame = newFrame;
    return layoutAttributes;
}

@end

@interface YHBookTagsSectionController ()
@property (nonatomic, strong) NSMutableArray *tagsArray;
@property (nonatomic, copy) NSString *tag;

@end

@implementation YHBookTagsSectionController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.tagsArray = [NSMutableArray array];
    }
    return self;
}
#pragma mark - IGListSectionController Overrides

- (NSInteger)numberOfItems {
    return self.tagsArray.count;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    const CGFloat width = self.collectionContext.containerSize.width;
    CGFloat height = 50;
    return CGSizeMake(width, height);
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    YHBookTagCell * cell = [self.collectionContext dequeueReusableCellOfClass:[YHBookTagCell class] forSectionController:self atIndex:index];
    [cell setTag:self.tagsArray[index]];
    return cell;
}

- (void)didUpdateToObject:(id)object {
    _tag = object;
    [_tagsArray addObject:object];
}

@end
