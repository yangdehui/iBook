//
//  UIView+NetTipView.h
//  DKusedCar
//
//  Created by li on 2018/5/27.
//  Copyright © 2018年 danke. All rights reserved.
//

#import <UIKit/UIKit.h>


#define kNetTipViewTag   0xeef


#define descText  @""
#define buttontitle  @"重新加载"



typedef void (^NetTipBlock)(void);
@interface NetTipView : UIView

/**< 文字说明 */
@property (nonatomic, strong) UILabel *txtLabel;

/**< 点击的按钮 */
@property (nonatomic, strong) UIButton *button;

/**< 图片 */
@property (nonatomic, strong) UIImageView *imageView;

/**< 点击按钮的回调 */
@property (nonatomic, copy)   NetTipBlock toDoBlock;

@end


@interface UIView (NetTipView)
- (void)showNetTipViewWithToDoBlock:(NetTipBlock)block;
- (void)showNoNavigationNetTipViewWithToDoBlock:(NetTipBlock)block;
- (void)hideNetTipView;
- (NetTipView *)getNetTipView;

@end
