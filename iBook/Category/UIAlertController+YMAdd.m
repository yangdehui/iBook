//
//  UIAlertController+YMAdd.m
//  ZXIMChat
//
//  Created by ooxx on 2019/7/15.
//  Copyright © 2019 zikeys. All rights reserved.
//

#import "UIAlertController+YMAdd.h"

@implementation UIAlertController (YMAdd)
+(instancetype)alertControllerWithTitle:(NSString *)title message:(NSString *)message confirmBlock:(void (^)(void)) block{
    UIAlertController *AC = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    [AC addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        ;
    }]];
    [AC addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        if (block) { block(); }
    }]];
    return AC;
}
@end
