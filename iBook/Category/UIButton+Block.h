//
//  UIButton+Block.h
//  DKusedCar
//
//  Created by li on 2018/5/27.
//  Copyright © 2018年 danke. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^touchedButtonBlock)(NSInteger tag);

@interface UIButton (Block)
-(void)addActionHandler:(touchedButtonBlock)touchHandler;

@end
