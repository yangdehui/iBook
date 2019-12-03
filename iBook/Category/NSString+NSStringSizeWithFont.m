//
//  NSString+NSStringSizeWithFont.m
//  DKusedCar
//
//  Created by 001 on 2018/5/29.
//  Copyright © 2018年 danke. All rights reserved.
//

#import "NSString+NSStringSizeWithFont.h"
#import "PublicMacro.h"
@implementation NSString (NSStringSizeWithFont)

- (CGSize)stringSizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size;
{
    if (ISIOS7)
    {
        CGRect rect =  [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:font,NSFontAttributeName, nil] context:nil];
        return rect.size;
    }else
    {
        return [self sizeWithFont:font constrainedToSize:size lineBreakMode:NSLineBreakByCharWrapping];
    }
}

- (CGSize)stringSizeWithAttributes:(NSDictionary *)attributes constrainedToSize:(CGSize)size;
{
    return [self boundingRectWithSize:size options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
}
-(NSAttributedString *)stringWithParagraphlineSpeace:(CGFloat)lineSpacing
                                           textColor:(UIColor *)textcolor
                                            textFont:(UIFont *)font
                                           wordSpace:(CGFloat)wordSpace{
    
    
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    
    paragraphStyle.lineSpacing = lineSpacing;
    
    NSDictionary *attributes = @{ NSParagraphStyleAttributeName:paragraphStyle,NSKernAttributeName:@(wordSpace)};
    
    NSMutableAttributedString * attriStr = [[NSMutableAttributedString alloc] initWithString:self attributes:attributes];
    
    NSDictionary * attriBute = @{NSForegroundColorAttributeName:textcolor,NSFontAttributeName:font};
    [attriStr addAttributes:attriBute range:NSMakeRange(0, self.length)];
    return attriStr;
}
-(CGFloat)getSpaceLabelHeightwithSpeace:(CGFloat)lineSpeace
                               withFont:(UIFont*)font
                              withWidth:(CGFloat)width
                          withWordSpace:(CGFloat)wordSpace{
    
    NSString *oneLineString = @"测试";
    
    CGSize oneLineSize = [oneLineString stringSizeWithFont:font constrainedToSize:CGSizeMake(width,MAXFLOAT)];
    
    if (oneLineSize.height>=[self stringSizeWithFont:font constrainedToSize:CGSizeMake(width,MAXFLOAT)].height) {
        
        return oneLineSize.height;
        
    }else{
        
        NSString *newStr = [self stringByReplacingOccurrencesOfString:@" " withString:@"_"];
        
        NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
        
        paraStyle.lineBreakMode= NSLineBreakByWordWrapping;
        
        paraStyle.alignment = NSTextAlignmentLeft;
        
        paraStyle.lineSpacing = lineSpeace;
        
        NSDictionary *dic = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paraStyle, NSKernAttributeName:@(wordSpace)
                              };
        CGSize size = [newStr boundingRectWithSize:CGSizeMake(width,MAXFLOAT) options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
        
        return size.height+1;
    }
}
-(CGFloat)getHeightWithFontSize:(CGFloat)size{
    
    return  [self stringSizeWithFont:[UIFont systemFontOfSize:size] constrainedToSize:CGSizeMake(20, 20)].height;
}
@end
