//
//  YHBookMallViewController.m
//  iBook
//
//  Created by zikeys on 2019/12/9.
//  Copyright © 2019 zikeys. All rights reserved.
//

#import "YHBookMallViewController.h"
#import "YHBookMallDetailViewController.h"

@interface YHBookMallViewController ()

@end

@implementation YHBookMallViewController

- (NSArray<NSString *> *)titles {
    return @[@"精选", @"男生", @"女生", @"出版"];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.menuItemWidth = 60;
        self.titleSizeSelected = 22.0;
        self.titleSizeNormal = 15;
        self.titleColorNormal = TEXT_COLOR_C;
        self.titleColorSelected = UIColor.blackColor;
        self.showOnNavigationBar = true;
        self.progressHeight = 0;
        self.progressViewWidths = @[@(20), @(30), @(20)];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:0.94
                                                green:0.94 blue:0.96 alpha:1];
}

- (void)setNavigationBar {
}

#pragma mark - WMPageControllerDataSource
- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController {
    return self.titles.count;
}

- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index {
    NSArray *navArray = @[YHBookMallDetailViewController.new,
                          YHBookMallDetailViewController.new,
                          YHBookMallDetailViewController.new,
                          YHBookMallDetailViewController.new];
    return navArray[index];
}

- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index {
    return self.titles[index];
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForMenuView:(WMMenuView *)menuView {
    CGFloat leftMargin  = 0;
    CGFloat originY     = 0;
    return CGRectMake(leftMargin, originY, SCREEN_WIDTH - 2 * leftMargin, NavBarHeight);
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForContentView:(WMScrollView *)contentView {

    return CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT_WITHOUTBAR);
}

@end
