//
//  UILabel+ESLabelLineSpace.h
//  UIlabel处理行间距问题
//
//  Created by easou on 16/12/28.
//  Copyright © 2016年 kent. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (ESLabelLineSpace)

@property (nonatomic,assign,setter=setOneLine:)BOOL isOneLine;

@property (nonatomic,assign)CGSize ESLabelTextSize;
/**
 *  lines  限定行数
    lineSpacing 行间距
    labelSize
 */
- (CGSize)setText:(NSString *)text lines:(NSInteger)lines andLineSpacing:(CGFloat)lineSpacing constrainedToSize:(CGSize)labelSize andAttColor:(NSInteger)attcolor;

@end
