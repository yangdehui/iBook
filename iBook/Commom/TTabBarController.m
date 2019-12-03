//
//  TTabBarController.m
//  TUIKit
//
//  Created by kennethmiao on 2018/11/13.
//  Copyright © 2018年 kennethmiao. All rights reserved.
//

#import "TTabBarController.h"
#import "TNavigationController.h"

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
    
//    TTabBarItem *msgItem = [[TTabBarItem alloc] init];
//    msgItem.title = @"曾聊";
//    msgItem.selectedImage = [UIImage imageNamed:@"tabbar_message_s"];
//    msgItem.normalImage = [UIImage imageNamed:@"tabbar_message"];
//    msgItem.controller = [[TNavigationController alloc] initWithRootViewController:[[ConversationController alloc] init]];
//
//    TTabBarItem *contactItem = [[TTabBarItem alloc] init];
//    contactItem.title = @"曾友";
//    contactItem.selectedImage = [UIImage imageNamed:@"tabbar_contact_s"];
//    contactItem.normalImage = [UIImage imageNamed:@"tabbar_contact"];
//    NSInteger badge = YMFriendshipManager.sharedManager.unReadRequsetcount;
//    contactItem.badgeValue = badge == 0 ? nil : @(badge).stringValue;
//    YMContactViewController *CVC = [[UIStoryboard storyboardWithName:@"YMChat" bundle:nil] instantiateViewControllerWithIdentifier:@"YMContactViewController"];
//    contactItem.controller = [[TNavigationController alloc] initWithRootViewController:CVC];
//
//    TTabBarItem *discoverItem = [[TTabBarItem alloc] init];
//    discoverItem.title = @"发现";
//    discoverItem.selectedImage = [UIImage imageNamed:@"tabbar_discover_s"];
//    discoverItem.normalImage = [UIImage imageNamed:@"tabbar_discover"];
//    discoverItem.controller = [[TNavigationController alloc] initWithRootViewController:[[DiscoverController alloc] init]];
//
//    TTabBarItem *myItem = [[TTabBarItem alloc] init];
//    myItem.title = @"我";
//    myItem.selectedImage = [UIImage imageNamed:@"tabbar_personal_s"];
//    myItem.normalImage = [UIImage imageNamed:@"tabbar_personal"];
//    myItem.controller = [[TNavigationController alloc] initWithRootViewController:[[PersonalController alloc] init]];
//
//    tbc.tabBarItems = @[msgItem, contactItem, discoverItem, myItem];
//    // 未读数刷新同步
//    [[IMConversationManager sharedInstance] asyncConversationList];
    return tbc;
}


@end
