//
//  YHBookMallDetailViewController.m
//  iBook
//
//  Created by zikeys on 2019/12/9.
//  Copyright © 2019 zikeys. All rights reserved.
//

#import "YHBookMallDetailViewController.h"
#import "YHRankingViewController.h"
#import "YHBookDetailViewController.h"
#import "YHWebQueryModel.h"
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
    
    //这个类主要用来做native与JavaScript的交互管理
    WKUserContentController * wkUController = [[WKUserContentController alloc] init];
    //注册一个name为jsToOcNoPrams的js方法，设置处理接收JS方法的代理
    
    [wkUController addScriptMessageHandler:self  name:@"ZssqApi"];
    [wkUController addScriptMessageHandler:self  name:@"jsToOcWithPrams"];
    config.userContentController = wkUController;
    //用完记得移除
    //移除注册的js方法
//    [[_wkwebView configuration].userContentController removeScriptMessageHandlerForName:@"jsToOcNoPrams"];
//    [[_wkwebView configuration].userContentController removeScriptMessageHandlerForName:@"jsToOcWithPrams"];
    
    _wkwebView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT_WITHOUTBAR) configuration:config];
    _wkwebView.backgroundColor = kWhiteColor;
    _wkwebView.navigationDelegate = self;
    _wkwebView.UIDelegate = self;
    _wkwebView.allowsBackForwardNavigationGestures = YES;
    [_wkwebView loadRequest:[NSURLRequest requestWithURL:self.link]];
    [self.view addSubview:_wkwebView];
    
}

#pragma mark - WKNavigationDelegate

// 页面开始加载时调用
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {
}
// 页面加载失败时调用
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error {
//    [self.progressView setProgress:0.0f animated:NO];
}
// 当内容开始返回时调用
- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation {
}
// 页面加载完成之后调用
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
//    [self getCookie];
}
//提交发生错误时调用
- (void)webView:(WKWebView *)webView didFailNavigation:(WKNavigation *)navigation withError:(NSError *)error {
//    [self.progressView setProgress:0.0f animated:NO];
}
// 接收到服务器跳转请求即服务重定向时之后调用
- (void)webView:(WKWebView *)webView didReceiveServerRedirectForProvisionalNavigation:(WKNavigation *)navigation {
}
// 在发送请求之前，决定是否跳转
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    
    NSString * urlStr = navigationAction.request.URL.absoluteString;
    //自己定义的协议头
    NSString *htmlHeadString = @"jsbridge://";
    if([urlStr hasPrefix:htmlHeadString]){
        
        NSURLComponents *urlComp = [NSURLComponents componentsWithString:urlStr];
        for (NSURLQueryItem *item in urlComp.queryItems) {
            if ([item.name isEqualToString:@"param"]) {

                YHWebQueryModel *queryModel = [YHWebQueryModel modelWithJSON:item.value];
                [self judgeNativeOrWebView:queryModel];
            }
        }
        decisionHandler(WKNavigationActionPolicyCancel);
    }else{
        decisionHandler(WKNavigationActionPolicyAllow);
    }
}

// 在收到响应后，决定是否跳转和发送请求之前那个允许配套使用
- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler{
    decisionHandler(WKNavigationResponsePolicyAllow);
}

//需要响应身份验证时调用 同样在block中需要传入用户身份凭证
- (void)webView:(WKWebView *)webView didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition disposition, NSURLCredential * _Nullable credential))completionHandler{
    //用户身份信息
    NSURLCredential * newCred = [[NSURLCredential alloc] initWithUser:@"user123" password:@"123" persistence:NSURLCredentialPersistenceNone];
    //为 challenge 的发送方提供 credential
    [challenge.sender useCredential:newCred forAuthenticationChallenge:challenge];
    completionHandler(NSURLSessionAuthChallengeUseCredential,newCred);
}
//进程被终止时调用
- (void)webViewWebContentProcessDidTerminate:(WKWebView *)webView{
}



#pragma mark - WKScriptMessageHandler
/// 通过接收JS传出消息的name进行捕捉的回调方法
- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message {
}

#pragma mark - 原生&H5事件

- (void)judgeNativeOrWebView:(YHWebQueryModel *)queryModel {
    
    if (queryModel.jumpType == YHJumpType_Native) {
        
        switch (queryModel.pageType) {
            case YHPageType_BookDetail:
            {
                YHBookDetailViewController *bookDetailVc = [[YHBookDetailViewController alloc] initWithBookID:queryModel.bookId];
                [self.navigationController pushViewController:bookDetailVc animated:YES];
            }
                break;
                
            default:
                break;
        }
    }
    else if (queryModel.jumpType == YHJumpType_WebView) {
        
        switch (queryModel.pageType) {
            case YHPageType_Ranking:
            {
                YHRankingViewController *rankingVc = [[YHRankingViewController alloc] initWithLink:queryModel.link];
                [self.navigationController pushViewController:rankingVc animated:YES];
            }
                break;
            case YHPageType_BookList:
            {
                
            }
                break;
            default:
                break;
        }
    }
}



@end
