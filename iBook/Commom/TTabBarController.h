//
//  TTabBarController.h
//  TUIKit
//
//  Created by kennethmiao on 2018/11/13.
//  Copyright © 2018年 kennethmiao. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface TTabBarItem : NSObject
@property (nonatomic, strong) UIImage *normalImage;
@property (nonatomic, strong) UIImage *selectedImage;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *badgeValue;
@property (nonatomic, strong) UIViewController *controller;
@end

@interface TTabBarController : UITabBarController
@property (nonatomic, strong) NSArray *tabBarItems;

+ (TTabBarController *)getMainController;
@end
