//
//  UIView+DKExtension.m
//  DKusedCar
//
//  Created by li on 2018/5/27.
//  Copyright © 2018年 danke. All rights rDKerved.
//

#import "UIView+DKExtension.h"
#import <objc/runtime.h>

@implementation UIView (DKExtension)

- (void)setDk_x:(CGFloat)dk_x
{
    CGRect frame = self.frame;
    frame.origin.x = dk_x;
    self.frame = frame;
}

- (CGFloat)dk_x
{
    return self.dk_origin.x;
}

- (void)setDk_centerX:(CGFloat)dk_centerX
{
    CGPoint center = self.center;
    center.x = dk_centerX;
    self.center = center;
}

- (CGFloat)dk_centerX
{
    return self.center.x;
}

- (void)setDk_centerY:(CGFloat)dk_centerY
{
    CGPoint center = self.center;
    center.y = dk_centerY;
    self.center = center;
}

- (CGFloat)dk_centerY
{
    return self.center.y;
}

- (void)setDk_y:(CGFloat)dk_y
{
    CGRect frame = self.frame;
    frame.origin.y = dk_y;
    self.frame = frame;
}

- (CGFloat)dk_y
{
    return self.frame.origin.y;
}

- (void)setDk_size:(CGSize)dk_size
{
    CGRect frame = self.frame;
    frame.size = dk_size;
    self.frame = frame;
}

- (CGSize)dk_size
{
    return self.frame.size;
}

- (void)setDk_height:(CGFloat)dk_height
{
    CGRect frame = self.frame;
    frame.size.height = dk_height;
    self.frame = frame;
}

- (CGFloat)dk_height
{
    return self.frame.size.height;
}

- (void)setDk_width:(CGFloat)dk_width
{
    CGRect frame = self.frame;
    frame.size.width = dk_width;
    self.frame = frame;
}

- (CGFloat)dk_width
{
    return self.frame.size.width;
}

- (void)setDk_origin:(CGPoint)dk_origin
{
    CGRect frame = self.frame;
    frame.origin = dk_origin;
    self.frame = frame;
}

- (CGPoint)dk_origin
{
    return self.frame.origin;
}

- (void)setDk_right:(CGFloat)dk_right
{
    CGRect rect = self.frame;
    rect.origin.x = dk_right - rect.size.width;
    self.frame = rect;
}

- (CGFloat)dk_right
{
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setDk_bottom:(CGFloat)dk_bottom
{
    CGRect rect = self.frame;
    rect.origin.y = dk_bottom - rect.size.height;
    self.frame = rect;
}

- (CGFloat)dk_bottom
{
    return self.frame.origin.y + self.frame.size.height;
}

@end
