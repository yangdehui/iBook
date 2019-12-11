//
//  YHRankingViewController.m
//  iBook
//
//  Created by zikeys on 2019/12/11.
//  Copyright © 2019 zikeys. All rights reserved.
//

#import "YHRankingViewController.h"
#import <WebKit/WebKit.h>

@interface YHRankingViewController ()
@property (nonatomic, strong) WKWebView *wkwebView;

@property (nonatomic, strong) NSURL *link;
@end

@implementation YHRankingViewController

- (instancetype)initWithLink:(NSString *)link {
    
    self = [super init];
    if (self) {
        self.link = [NSURL URLWithString:link];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /// 这个类主要用来做native与JavaScript的交互管理
    WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
    WKPreferences *preference = [[WKPreferences alloc]init];
    preference.javaScriptEnabled = YES;
    preference.javaScriptCanOpenWindowsAutomatically = YES;
    config.preferences = preference;
    
    _wkwebView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT_WITHOUTBAR) configuration:config];
    _wkwebView.backgroundColor = kWhiteColor;
//    _wkwebView.navigationDelegate = self;
//    _wkwebView.UIDelegate = self;
    _wkwebView.allowsBackForwardNavigationGestures = YES;
    [_wkwebView loadRequest:[NSURLRequest requestWithURL:self.link]];
    [self.view addSubview:_wkwebView];
    
}

@end
