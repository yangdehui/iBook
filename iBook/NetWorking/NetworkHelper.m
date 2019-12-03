//
//  NetworkHelper.m
//  Douyin
//
//  Created by Qiao Shi on 2018/7/30.
//  Copyright © 2018年 Qiao Shi. All rights reserved.
//

#import "NetworkHelper.h"
#import <CoreTelephony/CTTelephonyNetworkInfo.h>

NSString *const NetworkStatesChangeNotification = @"NetworkStatesChangeNotification";

NSString *const NetworkDomain = @"com.start.qiqituo";


@implementation NetworkHelper

+ (void)load
{
    __block id observer =
    [[NSNotificationCenter defaultCenter]
     addObserverForName:UIApplicationDidFinishLaunchingNotification
     object:nil
     queue:nil
     usingBlock:^(NSNotification *note) {
         [self startListening]; // Do whatever you want
         [[NSNotificationCenter defaultCenter] removeObserver:observer];
     }];
}

//Reachability
+ (void)startListening {
    [AFNetworkReachabilityManager.sharedManager startMonitoring];
    [AFNetworkReachabilityManager.sharedManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        [[NSNotificationCenter defaultCenter] postNotificationName:NetworkStatesChangeNotification object:nil];
    }];
}

+ (TFNetworkStatus)networkStatus {
    TFNetworkStatus status = 0;
    switch (AFNetworkReachabilityManager.sharedManager.networkReachabilityStatus) {
        case AFNetworkReachabilityStatusNotReachable:
            {status = NotReachable;}
            break;
        case AFNetworkReachabilityStatusReachableViaWiFi:
            {status = ReachableViaWiFi;}
            break;
        case AFNetworkReachabilityStatusReachableViaWWAN:
            {
                CTTelephonyNetworkInfo *telephonyInfo = [CTTelephonyNetworkInfo new];
                if ([telephonyInfo.currentRadioAccessTechnology isEqualToString:CTRadioAccessTechnologyLTE])
                {
                    status = ReachableVia4G;
                }
                else if ([telephonyInfo.currentRadioAccessTechnology isEqualToString:CTRadioAccessTechnologyHSDPA]||[telephonyInfo.currentRadioAccessTechnology isEqualToString:CTRadioAccessTechnologyHSUPA]||[telephonyInfo.currentRadioAccessTechnology isEqualToString:CTRadioAccessTechnologyCDMA1x]||[telephonyInfo.currentRadioAccessTechnology isEqualToString:CTRadioAccessTechnologyCDMAEVDORev0])
                {
                    status = ReachableVia3G;
                }
                else if([telephonyInfo.currentRadioAccessTechnology isEqualToString:CTRadioAccessTechnologyGPRS]||[telephonyInfo.currentRadioAccessTechnology isEqualToString:CTRadioAccessTechnologyEdge])
                {
                    status = ReachableVia2G;
                }
                else
                {
                    status = ReachableVia3G;
                }
            }
            break;
        default:
            break;
    }
    return status;
}

+ (BOOL)isWifiStatus {
    return AFNetworkReachabilityManager.sharedManager.networkReachabilityStatus == AFNetworkReachabilityStatusReachableViaWiFi;
}

+ (BOOL)isNotReachableStatus:(AFNetworkReachabilityStatus)status {
    return status == AFNetworkReachabilityStatusNotReachable;
}

@end
