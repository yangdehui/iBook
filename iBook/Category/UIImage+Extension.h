//
//  UIImage+Extension.h
//  DKusedCar
//
//  Created by li on 2018/5/27.
//  Copyright © 2018年 danke. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)
+ (UIImage *)resizedImageWithName:(NSString *)name left:(CGFloat)left top:(CGFloat)top;
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;
+ (UIImage *)colorizeImage:(UIImage *)baseImage withColor:(UIColor *)theColor;
-(CGImageAlphaInfo)getAlphaInfo;
- (UIImage *)cropImageWithSize:(CGSize)size;
+ (UIImage *)clipImage:(UIImage *)image withRect:(CGRect)rect;
- (UIImage *)applyAlpha:(CGFloat)alpha;
//-(void)readExif:(UIImage *)image;
-(NSString *)typeForImageData:(NSData *)data;
@end
