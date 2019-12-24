//
//  YHBookLongIntroCell.m
//  iBook
//
//  Created by zikeys on 2019/12/16.
//  Copyright © 2019 zikeys. All rights reserved.
//

#import "YHBookLongIntroCell.h"

@interface YHBookLongIntroCell ()
@property (nonatomic, strong) UILabel *longIntroLabel;
@end

@implementation YHBookLongIntroCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews {
    
    self.longIntroLabel = [[UILabel alloc] init];
    self.longIntroLabel.textColor = TEXT_COLOR_A;
    self.longIntroLabel.font = YHBookLongIntroCell.font;
    self.longIntroLabel.numberOfLines = 1;
    self.longIntroLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:self.longIntroLabel];
}

+ (UIFont *)font{
    return [UIFont systemFontOfSize:14.0];
}

+ (UIEdgeInsets)insets{
    return UIEdgeInsetsMake(8, 15, 8, 15);
}

CGFloat lineSpacing = 5.0;

+ (CGFloat)textHeight:(NSString *)text width:(CGFloat)width{
    CGSize constrainedSize = CGSizeMake(width - self.insets.left - self.insets.right, FLT_MAX);
    
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpacing];
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    paragraphStyle.alignment = NSTextAlignmentLeft;
    
    NSDictionary *attributes=@{NSFontAttributeName:self.font,
                               NSParagraphStyleAttributeName:paragraphStyle};
    
    CGRect bounds=[text boundingRectWithSize:constrainedSize options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil];
    
    return ceil(bounds.size.height) + self.insets.top + self.insets.bottom;
}

+(CGFloat)singleLineHeight{
    return self.font.lineHeight + self.insets.top + self.insets.bottom;
}

- (void)layoutSubviews {
    [super layoutSubviews];

    CGRect bounds = self.contentView.bounds;
    _longIntroLabel.frame = UIEdgeInsetsInsetRect(bounds, YHBookLongIntroCell.insets);
}

- (void)setLongIntro:(YHBookHeaderViewModel *)longIntro {
    
    _longIntroLabel.text = longIntro.longIntro;
    
    [_longIntroLabel setText:longIntro.longIntro lines:0 andLineSpacing:lineSpacing constrainedToSize:CGSizeMake(self.frame.size.width - YHBookLongIntroCell.insets.left - YHBookLongIntroCell.insets.right, MAXFLOAT) andAttColor:0];
}

- (void)setNumberOfLines:(NSInteger)numberOfLines {
    self.longIntroLabel.numberOfLines = numberOfLines;
}

@end
