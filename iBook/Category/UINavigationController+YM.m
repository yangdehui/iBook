//
//  UINavigationController+YM.m
//  ZXIMChat
//
//  Created by ooxx on 2019/6/4.
//  Copyright © 2019 zikeys. All rights reserved.
//

#import "UINavigationController+YM.h"

@implementation UINavigationController (YM)
- (void)ym_pushViewController:(UIViewController *)viewController animated:(BOOL)animated completion:(void (^)(void))completion{
    [CATransaction begin];
    [CATransaction setCompletionBlock:completion];
    [self pushViewController:viewController animated:animated];
    [CATransaction commit];
}
@end
