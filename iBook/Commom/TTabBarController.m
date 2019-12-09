//
//  TTabBarController.m
//  TUIKit
//
//  Created by kennethmiao on 2018/11/13.
//  Copyright © 2018年 kennethmiao. All rights reserved.
//

#import "TTabBarController.h"
#import "TNavigationController.h"
#import "YHBookMallViewController.h"

@implementation TTabBarItem
@end

@interface TTabBarController ()

@end

@implementation TTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    //解决navigationtroller+tabbarcontroller，push是navigationbar变黑问题
    [UIApplication sharedApplication].keyWindow.backgroundColor = [UIColor whiteColor];
    [[UITabBar appearance] setTranslucent:NO];
}

- (void)setTabBarItems:(NSArray *)tabBarItems
{
    _tabBarItems = tabBarItems;
    //tab bar items
    NSMutableArray *controllers = [NSMutableArray array];
    for (TTabBarItem *item in _tabBarItems) {
        item.controller.tabBarItem = [[UITabBarItem alloc] initWithTitle:item.title image:item.normalImage selectedImage:item.selectedImage];
        item.controller.tabBarItem.badgeValue = item.badgeValue;
        [controllers addObject:item.controller];
    }
    self.viewControllers = controllers;
}

+ (TTabBarController *)getMainController
{
    TTabBarController *tbc = [[self alloc] init];
    tbc.tabBar.tintColor = UIColor.redColor;
    
    TTabBarItem *bookCaseItem = [[TTabBarItem alloc] init];
    bookCaseItem.title = @"书架";
    bookCaseItem.selectedImage = [UIImage imageNamed:@"tabbar_message_s"];
    bookCaseItem.normalImage = [UIImage imageNamed:@"tabbar_message"];
    bookCaseItem.controller = [[TNavigationController alloc] initWithRootViewController:[[UIViewController alloc] init]];

    TTabBarItem *bookMallItem = [[TTabBarItem alloc] init];
    bookMallItem.title = @"书城";
    bookMallItem.selectedImage = [UIImage imageNamed:@"tabbar_message_s"];
    bookMallItem.normalImage = [UIImage imageNamed:@"tabbar_message"];
    bookMallItem.controller = [[TNavigationController alloc] initWithRootViewController:[[YHBookMallViewController alloc] init]];

    TTabBarItem *contactItem = [[TTabBarItem alloc] init];
    contactItem.title = @"其他";
    contactItem.selectedImage = [UIImage imageNamed:@"tabbar_message_s"];
    contactItem.normalImage = [UIImage imageNamed:@"tabbar_message"];
    contactItem.controller = [[TNavigationController alloc] initWithRootViewController:[[UIViewController alloc] init]];

    TTabBarItem *mineItem = [[TTabBarItem alloc] init];
    mineItem.title = @"我的";
    mineItem.selectedImage = [UIImage imageNamed:@"tabbar_message_s"];
    mineItem.normalImage = [UIImage imageNamed:@"tabbar_message"];
    mineItem.controller = [[TNavigationController alloc] initWithRootViewController:[[UIViewController alloc] init]];

    tbc.tabBarItems = @[bookCaseItem, bookMallItem, contactItem, mineItem];
    return tbc;
}


@end
