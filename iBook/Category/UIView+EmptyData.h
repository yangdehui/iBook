//
//  UIView+EmptyData.h
//  DKusedCar
//
//  Created by li on 2018/5/27.
//  Copyright © 2018年 danke. All rights reserved.
//  缺省图方法

#import <UIKit/UIKit.h>

typedef void(^EmptyBtnBlock)(void);

@interface UIView (EmptyData)
/**< 图片 */
@property(nonatomic,strong) UIImageView * emptyplaceholderImageview;
/**< 文字说明 */
@property (nonatomic, strong) UILabel *emptyDesLabel;
/**< 文字详情描述*/
@property (nonatomic, strong) UILabel *emptyDetailsDesLabel;
/**< 按钮*/
@property (nonatomic, strong) UIButton *emptyButton;

@property (nonatomic, copy) EmptyBtnBlock emptyBtnBlock;


/** rowCount 数据源的count*/
- (void)viewDisplayWithImageName:(NSString *)name ifNecessaryForRowCount:(NSUInteger) rowCount;
- (void)viewDisplayWithDesText:(NSString *)des ifNecessaryForRowCount:(NSUInteger) rowCount;
- (void)viewDisplayWithDesText:(NSString *)des detailsDesText:(NSString *)detailsDes ifNecessaryForRowCount:(NSUInteger) rowCount;
-(void)viewDisplayWithImageName:(NSString *)imageName desText:(NSString *)des ifNecessaryForRowCount:(NSUInteger) rowCount;
-(void)viewDisplayWithImageName:(NSString *)imageName desText:(NSString *)des detailsDesText:(NSString *)detailsDes buttonTitle:(NSString *)btnTitle ifNecessaryForRowCount:(NSUInteger)rowCount emptyBtnBlock:(EmptyBtnBlock)btnBlock;
-(void)viewDisplayWithImageName:(NSString *)imageName desText:(NSString *)des detailsDesText:(NSString *)detailsDes buttonTitle:(NSString *)btnTitle buttonColor:(UIColor *)btnColor ifNecessaryForRowCount:(NSUInteger)rowCount emptyBtnBlock:(EmptyBtnBlock)btnBlock;

- (void)viewPresentDisplayWithImageName:(NSString *)name ifNecessaryForRowCount:(NSUInteger) rowCount;
- (void)viewPresentDisplayWithDesText:(NSString *)des ifNecessaryForRowCount:(NSUInteger) rowCount;
- (void)viewPresentDisplayWithImageName:(NSString *)name desText:(NSString *)des ifNecessaryForRowCount:(NSUInteger) rowCount;
-(void)hideViewDisplay;
@end
