//
//  NSString+NSStringSizeWithFont.h
//  DKusedCar
//
//  Created by 001 on 2018/5/29.
//  Copyright © 2018年 danke. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (NSStringSizeWithFont)

- (CGSize)stringSizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size;
- (CGSize)stringSizeWithAttributes:(NSDictionary *)attributes constrainedToSize:(CGSize)size;

-(NSAttributedString *)stringWithParagraphlineSpeace:(CGFloat)lineSpacing
                                           textColor:(UIColor *)textcolor
                                            textFont:(UIFont *)font
                                           wordSpace:(CGFloat)wordSpace;

-(CGFloat)getSpaceLabelHeightwithSpeace:(CGFloat)lineSpeace
                               withFont:(UIFont*)font
                              withWidth:(CGFloat)width
                          withWordSpace:(CGFloat)wordSpace;

-(CGFloat)getHeightWithFontSize:(CGFloat)size;

@end
