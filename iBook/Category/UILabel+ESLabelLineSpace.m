//
//  UILabel+ESLabelLineSpace.m
//  UIlabel处理行间距问题
//
//  Created by easou on 16/12/28.
//  Copyright © 2016年 kent. All rights reserved.
//

#import "UILabel+ESLabelLineSpace.h"
#import <objc/runtime.h>
#import "NSMutableAttributedString+Attributes.h"

@implementation UILabel (ESLabelLineSpace)

- (BOOL)isOneLine{
    
    return [objc_getAssociatedObject(self, @selector(isOneLine)) boolValue];
}

- (void)setOneLine:(BOOL)isOneLine{
    
    objc_setAssociatedObject(self, @selector(isOneLine), [NSNumber numberWithBool:isOneLine], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)setESLabelTextSize:(CGSize)ESLabelTextSize{
    
    objc_setAssociatedObject(self, @selector(ESLabelTextSize), [NSValue valueWithCGSize:ESLabelTextSize], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGSize)ESLabelTextSize{
    
    return [objc_getAssociatedObject(self, @selector(ESLabelTextSize)) CGSizeValue];
}

- (CGSize)setText:(NSString *)text lines:(NSInteger)lines andLineSpacing:(CGFloat)lineSpacing constrainedToSize:(CGSize)labelSize andAttColor:(NSInteger)attcolor{
    
    if (!text || text.length ==0) {
        
        return CGSizeZero;
    }
    
    self.numberOfLines = lines;  //限定行数
    
    self.ESLabelTextSize = [self calculateLabelRealSizeWithText:text lines:lines font:self.font andLineSpacing:lineSpacing constrainedToSize:labelSize];

    if (self.isOneLine) {
        
        lineSpacing = 0;
    }
    //设置文字的属性
    NSMutableAttributedString * attributedString = [[NSMutableAttributedString alloc] initWithString:text];
    
    if (attcolor == 1) {
        
        [attributedString addColor:TEXT_COLOR_A substring:@"内容介绍："];
    }
    
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    
    [paragraphStyle setLineSpacing:lineSpacing];
    
    paragraphStyle.lineBreakMode = NSLineBreakByTruncatingTail;
    
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [text length])];
    
    [self setAttributedText:attributedString];
    
//    [attributedString release];
//
//    [paragraphStyle release];
    
    self.bounds = CGRectMake(0, 0, self.ESLabelTextSize.width, self.ESLabelTextSize.height);
    
    if (!self.isOneLine) {
        
        [self sizeToFit];
    }
    return self.frame.size;
}


//真正计算文本占用的size
- (CGSize)calculateLabelRealSizeWithText:(NSString *)text lines:(NSInteger)lines font:(UIFont*)font andLineSpacing:(CGFloat)lineSpacing constrainedToSize:(CGSize)cSize{
    
    self.isOneLine = NO;

    NSString *firstWord = [text substringToIndex:1];
    
    CGFloat oneRowHeight = [firstWord sizeWithAttributes:@{NSFontAttributeName:font}].height;
    
    CGSize textSize = [text boundingRectWithSize:cSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil].size;
    
    NSInteger rows = textSize.height / oneRowHeight;
    
    CGFloat realHeight = oneRowHeight;
    
// 0 不限制行数
    if (lines == 0) {
        
        if (rows >= 1) {
            
            realHeight = (rows * oneRowHeight) + (rows - 1) * lineSpacing;
        }
        
    }else{
        
        if (rows >= lines) {
            
            rows = lines;
        }
        realHeight = (rows * oneRowHeight) + (rows - 1) * lineSpacing;
    }
    
    if (realHeight - oneRowHeight<=0) {
        
        self.isOneLine = YES;
        
    }
    return CGSizeMake(textSize.width, realHeight);
}

@end
