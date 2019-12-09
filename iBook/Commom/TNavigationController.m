//
//  TNavigationController.m
//  TUIKit
//
//  Created by kennethmiao on 2018/11/13.
//  Copyright © 2018年 kennethmiao. All rights reserved.
//

#import "TNavigationController.h"

@interface TNavigationController ()

@end

@implementation TNavigationController

+(void)initialize{
    
    UINavigationBar *bar = [UINavigationBar appearance];
    //bar 的背景颜色
    bar.barTintColor=[UIColor whiteColor];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    [self.navigationBar setShadowImage:[UIImage new]];
    [self.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    //push的时候隐藏底部tabbar
    if(self.viewControllers.count != 0){
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}
@end
