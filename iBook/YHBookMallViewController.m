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
    return @[@"精选", @"男生", @"女生", @"免费", @"新书", @"出版"];
}

- (NSArray<NSString *> *)links {
    return @[@"https://h5.zhuishushenqi.com/v2/index3.html?id=e5fe6058afa449e4a8b9b3fb843c2bcd&posCode=B1&version=15&&platform=ios", @"https://h5.zhuishushenqi.com/v2/explore2.html?id=d9a25e6f474146c38f78688d14930a50&posCode=B1&version=15&platform=ios", @"https://h5.zhuishushenqi.com/v2/explore2.html?id=d322f092a8104c9784feff4680ef18c1&posCode=B1&version=15&platform=ios", @"https://h5.zhuishushenqi.com/v2/free.html?posCode=B1&version=15&platform=ios", @"https://h5.zhuishushenqi.com/v2/explore2.html?id=17c764e8aaa54d50bf59b0fd8373b400&posCode=B1&version=15&platform=ios",
        @"https://h5.zhuishushenqi.com/v2/explore2.html?id=c593c40b08414ca5b9d9b28851f60de1&posCode=B1&version=15&platform=ios"];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.menuItemWidth = 60;
        self.titleSizeSelected = 22.0;
        self.titleSizeNormal = 15;
        self.titleColorNormal = TEXT_COLOR_C;
        self.titleFontName = @"Arial-BoldMT";
        self.titleColorSelected = UIColor.blackColor;
        self.showOnNavigationBar = true;
        self.progressHeight = 0;
        self.progressViewWidths = @[@(20), @(20), @(20), @(20), @(20)];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = kWhiteColor;
}

- (void)setNavigationBar {
}

#pragma mark - WMPageControllerDataSource
- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController {
    return self.titles.count;
}

- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index {

    return [[YHBookMallDetailViewController alloc] initWithLink:self.links[index]];
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

    return CGRectMake(0, 10, SCREEN_WIDTH, SCREEN_HEIGHT_WITHOUTBAR);
}

@end
