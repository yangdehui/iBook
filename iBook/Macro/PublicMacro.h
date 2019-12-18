//
//  PublicMacro.h
//  HMUsedCar
//
//  Created by 001 on 2018/6/20.
//  Copyright © 2018年 yunkuake. All rights reserved.
//

#ifndef PublicMacro_h
#define PublicMacro_h

//屏幕宽高/发现g模块评论使用
#define kScreenHeight [[UIScreen mainScreen] bounds].size.height
#define kScreenWidth [[UIScreen mainScreen] bounds].size.width
/** 字符串判空*/
#define kStringIsEmpty(str) ([str isKindOfClass:[NSNull class]] || str == nil || [str length] < 1 ? YES : NO )

#define ISIOS7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7)?YES:NO
#define ISIOS8 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8)?YES:NO

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define RGBA_COLOR(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define RGB_COLOR(r,g,b) RGBA_COLOR(r,g,b,1.0f)
#define RGB(a, b, c) [UIColor colorWithRed:(a / 255.0f) green:(b / 255.0f) blue:(c / 255.0f) alpha:1.0f]

// 定义通用颜色
#define kBlackColor         [UIColor blackColor]
#define kDarkGrayColor      [UIColor darkGrayColor]
#define kLightGrayColor     [UIColor lightGrayColor]
#define kWhiteColor         [UIColor whiteColor]
#define kGrayColor          [UIColor grayColor]
#define kRedColor           [UIColor redColor]
#define kGreenColor         [UIColor greenColor]
#define kBlueColor          [UIColor blueColor]
#define kCyanColor          [UIColor cyanColor]
#define kYellowColor        [UIColor yellowColor]
#define kMagentaColor       [UIColor magentaColor]
#define kOrangeColor        [UIColor orangeColor]
#define kPurpleColor        [UIColor purpleColor]
#define kClearColor         [UIColor clearColor]
//WX侧滑按钮颜色
#define kEditColor        RGB(200, 199, 204)
#define kDeletColor         RGB(250, 62, 59)
//随机色
#define kRandomFlatColor    [UIColor randomFlatColor]
//keywindow
#define keywindow [[UIApplication sharedApplication].windows lastObject]
//所有页面的背景颜色
#define LIGHT_BACKGROUND_COLOR [UIColor whiteColor]
/***********************MARK:-屏幕尺寸宏定义*********************/
//屏幕rect
#define SCREEN_BOUNDS ([UIScreen mainScreen].bounds)
//屏幕宽度
#define  SCREEN_WIDTH [[UIScreen mainScreen]bounds].size.width
//屏幕高度
#define  SCREEN_HEIGHT [[UIScreen mainScreen]bounds].size.height
//去除navigation之后的屏幕高度
#define  SCREEN_HEIGHT_WITHOUTBAR ([[UIScreen mainScreen]bounds].size.height - NavBarHeight - TabbarSafeBottomMargin)
//屏幕分辨率
#define SCREEN_RESOLUTION (SCREEN_WIDTH * SCREEN_HEIGHT * ([UIScreen mainScreen].scale))
//iPhone X系列判断
#define  IS_iPhoneX (CGSizeEqualToSize(CGSizeMake(375.f, 812.f), [UIScreen mainScreen].bounds.size) || CGSizeEqualToSize(CGSizeMake(812.f, 375.f), [UIScreen mainScreen].bounds.size)  || CGSizeEqualToSize(CGSizeMake(414.f, 896.f), [UIScreen mainScreen].bounds.size) || CGSizeEqualToSize(CGSizeMake(896.f, 414.f), [UIScreen mainScreen].bounds.size))
//状态栏高度
#define StatusBarHeight (IS_iPhoneX ? 44.f : 20.f)
//导航栏高度
#define NavBarHeight (44.f+StatusBarHeight)
//底部标签栏高度
#define TabBarHeight (49.f+TabbarSafeBottomMargin)
//安全区域高度
#define TabbarSafeBottomMargin     (IS_iPhoneX ? 34.f : 0.f)

#define aDeviceOrientation (SCREEN_WIDTH<SCREEN_HEIGHT)//横竖屏判断
#define KIphoneWH  SCREEN_WIDTH/(aDeviceOrientation? 375.0:667.0) //屏幕比例

/***********************控制器子控件初始Y坐标点*********************/
#define kOriginY    (IS_iPhoneX ? 88 : 64)
#define kTabbarY    (IS_iPhoneX ? 73 : 49)

/************************提示************************/
//总体网络相关
#define AbnormalNet             @"网络异常，请检查网络。"
#define BadNet                  @"网络不给力，请重试。"
#define AbnormalDATA            @"数据异常，请稍后再试。"

/************************字体大小************************/
#define FONT9   [UIFont systemFontOfSize:9.0]
#define FONT10  [UIFont systemFontOfSize:10.0]
#define FONT11  [UIFont systemFontOfSize:11.0]
#define FONT12  [UIFont systemFontOfSize:12.0]
#define FONT13  [UIFont systemFontOfSize:13.0]
#define FONT14  [UIFont systemFontOfSize:14.0]
#define FONT15  [UIFont systemFontOfSize:15.0]
#define FONT16  [UIFont systemFontOfSize:16.0]
#define FONT17  [UIFont systemFontOfSize:17.0]
#define FONT18  [UIFont systemFontOfSize:18.0]
#define FONT19  [UIFont systemFontOfSize:19.0]
#define FONT20  [UIFont systemFontOfSize:20.0]
#define FONT21  [UIFont systemFontOfSize:21.0]
#define FONT22  [UIFont systemFontOfSize:22.0]
#define FONT23  [UIFont systemFontOfSize:23.0]
#define FONT24  [UIFont systemFontOfSize:24.0]
#define FONT25  [UIFont systemFontOfSize:25.0]
#define FONT26  [UIFont systemFontOfSize:26.0]
#define FONT27  [UIFont systemFontOfSize:27.0]
#define FONT28  [UIFont systemFontOfSize:28.0]
#define FONT29  [UIFont systemFontOfSize:29.0]
#define FONT30  [UIFont systemFontOfSize:30.0]
#define FONT33  [UIFont systemFontOfSize:33.0]

/************************黑体字体大小************************/
#define FONT_ArialMT_8   [UIFont fontWithName:@"ArialMT" size:8.f]
#define FONT_ArialMT_9   [UIFont fontWithName:@"ArialMT" size:9.f]
#define FONT_ArialMT_10   [UIFont fontWithName:@"ArialMT" size:10.f]
#define FONT_ArialMT_11   [UIFont fontWithName:@"ArialMT" size:11.f]
#define FONT_ArialMT_12   [UIFont fontWithName:@"ArialMT" size:12.f]
#define FONT_ArialMT_13   [UIFont fontWithName:@"ArialMT" size:13.f]
#define FONT_ArialMT_14   [UIFont fontWithName:@"ArialMT" size:14.f]
#define FONT_ArialMT_15   [UIFont fontWithName:@"ArialMT" size:15.f]
#define FONT_ArialMT_16   [UIFont fontWithName:@"ArialMT" size:16.f]
#define FONT_ArialMT_17   [UIFont fontWithName:@"ArialMT" size:17.f]
#define FONT_ArialMT_18   [UIFont fontWithName:@"ArialMT" size:18.f]
#define FONT_ArialMT_19   [UIFont fontWithName:@"ArialMT" size:19.f]
#define FONT_ArialMT_20   [UIFont fontWithName:@"ArialMT" size:20.f]
#define FONT_ArialMT_35   [UIFont fontWithName:@"ArialMT" size:35.f]

/************************黑体加粗字体大小************************/
#define FONT_ArialBoldMT_8   [UIFont fontWithName:@"Arial-BoldMT" size:8.f]
#define FONT_ArialBoldMT_9   [UIFont fontWithName:@"Arial-BoldMT" size:9.f]
#define FONT_ArialBoldMT_10  [UIFont fontWithName:@"Arial-BoldMT" size:10.f]
#define FONT_ArialBoldMT_11  [UIFont fontWithName:@"Arial-BoldMT" size:11.f]
#define FONT_ArialBoldMT_12  [UIFont fontWithName:@"Arial-BoldMT" size:12.f]
#define FONT_ArialBoldMT_13  [UIFont fontWithName:@"Arial-BoldMT" size:13.f]
#define FONT_ArialBoldMT_14  [UIFont fontWithName:@"Arial-BoldMT" size:14.f]
#define FONT_ArialBoldMT_15  [UIFont fontWithName:@"Arial-BoldMT" size:15.f]
#define FONT_ArialBoldMT_16  [UIFont fontWithName:@"Arial-BoldMT" size:16.f]
#define FONT_ArialBoldMT_17  [UIFont fontWithName:@"Arial-BoldMT" size:17.f]
#define FONT_ArialBoldMT_18  [UIFont fontWithName:@"Arial-BoldMT" size:18.f]
#define FONT_ArialBoldMT_25  [UIFont fontWithName:@"Arial-BoldMT" size:25.f]

#pragma mark *** 3.0版本公用宏定义 ***

#define TEXT_SIZE_I         17
#define TEXT_SIZE_H         10
#define TEXT_SIZE_G         11
#define TEXT_SIZE_F         12
#define TEXT_SIZE_E         13
#define TEXT_SIZE_D         14
#define TEXT_SIZE_C         15
#define TEXT_SIZE_B         16
#define TEXT_SIZE_A         18

#define TEXT_COLOR_A        UIColorFromRGB(0x3f3f3f) ///黑
#define TEXT_COLOR_B        UIColorFromRGB(0x666666) ///灰 apl 0.8
#define TEXT_COLOR_C        UIColorFromRGB(0x999999) ///灰 apl 0.6
#define TEXT_COLOR_D        UIColorFromRGB(0xcccccc) ///灰 apl 0.4
#define TEXT_COLOR_E        UIColorFromRGB(0xfc6e51) ///接近-橘黄
#define TEXT_COLOR_F        UIColorFromRGB(0xdf6046) ///接近-橘黄


#define ITEM_SELECTOR_A     UIColorFromRGB(0xf3f3f3)

#define BG_GLOBAL_COLOR     UIColorFromRGB(0xffffff) ///白色
#define BG_GLOBAL_COLOR_A   UIColorFromRGB(0xf7f7f7) ///一点点灰

#endif /* PublicMacro_h */
