//
//  UIImage+Extension.m
//  DKusedCar
//
//  Created by li on 2018/5/27.
//  Copyright © 2018年 danke. All rights reserved.
//

#import "UIImage+Extension.h"
#import <Accelerate/Accelerate.h>
#import <objc/runtime.h>
#import <ImageIO/ImageIO.h>


static NSString *alpaInfoKey;

@implementation UIImage (Extension)
/**
 *  自由拉伸一张图片
 *
 *  @param name 图片名字
 *  @param left 左边开始位置比例  值范围0-1
 *  @param top  上边开始位置比例  值范围0-1
 *
 *  @return 拉伸后的Image
 */
+ (UIImage *)resizedImageWithName:(NSString *)name left:(CGFloat)left top:(CGFloat)top
{
    UIImage *image = [UIImage imageNamed:name];
    return [image stretchableImageWithLeftCapWidth:image.size.width * left topCapHeight:image.size.height * top];
}

/**
 *  根据颜色和大小获取Image
 *
 *  @param color 颜色
 *  @param size  大小
 *
 */
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size
{
    UIGraphicsBeginImageContextWithOptions(size, 0, [UIScreen mainScreen].scale);
    [color set];
    UIRectFill(CGRectMake(0, 0, size.width, size.height));
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

/**
 *  根据图片和颜色返回一张加深颜色以后的图片
 */
+ (UIImage *)colorizeImage:(UIImage *)baseImage withColor:(UIColor *)theColor {
    
    UIGraphicsBeginImageContext(CGSizeMake(baseImage.size.width*2, baseImage.size.height*2));
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGRect area = CGRectMake(0, 0, baseImage.size.width * 2, baseImage.size.height * 2);
    
    CGContextScaleCTM(ctx, 1, -1);
    CGContextTranslateCTM(ctx, 0, -area.size.height);
    
    CGContextSaveGState(ctx);
    CGContextClipToMask(ctx, area, baseImage.CGImage);
    
    [theColor set];
    CGContextFillRect(ctx, area);
    
    CGContextRestoreGState(ctx);
    
    CGContextSetBlendMode(ctx, kCGBlendModeMultiply);
    
    CGContextDrawImage(ctx, area, baseImage.CGImage);
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newImage;
}

-(CGImageAlphaInfo)getAlphaInfo
{
    NSNumber *infoObj=objc_getAssociatedObject(self, &alpaInfoKey);
    if (!infoObj) {
        NSData *data=UIImagePNGRepresentation(self);
        if (!data) {
            data=UIImageJPEGRepresentation(self,1);
        }
        CGImageSourceRef cImageSource = CGImageSourceCreateWithData((__bridge CFDataRef)data,NULL);
        
        CFDictionaryRef imageInfo = CGImageSourceCopyPropertiesAtIndex(cImageSource, 0,NULL);
        
        id obj=CFDictionaryGetValue(imageInfo,@"HasAlpha");
        infoObj=obj?@(kCGImageAlphaNoneSkipFirst):@(kCGImageAlphaNoneSkipLast);
        objc_setAssociatedObject(self, &alpaInfoKey, infoObj, OBJC_ASSOCIATION_RETAIN);
    }
    return (CGImageAlphaInfo)[infoObj intValue];
}

/**
 *  自由改变Image的大小
 *
 *  @param size 目的大小
 *
 *  @return 修改后的Image
 */
- (UIImage *)cropImageWithSize:(CGSize)size {
    
    float scale = self.size.width/self.size.height;
    CGRect rect = CGRectMake(0, 0, 0, 0);
    
    if (scale > size.width/size.height) {
        
        rect.origin.x = (self.size.width - self.size.height * size.width/size.height)/2;
        rect.size.width  = self.size.height * size.width/size.height;
        rect.size.height = self.size.height;
        
    }else {
        
        rect.origin.y = (self.size.height - self.size.width/size.width * size.height)/2;
        rect.size.width  = self.size.width;
        rect.size.height = self.size.width/size.width * size.height;
        
    }
    
    CGImageRef imageRef   = CGImageCreateWithImageInRect(self.CGImage, rect);
    UIImage *croppedImage = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);
    
    return croppedImage;
}
/**
 * 剪切图片
 *
 *  @param image
 *
 *  @return 修改后的Image
 */
+ (UIImage *)clipImage:(UIImage *)image withRect:(CGRect)rect {
    CGRect clipFrame = rect;
    CGImageRef refImage = CGImageCreateWithImageInRect(image.CGImage, clipFrame);
    UIImage *newImage = [UIImage imageWithCGImage:refImage];
    CGImageRelease(refImage);
    return newImage;
}

- (UIImage *)applyAlpha:(CGFloat)alpha
{
    int bmpAlpha = MIN(255, MAX(0, (255*alpha)));
    UIImage *image;
    int width = self.size.width * self.scale;
    int height = self.size.height * self.scale;
    
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    if (colorspace == NULL) {
        return nil;
    }
    
    Byte *imgData = NULL;
    imgData = malloc(width * height * 4);
    if (imgData == NULL) {
        CGColorSpaceRelease(colorspace);
        return nil;
    }
    
    CGContextRef bmpContext = CGBitmapContextCreate(imgData, width, height, 8, width * 4, colorspace, (CGBitmapInfo)kCGImageAlphaPremultipliedLast);
    if (!bmpContext) {
        CGColorSpaceRelease(colorspace);
        return nil;
    }
    
    CGContextDrawImage(bmpContext, CGRectMake(0, 0, width, height), self.CGImage);
    for (long i = 0; i < width * height; i++) {
        imgData[4*i+3] = bmpAlpha;
    }
    
    CGImageRef imageRef = CGBitmapContextCreateImage(bmpContext);
    if (imageRef != NULL) {
        image = [[UIImage alloc] initWithCGImage:imageRef];
        CGImageRelease(imageRef);
    }
    
    CGColorSpaceRelease(colorspace);
    CGContextRelease(bmpContext);
    free(imgData);
    
    return image;
}

/*
-(void)readExif:(UIImage *)image
{
    NSData *data=UIImagePNGRepresentation(image);
    CGImageSourceRef cImageSource = CGImageSourceCreateWithData((__bridge CFDataRef)data,NULL);
    
    CFDictionaryRef imageInfo = CGImageSourceCopyPropertiesAtIndex(cImageSource, 0,NULL);
    
}
 */


-(NSString *)typeForImageData:(NSData *)data {
    uint8_t c;
    [data getBytes:&c length:1];
    switch (c) {
        case 0xFF:
            return @"image/jpeg";
        case 0x89:
            return @"image/png";
        case 0x47:
            return @"image/gif";
        case 0x49:
        case 0x4D:
            return @"image/tiff";
    }
    return nil;
}

- (BOOL)isARGB8888:(CGImageRef)imageRef {
    CGImageAlphaInfo alphaInfo = CGImageGetAlphaInfo(imageRef);
    BOOL isAlphaOnFirstPlace = ( kCGImageAlphaPremultipliedFirst == alphaInfo || kCGImageAlphaFirst == alphaInfo
                                || kCGImageAlphaNoneSkipFirst == alphaInfo || kCGImageAlphaNoneSkipLast == alphaInfo);
    
    return (CGImageGetBitsPerPixel(imageRef) == 32
            && CGImageGetBitsPerComponent(imageRef) == 8
            && (CGImageGetBitmapInfo(imageRef) & kCGBitmapAlphaInfoMask)
            && isAlphaOnFirstPlace);
}

- (CGContextRef)createARGBBitmapContextFromImage:(CGImageRef)inImage {
    // Get image width, height. We'll use the entire image.
    size_t pixelsWide = CGImageGetWidth(inImage);
    size_t pixelsHigh = CGImageGetHeight(inImage);
    // Declare the number of bytes per row. Each pixel in the bitmap in this
    // example is represented by 4 bytes; 8 bits each of red, green, blue, and alpha.
    size_t bitmapBytesPerRow = (pixelsWide * 4);
    size_t bitmapByteCount = (bitmapBytesPerRow * pixelsHigh);
    // Use the generic RGB color space.
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    if (colorSpace == NULL) {
        return NULL;
    }
    // Allocate memory for image data. This is the destination in memory
    // where any drawing to the bitmap context will be rendered.
    void *bitmapData = malloc(bitmapByteCount);
    if (bitmapData == NULL) {
        CGColorSpaceRelease(colorSpace);
        return NULL;
    }
    // Create the bitmap context. We want pre-multiplied ARGB, 8-bits
    // per component. Regardless of what the source image format is
    // (CMYK, Grayscale, and so on) it will be converted over to the format
    // specified here by CGBitmapContextCreate.
    CGContextRef context = CGBitmapContextCreate(bitmapData,
                                                 pixelsWide,
                                                 pixelsHigh,
                                                 8,      // bits per component
                                                 bitmapBytesPerRow,
                                                 colorSpace,
                                                 (CGBitmapInfo) kCGImageAlphaPremultipliedLast);
    if (context == NULL) {
        free(bitmapData);
    }
    // Make sure and release colorspace before returning
    CGColorSpaceRelease(colorSpace);
    return context;
}

@end
