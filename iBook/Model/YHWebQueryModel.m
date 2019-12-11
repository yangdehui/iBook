//
//  YHWebQueryModel.m
//  iBook
//
//  Created by zikeys on 2019/12/11.
//  Copyright © 2019 zikeys. All rights reserved.
//

#import "YHWebQueryModel.h"

@implementation YHWebQueryModel

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"bookId" : @"id"};
}

- (BOOL)modelCustomTransformFromDictionary:(NSDictionary *)dic {
    
    NSString *jumpType = dic[@"jumpType"];
    NSString *pageType = dic[@"pageType"];

    if ([jumpType isEqualToString:@"native"]) {
        _jumpType = YHJumpType_Native;
    }
    else if ([jumpType isEqualToString:@"webview"]) {
        _jumpType = YHJumpType_WebView;
    }
    
    if ([pageType isEqualToString:@"category"]) {
        _pageType = YHPageType_Category;
    }
    else if ([pageType isEqualToString:@"ranking"]) {
        _pageType = YHPageType_Ranking;
    }
    else if ([pageType isEqualToString:@"booklist"]) {
        _pageType = YHPageType_BookList;
    }
    else if ([pageType isEqualToString:@"bookDetail"]) {
        _pageType = YHPageType_BookDetail;
    }
    return YES;
}

@end
