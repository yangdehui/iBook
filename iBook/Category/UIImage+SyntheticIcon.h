//
//  UIImage+SyntheticIcon.h
//  ZXIMChat
//
//  Created by zikeys on 2019/5/9.
//  Copyright © 2019 zikeys. All rights reserved.
//  图片多张合成一张 ， 仿微信群头像

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (SyntheticIcon)

+ (UIImage *)groupIconWith:(NSArray *)array bgColor:(UIColor *)bgColor;
+ (UIImage *)groupIconWithURLArray:(NSArray *)URLArray bgColor:(UIColor *)bgColor;
+ (void)groupIconWithURLArray:(NSArray *)URLArray bgColor:(UIColor *)bgColor success:(void(^)(UIImage *image))succes;
@end

NS_ASSUME_NONNULL_END
