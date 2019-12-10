//
//  YHBookMallDetailViewController.m
//  iBook
//
//  Created by zikeys on 2019/12/9.
//  Copyright © 2019 zikeys. All rights reserved.
//

#import "YHBookMallDetailViewController.h"
#import <WebKit/WebKit.h>

@interface YHBookMallDetailViewController ()<WKNavigationDelegate, WKUIDelegate, WKScriptMessageHandler>
@property (nonatomic, strong) WKWebView *wkwebView;

@property (nonatomic, strong) NSURL *link;
@end

@implementation YHBookMallDetailViewController

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
    
    self.wkwebView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT_WITHOUTBAR) configuration:config];
    self.wkwebView.backgroundColor = kWhiteColor;
    self.wkwebView.navigationDelegate = self;
    self.wkwebView.UIDelegate = self;
    self.wkwebView.allowsBackForwardNavigationGestures = YES;
    [self.wkwebView loadRequest:[NSURLRequest requestWithURL:self.link]];
    [self.view addSubview:self.wkwebView];
    
    [self.wkwebView.configuration.userContentController addScriptMessageHandler:self name:@"showMessage"];

}


#pragma mark - WKScriptMessageHandler
/// 通过接收JS传出消息的name进行捕捉的回调方法
- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message {
    
    NSLog(@"");
    if ([message.name isEqualToString:@"showMessage"]) {
        
        
    }
    
}





@end
