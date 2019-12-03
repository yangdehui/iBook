//
//  UIAlertController+YMAdd.h
//  ZXIMChat
//
//  Created by ooxx on 2019/7/15.
//  Copyright © 2019 zikeys. All rights reserved.
//
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIAlertController (YMAdd)
+(instancetype)alertControllerWithTitle:(nullable NSString *)title message:(nullable NSString *)message confirmBlock:(void (^)(void)) block;
@end

NS_ASSUME_NONNULL_END
