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

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews {
    
    self.tagLabel = [[UILabel alloc] init];
    self.tagLabel.font = YHBookTagCell.font;
    self.tagLabel.textAlignment = NSTextAlignmentCenter;
    self.tagLabel.layer.borderWidth = 0.4;
    self.tagLabel.layer.cornerRadius = 3;
    self.tagLabel.layer.masksToBounds = YES;
    [self.contentView addSubview:self.tagLabel];
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGRect bounds = self.contentView.bounds;
    self.tagLabel.frame = UIEdgeInsetsInsetRect(bounds, UIEdgeInsetsZero);
}

+(UIFont *)font{
    return [UIFont systemFontOfSize:13.0];
}

+(CGFloat)textWidth:(NSString *)text width:(CGFloat)width{
    CGSize constrainedSize = CGSizeMake(width, 20);
    
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    paragraphStyle.alignment = NSTextAlignmentCenter;
    
    NSDictionary *attributes=@{NSFontAttributeName:self.font,
                               NSParagraphStyleAttributeName:paragraphStyle};
    
    CGRect bounds=[text boundingRectWithSize:constrainedSize options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil];
    
    return ceil(bounds.size.width) + 10;
}

- (void)setTagsModel:(YHBookTagsViewModel *)tagsModel index:(NSInteger)index {
    self.tagLabel.text = tagsModel.tagsArray[index];
    self.tagLabel.textColor = [tagsModel tagColorWithIndex:index];;
    self.tagLabel.layer.borderColor = [tagsModel tagColorWithIndex:index].CGColor;
}

@end
