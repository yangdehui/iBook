//
//  NetworkHelper.h
//  Douyin
//
//  Created by Qiao Shi on 2018/7/30.
//  Copyright © 2018年 Qiao Shi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPSessionManager.h"

//network state notification
extern NSString *const NetworkStatesChangeNotification;

extern NSString *const NetworkDomain;

typedef enum : NSInteger {
    NotReachable = 0,
    ReachableViaWiFi,
    ReachableVia4G,
    ReachableVia2G,
    ReachableVia3G
} TFNetworkStatus;

@interface NetworkHelper : NSObject
//Reachability
+ (AFNetworkReachabilityManager *)shareReachabilityManager;

+ (void)startListening;

+ (TFNetworkStatus)networkStatus;

+ (BOOL)isWifiStatus;

+ (BOOL)isNotReachableStatus:(AFNetworkReachabilityStatus)status;

@end
